/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;

import data.dao.OrderDao;
import model.Cart;
import model.User;

import data.driver.MySQLDriver;
import model.CartItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.OrderDTO;
import model.OrderDetailDTO;

/**
 *
 * @author huynhvminh
 */
public class OrderImpl implements OrderDao {

    @Override
    public void insertOrder(User user, Cart cart){
        Connection conn = null;
        PreparedStatement psOrder = null;
        PreparedStatement psDetail = null;
        PreparedStatement psUpdateStock = null;
        ResultSet rs = null;

        try {
            conn = MySQLDriver.getConnection();
            if (conn == null) {
                throw new SQLException("Không thể kết nối đến cơ sở dữ liệu (Connection is null).");
            }

            conn.setAutoCommit(false);

            // -----------------------------------------------------------
            // BƯỚC 1: INSERT VÀO BẢNG `Order`
            // -----------------------------------------------------------
            // Lưu ý: Trong MySQL, dùng dấu backtick ` ` bao quanh tên bảng Order
            String sqlOrder = "INSERT INTO `order` (DateOrder, UserID, Status) VALUES (?, ?, ?)";
            
            // Yêu cầu trả về Key tự sinh (OrderID)
            psOrder = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            
            // Chuyển đổi LocalDateTime hiện tại sang Timestamp cho SQL
            psOrder.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
            psOrder.setInt(2, user.getUserID());
            psOrder.setString(3, "Pending"); // Trạng thái mặc định
            
            int affectedRows = psOrder.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }

            // Lấy OrderID vừa sinh ra
            int orderId = 0;
            rs = psOrder.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            } else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }

            // -----------------------------------------------------------
            // BƯỚC 2: INSERT VÀO BẢNG Order_Detail VÀ UPDATE KHO
            // -----------------------------------------------------------
            String sqlDetail = "INSERT INTO order_Detail (OrderID, VariantID, Quantity_Order, Price_Order) VALUES (?, ?, ?, ?)";
            
            // Câu lệnh trừ tồn kho
            String sqlUpdateStock = "UPDATE variant SET Stock_quantity = Stock_quantity - ? WHERE VariantID = ?";

            psDetail = conn.prepareStatement(sqlDetail);
            psUpdateStock = conn.prepareStatement(sqlUpdateStock);

            // Duyệt danh sách sản phẩm trong giỏ
            for (CartItem item : cart.getItems().values()) {
                // -- Set tham số cho Detail --
                psDetail.setInt(1, orderId);
                psDetail.setInt(2, item.getVariantID());
                psDetail.setInt(3, item.getQuantity());
                psDetail.setDouble(4, item.getPrice());
                psDetail.addBatch(); // Thêm vào batch để chạy 1 lần

                // -- Set tham số cho Update Stock --
                psUpdateStock.setInt(1, item.getQuantity()); // Số lượng cần trừ
                psUpdateStock.setInt(2, item.getVariantID()); // ID sản phẩm
                psUpdateStock.addBatch();
            }

            // Thực thi Batch
            psDetail.executeBatch();
            psUpdateStock.executeBatch();

            // -----------------------------------------------------------
            // BƯỚC 3: COMMIT (XÁC NHẬN TRANSACTION)
            // -----------------------------------------------------------
            conn.commit();

        } catch (Exception e) {
            // NẾU CÓ LỖI: ROLLBACK (HOÀN TÁC)
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            // Đóng resources để tránh rò rỉ bộ nhớ
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (psOrder != null) try { psOrder.close(); } catch (SQLException e) {}
            if (psDetail != null) try { psDetail.close(); } catch (SQLException e) {}
            if (psUpdateStock != null) try { psUpdateStock.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    }
    public List<OrderDTO> getAllOrders() {
        List<OrderDTO> list = new ArrayList<>();
        String sql = "SELECT o.OrderID, o.DateOrder, o.Status, u.Username, " +
                     "SUM(od.Quantity_Order * od.Price_Order) as Total " +
                     "FROM `order` o " + // Order là từ khóa, cần backtick
                     "JOIN `user` u ON o.UserID = u.UserID " +
                     "LEFT JOIN `order_detail` od ON o.OrderID = od.OrderID " +
                     "GROUP BY o.OrderID, o.DateOrder, o.Status, u.Username " +
                     "ORDER BY o.DateOrder DESC";

        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new OrderDTO(
                    rs.getInt("OrderID"),
                    rs.getDate("DateOrder"),
                    rs.getString("Username"),
                    rs.getDouble("Total"), // Tổng tiền tính được từ SQL
                    rs.getString("Status")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean cancelOrder(int orderId) {
        Connection conn = null;
        PreparedStatement psUpdateStatus = null;
        PreparedStatement psGetDetail = null;
        PreparedStatement psUpdateStock = null;
        ResultSet rs = null;

        String sqlGetDetail = "SELECT VariantID, Quantity_Order FROM order_detail WHERE OrderID = ?";
        String sqlUpdateStock = "UPDATE variant SET Stock_quantity = Stock_quantity + ? WHERE VariantID = ?";
        String sqlUpdateStatus = "UPDATE `order` SET Status = 'Cancelled' WHERE OrderID = ?";

        try {
            conn = MySQLDriver.getConnection();
            conn.setAutoCommit(false);
            psGetDetail = conn.prepareStatement(sqlGetDetail);
            psGetDetail.setInt(1, orderId);
            rs = psGetDetail.executeQuery();
            psUpdateStock = conn.prepareStatement(sqlUpdateStock);
            while (rs.next()) {
                int variantId = rs.getInt("VariantID");
                int quantity = rs.getInt("Quantity_Order");
                psUpdateStock.setInt(1, quantity);
                psUpdateStock.setInt(2, variantId);
                psUpdateStock.executeUpdate();
            }
            psUpdateStatus = conn.prepareStatement(sqlUpdateStatus);
            psUpdateStatus.setInt(1, orderId);
            int rows = psUpdateStatus.executeUpdate();

            if (rows > 0) {
                conn.commit();
                return true;
            } else {
                conn.rollback();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (conn != null) conn.rollback(); // Gặp lỗi -> Rollback ngay
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return false;
        } finally {
            try {
                if (rs != null) rs.close();
                if (psGetDetail != null) psGetDetail.close();
                if (psUpdateStock != null) psUpdateStock.close();
                if (psUpdateStatus != null) psUpdateStatus.close();
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public boolean updateStatus(int orderId, String newStatus) {
        String sql = "UPDATE `order` SET Status = ? WHERE OrderID = ?";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, newStatus);
            ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<OrderDetailDTO> getOrderDetailsById(int orderId) {
        List<OrderDetailDTO> list = new ArrayList<>();
        String sql = "SELECT p.ProductID, p.ProductName, v.Color, od.Quantity_Order, od.Price_Order, " +
                     "(SELECT i.Image_url FROM image i WHERE i.VariantID = v.VariantID ORDER BY i.Sort_order ASC LIMIT 1) as ImageUrl " +
                     "FROM order_detail od " +
                     "JOIN variant v ON od.VariantID = v.VariantID " +
                     "JOIN product p ON v.ProductID = p.ProductID " +
                     "WHERE od.OrderID = ?";

        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                list.add(new OrderDetailDTO(
                    rs.getInt("ProductID"),
                    rs.getString("ProductName"),
                    rs.getString("Color"),
                    rs.getString("ImageUrl"),
                    rs.getInt("Quantity_Order"),
                    rs.getDouble("Price_Order")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    public User getOrderCustomerInfo(int orderId) {
        String sql = "SELECT u.* FROM `user` u JOIN `order` o ON u.UserID = o.UserID WHERE o.OrderID = ?";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUsername(rs.getString("Username"));
                u.setPhone(rs.getString("Phone"));
                u.setAddress(rs.getString("Address"));
                u.setEmail(rs.getString("Email"));
                return u;
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }
    public OrderDTO getOrderById(int orderId) {
        String sql = "SELECT o.OrderID, o.DateOrder, o.Status, u.Username, " +
                     "SUM(od.Quantity_Order * od.Price_Order) as Total " +
                     "FROM `order` o " +
                     "JOIN `user` u ON o.UserID = u.UserID " +
                     "LEFT JOIN `order_detail` od ON o.OrderID = od.OrderID " +
                     "WHERE o.OrderID = ? " +  // Thêm điều kiện này
                     "GROUP BY o.OrderID, o.DateOrder, o.Status, u.Username";

        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, orderId);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new OrderDTO(
                        rs.getInt("OrderID"),
                        rs.getDate("DateOrder"),
                        rs.getString("Username"),
                        rs.getDouble("Total"),
                        rs.getString("Status")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }    

    public boolean deleteOrder(int orderId) {
        String sqlDetail = "DELETE FROM order_detail WHERE OrderID = ?";
        String sqlOrder = "DELETE FROM `order` WHERE OrderID = ?";

        Connection conn = null;
        try {
            conn = MySQLDriver.getConnection();
            conn.setAutoCommit(false); 

            try (PreparedStatement ps1 = conn.prepareStatement(sqlDetail)) {
                ps1.setInt(1, orderId);
                ps1.executeUpdate();
            }

            try (PreparedStatement ps2 = conn.prepareStatement(sqlOrder)) {
                ps2.setInt(1, orderId);
                int rows = ps2.executeUpdate();

                if (rows > 0) {
                    conn.commit();
                    return true;
                }
            }
            conn.rollback();
            return false;

        } catch (Exception e) {
            e.printStackTrace();
            try { if(conn != null) conn.rollback(); } catch(Exception ex){}
            return false;
        } finally {
            try { if(conn != null) { conn.setAutoCommit(true); conn.close(); } } catch(Exception e){}
        }
    }
    public double getDoanhThu() {
        String sql =
            "SELECT COALESCE(SUM(od.Quantity_Order * od.Price_Order), 0) AS total " +
            "FROM order o " +
            "JOIN order_detail od ON o.OrderID = od.OrderID " +
            "WHERE o.Status = 'Success'";

        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getDouble("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0.0;
    }
    public List<OrderDTO> getOrdersByUser(int userId) {
        List<OrderDTO> list = new ArrayList<>();
        String sql =
            "SELECT o.OrderID, o.DateOrder, o.Status, u.Username, " +
            "       COALESCE(SUM(od.Quantity_Order * od.Price_Order), 0) AS Total " +
            "FROM `order` o " +
            "JOIN `user` u ON o.UserID = u.UserID " +
            "LEFT JOIN `order_detail` od ON o.OrderID = od.OrderID " +
            "WHERE o.UserID = ? " +
            "GROUP BY o.OrderID, o.DateOrder, o.Status, u.Username " +
            "ORDER BY o.DateOrder DESC";

        try (Connection conn = MySQLDriver.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new OrderDTO(
                        rs.getInt("OrderID"),
                        rs.getDate("DateOrder"),
                        rs.getString("Username"),
                        rs.getDouble("Total"),
                        rs.getString("Status")
                    ));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<OrderDetailDTO> getOrderDetailsByIdAndUser(int orderId, int userId) {
        List<OrderDetailDTO> list = new ArrayList<>();
        String sql =
            "SELECT p.ProductID, p.ProductName, v.Color, od.Quantity_Order, od.Price_Order, " +
            "       (SELECT i.Image_url FROM image i WHERE i.VariantID = v.VariantID " +
            "        ORDER BY i.Sort_order ASC LIMIT 1) AS ImageUrl " +
            "FROM order_detail od " +
            "JOIN variant v ON od.VariantID = v.VariantID " +
            "JOIN product p ON v.ProductID = p.ProductID " +
            "JOIN `order` o ON od.OrderID = o.OrderID " +
            "WHERE od.OrderID = ? AND o.UserID = ?";

        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ps.setInt(2, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new OrderDetailDTO(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Color"),
                        rs.getString("ImageUrl"),
                        rs.getInt("Quantity_Order"),
                        rs.getDouble("Price_Order")
                    ));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
