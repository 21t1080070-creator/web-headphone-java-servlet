/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;

import data.dao.VariantDao;
import java.util.ArrayList;
import java.util.List;
import model.Variant;
import data.driver.MySQLDriver;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Logger;
import java.util.logging.Level;
import model.CartItem;
import model.ProductVariantDTO;


public class VariantImpl implements VariantDao {

    @Override
    public CartItem getCartItemInfo(int variantId) {
        String sql = "SELECT v.VariantID, p.ProductID, p.ProductName, v.Color, v.Price, " +
                     "(SELECT i.Image_url FROM image i WHERE i.VariantID = v.VariantID ORDER BY i.Sort_order ASC LIMIT 1) AS MainImage " +
                     "FROM variant v " +
                     "JOIN product p ON v.ProductID = p.ProductID " +
                     "WHERE v.VariantID = ?";
        
        try (Connection conn = new MySQLDriver().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, variantId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                CartItem item = new CartItem();
                item.setVariantID(rs.getInt("VariantID"));
                item.setProductID(rs.getInt("ProductID"));
                item.setProductName(rs.getString("ProductName"));
                item.setColorName(rs.getString("Color"));
                item.setPrice(rs.getDouble("Price"));
                
                // Xử lý ảnh: Nếu null thì gán ảnh mặc định
                String img = rs.getString("MainImage");
                if (img == null) {
                    item.setImageUrl("https://via.placeholder.com/150"); // Ảnh rỗng
                } else {
                    // Chỉnh lại đường dẫn ảnh cho đúng với project của bạn
                    // Ví dụ: assets/images/Tên_SP/ảnh.jpg
                    // Lưu ý: Logic ghép chuỗi này tùy thuộc vào cách bạn lưu trong DB
                    item.setImageUrl(img); 
                }
                item.setQuantity(0); 
                
                return item;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Không tìm thấy variant
    }
    public boolean insertVariant(int productId, String color, double price, int stock) {
        String sql = "INSERT INTO variant (ProductID, Color, Price, Stock_quantity) VALUES (?, ?, ?, ?)";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            ps.setString(2, color);
            ps.setDouble(3, price);
            ps.setInt(4, stock);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    // Trong ProductDAO.java

// 1. Lấy thông tin 1 variant theo ID (Dùng cho trang Edit Variant)
    public ProductVariantDTO getVariantById(int variantId) {
        String sql = "SELECT * FROM variant WHERE VariantID = ?";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, variantId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new ProductVariantDTO(
                        rs.getInt("VariantID"),
                        rs.getString("Color"),
                        rs.getDouble("Price"),
                        rs.getInt("Stock_quantity")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateVariant(int variantId, String color, double price, int stock) {
        String sql = "UPDATE variant SET Color = ?, Price = ?, Stock_quantity = ? WHERE VariantID = ?";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, color);
            ps.setDouble(2, price);
            ps.setInt(3, stock);
            ps.setInt(4, variantId);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<ProductVariantDTO> getAllVariantsFullInfo() {
        List<ProductVariantDTO> list = new ArrayList<>();

        // Query lấy ID, Màu, Tồn kho và Tên Sản Phẩm
        String sql = "SELECT v.VariantID, v.Color, v.Stock_quantity, v.Price, p.ProductName " +
                     "FROM variant v " +
                     "JOIN product p ON v.ProductID = p.ProductID " +
                     "ORDER BY p.ProductName, v.Color";

        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ProductVariantDTO dto = new ProductVariantDTO();

                dto.setVariantID(rs.getInt("VariantID"));
                dto.setColor(rs.getString("Color"));
                dto.setStockQuantity(rs.getInt("Stock_quantity"));
                dto.setPrice(rs.getDouble("Price")); // Giá bán (để tham khảo)

                // Set tên sản phẩm
                dto.setProductName(rs.getString("ProductName"));

                // Lưu ý: Không cần load images ở đây vì chỉ dùng cho dropdown
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}