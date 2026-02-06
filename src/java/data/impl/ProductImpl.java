/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;

import data.dao.ProductDao;
import data.driver.MySQLDriver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CartItem;
import model.Product;
import model.ProductDetailDTO;
import model.ProductHomeDTO;
import model.ProductVariantDTO;

/**
 *
 * @author huynhvminh
 */
public class ProductImpl implements ProductDao {

    @Override
    public List<Product> findAll() {
        List<Product> listProduct = new ArrayList<>();
        String str = "select * from product";
        try {
            Connection con = MySQLDriver.getConnection();
            PreparedStatement sttm = con.prepareStatement(str);
            ResultSet rs = sttm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                int id_category = rs.getInt("CategoryID");
                String name = rs.getString("ProductName");
                String description = rs.getString("Description");
                listProduct.add(new Product(id, name, description, id_category));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;
    }

    @Override
    public Product findProduct(int id_product) {
        String sql = "select * from product where ProductID=" + id_product;
        try {
            Connection con = MySQLDriver.getConnection();
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            if (rs.next()) {
                return new Product(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<ProductHomeDTO> getProductsForHomePage(int categoryID) {
        List<ProductHomeDTO> list = new ArrayList<>();
        String sql = "SELECT p.ProductID, p.ProductName, p.Description, "
                + "MIN(v.Price) as Price, "
                + "MIN(i.Image_url) as ImageUrl, "
                + "MAX(i.Image_url) as SecondImageUrl "
                + // Lấy ảnh 2 
                "FROM product p "
                + "LEFT JOIN variant v ON p.ProductID = v.ProductID "
                + "LEFT JOIN image i ON v.VariantID = i.VariantID "
                + "WHERE p.CategoryID = ? "
                + "GROUP BY p.ProductID, p.ProductName, p.Description";

        try {
            Connection con = MySQLDriver.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, categoryID);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductHomeDTO dto = new ProductHomeDTO(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getDouble("Price"),
                        rs.getString("ImageUrl"),
                        rs.getString("SecondImageUrl")
                );
                list.add(dto);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ProductDetailDTO getProductDetail(int productID) {
        ProductDetailDTO product = null;
        try {
            Connection con = MySQLDriver.getConnection();

            String sqlProduct = "SELECT p.ProductID, p.ProductName, p.Description, c.CategoryName "
                    + "FROM product p JOIN category c ON p.CategoryID = c.CategoryID "
                    + "WHERE p.ProductID = ?";
            PreparedStatement ps = con.prepareStatement(sqlProduct);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                product = new ProductDetailDTO();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setDescription(rs.getString("Description"));
                product.setCategoryName(rs.getString("CategoryName"));
            }

            if (product == null) {
                return null;
            }

            String sqlVariants = "SELECT VariantID, Color, Price, Stock_quantity FROM variant WHERE ProductID = ?";
            PreparedStatement ps2 = con.prepareStatement(sqlVariants);
            ps2.setInt(1, productID);
            ResultSet rs2 = ps2.executeQuery();

            while (rs2.next()) {
                product.getVariants().add(new ProductVariantDTO(
                        rs2.getInt("VariantID"),
                        rs2.getString("Color"),
                        rs2.getDouble("Price"),
                        rs2.getInt("Stock_quantity")
                ));
            }

            String sqlImages = "SELECT i.Image_url, i.VariantID FROM image i "
                    + "JOIN variant v ON i.VariantID = v.VariantID "
                    + "WHERE v.ProductID = ?";
            PreparedStatement ps3 = con.prepareStatement(sqlImages);
            ps3.setInt(1, productID);
            ResultSet rs3 = ps3.executeQuery();
            Map<Integer, List<String>> imageMap = new HashMap<>();

            while (rs3.next()) {
                int vId = rs3.getInt("VariantID");
                String imgUrl = rs3.getString("Image_url");

                // Nếu chưa có list cho ID này thì tạo mới
                imageMap.putIfAbsent(vId, new ArrayList<>());
                // Thêm ảnh vào list tương ứng
                imageMap.get(vId).add(imgUrl);
            }
            for (ProductVariantDTO v : product.getVariants()) {
                if (imageMap.containsKey(v.getVariantID())) {
                    v.setImages(imageMap.get(v.getVariantID()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Nhớ đóng connection (conn.close()) ở đây
        }

        return product;
    }

    public CartItem getProductForCart(int variantId) {
        CartItem item = null;
        // Query nối 3 bảng: Variant, Product, Image
        // Chỉ lấy 1 ảnh đại diện (LIMIT 1)
        String sql = "SELECT v.VariantID, p.ProductID, p.ProductName, v.Color, v.Price, i.Image_url "
                + "FROM variant v "
                + "JOIN product p ON v.ProductID = p.ProductID "
                + "LEFT JOIN image i ON v.VariantID = i.VariantID "
                + "WHERE v.VariantID = ? "
                + "LIMIT 1";

        try (Connection con = MySQLDriver.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, variantId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                item = new CartItem(
                        rs.getInt("VariantID"),
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Color"),
                        rs.getString("Image_url"),
                        rs.getDouble("Price"),
                        0
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return item;
    }

    public List<ProductHomeDTO> getAllProductsForAdmin() {
        List<ProductHomeDTO> list = new ArrayList<>();
        String query = "SELECT "
                + "p.ProductID, "
                + "p.ProductName, "
                + "c.CategoryName, "
                + "MIN(v.Price) AS MinPrice, "
                + "SUM(v.Stock_quantity) AS TotalStock, "
                + "(SELECT i.Image_url FROM image i JOIN variant v2 ON i.VariantID = v2.VariantID "
                + " WHERE v2.ProductID = p.ProductID ORDER BY i.Sort_order ASC LIMIT 1) AS ImageUrl "
                + "FROM product p "
                + "JOIN category c ON p.CategoryID = c.CategoryID "
                + // Đã sửa chỗ này
                "LEFT JOIN variant v ON p.ProductID = v.ProductID "
                + "GROUP BY p.ProductID, p.ProductName, c.CategoryName "
                + "ORDER BY p.ProductID DESC";

        try (Connection conn = MySQLDriver.getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ProductHomeDTO product = new ProductHomeDTO();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setCategoryName(rs.getString("CategoryName"));

                // Xử lý giá trị có thể null (do LEFT JOIN)
                product.setPrice(rs.getObject("MinPrice") != null ? rs.getDouble("MinPrice") : 0);
                product.setTotalStock(rs.getObject("TotalStock") != null ? rs.getInt("TotalStock") : 0);

                product.setImageUrl(rs.getString("ImageUrl"));

                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ProductDetailDTO getProductBasicInfo(int productId) {
        String sql = "SELECT p.ProductID, p.ProductName, p.Description, c.CategoryName "
                + "FROM product p "
                + "JOIN category c ON p.CategoryID = c.CategoryID "
                + "WHERE p.ProductID = ?";

        try (Connection conn = MySQLDriver.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    ProductDetailDTO dto = new ProductDetailDTO();
                    dto.setProductID(rs.getInt("ProductID"));
                    dto.setProductName(rs.getString("ProductName"));
                    dto.setDescription(rs.getString("Description"));
                    dto.setCategoryName(rs.getString("CategoryName"));
                    return dto;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<ProductVariantDTO> getVariantsByProductId(int productId) {
        List<ProductVariantDTO> list = new ArrayList<>();
        // Query lấy Variant và có thể lấy thêm 1 ảnh đại diện cho variant đó nếu muốn (Optional)
        String sql = "SELECT v.VariantID, v.Color, v.Price, v.Stock_quantity "
                + "FROM variant v "
                + "WHERE v.ProductID = ?";

        try (Connection conn = MySQLDriver.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    // Tạo đối tượng VariantDTO
                    // Lưu ý: Constructor của bạn là (id, color, price, stock)
                    ProductVariantDTO variant = new ProductVariantDTO(
                            rs.getInt("VariantID"),
                            rs.getString("Color"),
                            rs.getDouble("Price"),
                            rs.getInt("Stock_quantity")
                    );
                    list.add(variant);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteVariant(int variantId) {
        String sql = "DELETE FROM variant WHERE VariantID = ?";
        try (Connection conn = MySQLDriver.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, variantId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean insertProduct(ProductDetailDTO product, int categoryId) {
        String sql = "INSERT INTO Product (ProductName, Description, CategoryID) VALUES (?, ?, ?)";

        try (Connection conn = MySQLDriver.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setInt(3, categoryId);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getProductIdByVariantId(int variantId) {
        String sql = "SELECT ProductID FROM variant WHERE VariantID = ?";
        try (Connection conn = MySQLDriver.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, variantId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("ProductID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean deleteProductFull(int productId) {
        Connection conn = null;
        PreparedStatement ps = null;

        // Câu lệnh SQL
        String sqlDeleteImages = "DELETE FROM image WHERE VariantID IN (SELECT VariantID FROM variant WHERE ProductID = ?)";
        String sqlDeleteVariants = "DELETE FROM variant WHERE ProductID = ?";
        String sqlDeleteProduct = "DELETE FROM product WHERE ProductID = ?";

        try {
            conn = MySQLDriver.getConnection();

            // --- BẮT ĐẦU TRANSACTION ---
            conn.setAutoCommit(false); // Quan trọng: Tắt auto commit để xóa đồng loạt

            // 1. Xóa Ảnh trước
            ps = conn.prepareStatement(sqlDeleteImages);
            ps.setInt(1, productId);
            ps.executeUpdate();
            ps.close(); // Đóng statement này để dùng cái mới

            // 2. Xóa Variants
            ps = conn.prepareStatement(sqlDeleteVariants);
            ps.setInt(1, productId);
            ps.executeUpdate();
            ps.close();

            // 3. Xóa Product
            ps = conn.prepareStatement(sqlDeleteProduct);
            ps.setInt(1, productId);
            int rows = ps.executeUpdate();

            // --- KẾT THÚC ---
            conn.commit(); // Xác nhận mọi thay đổi
            return rows > 0;

        } catch (Exception e) {
            // Nếu có lỗi, rollback lại toàn bộ (không xóa gì cả để bảo toàn dữ liệu)
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            // Đóng kết nối
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.setAutoCommit(true); // Trả lại trạng thái mặc định
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public boolean updateProduct(int productId, String name, String desc, int cateId) {
        String sql = "UPDATE product SET ProductName = ?, Description = ?, CategoryID = ? WHERE ProductID = ?";
        try (Connection conn = MySQLDriver.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, desc);
            ps.setInt(3, cateId);
            ps.setInt(4, productId);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<ProductHomeDTO> searchByName(String keyword) {
        List<ProductHomeDTO> list = new ArrayList<>();

        // Giữ nguyên các phần SELECT, JOIN, GROUP BY
        // Chỉ thay đổi phần WHERE
        String sql = "SELECT p.ProductID, p.ProductName, p.Description, "
                + "MIN(v.Price) as Price, "
                + "MIN(i.Image_url) as ImageUrl, "
                + "MAX(i.Image_url) as SecondImageUrl "
                + "FROM product p "
                + "LEFT JOIN variant v ON p.ProductID = v.ProductID "
                + "LEFT JOIN image i ON v.VariantID = i.VariantID "
                + "WHERE p.ProductName LIKE ? "
                + // <--- Thay đổi ở đây
                "GROUP BY p.ProductID, p.ProductName, p.Description";

        try {
            Connection con = MySQLDriver.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            // Thiết lập tham số tìm kiếm với dấu %
            ps.setString(1, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductHomeDTO dto = new ProductHomeDTO(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getDouble("Price"),
                        rs.getString("ImageUrl"),
                        rs.getString("SecondImageUrl")
                );
                list.add(dto);
            }
            con.close(); // Nhớ đóng kết nối
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
