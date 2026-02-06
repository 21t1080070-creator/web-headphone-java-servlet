/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;

import data.dao.SupplierDao;
import java.util.ArrayList;
import java.util.List;
import model.Supplier;
import data.driver.MySQLDriver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author huynhvminh
 */
public class SupplierImpl implements SupplierDao {
    public List<Supplier> getAllSuppliers() {
        List<Supplier> list = new ArrayList<>();
        String sql = "SELECT * FROM supplier"; // Tên bảng có thể là supplier (thường)
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                list.add(new Supplier(
                    rs.getInt("SupplierID"),
                    rs.getString("SupplierName"),
                    rs.getString("Phone"),
                    rs.getString("Address")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    public boolean insertSupplier(Supplier s) {
        String sql = "INSERT INTO supplier (SupplierName, Phone, Address) VALUES (?, ?, ?)";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, s.getSupplierName());
            ps.setString(2, s.getPhone());
            ps.setString(3, s.getAddress());
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); return false; }
    }
    public boolean updateSupplier(Supplier s) {
        String sql = "UPDATE supplier SET SupplierName = ?, Phone = ?, Address = ? WHERE SupplierID = ?";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, s.getSupplierName());
            ps.setString(2, s.getPhone());
            ps.setString(3, s.getAddress());
            ps.setInt(4, s.getSupplierId());
            
            return ps.executeUpdate() > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean deleteSupplier(int id) {
        String sql = "DELETE FROM supplier WHERE SupplierID = ?";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
