/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;

import data.dao.CategoryDao;
import data.driver.MySQLDriver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author huynhvminh
 */
public class CategoryImpl implements CategoryDao {

    @Override
    public List<Category> findAll() {
        List<Category> listCategory = new ArrayList<>();
        String str="select * from category ORDER BY CategoryID ASC";
        try {
            Connection con = MySQLDriver.getConnection();
            PreparedStatement sttm = con.prepareStatement(str);
            ResultSet rs = sttm.executeQuery();
            while(rs.next()){
                int id = rs.getInt("CategoryID");
                String name = rs.getString("CategoryName");
                listCategory.add(new Category(id, name));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCategory;
    }

    @Override
    public void insert(String name) {
        String sql = "INSERT INTO category (CategoryName) VALUES (?)";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM category WHERE CategoryID = ?";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public void update(Category c) {
        String sql = "UPDATE category SET CategoryName = ? WHERE CategoryID = ?";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getCategoryName());
            ps.setInt(2, c.getCategoryID());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
    
}
