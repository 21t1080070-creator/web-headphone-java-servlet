/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;

import data.dao.ImportDao;
import data.driver.MySQLDriver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Import;
import model.Import_Detail;

public class ImportImpl implements ImportDao {
    public int createImport(int supplierId) {
        String sql = "INSERT INTO import (DateImport, SupplierID, Status, TotalAmount) VALUES (NOW(), ?, 'Pending', 0)";
        
        try (Connection conn = MySQLDriver.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) { 
            ps.setInt(1, supplierId);
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return -1;
    }
    public Import getImportById(int id) {
        String sql = "SELECT i.*, s.SupplierName FROM import i " +
                     "JOIN supplier s ON i.SupplierID = s.SupplierID " +
                     "WHERE i.ImportID = ?";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                Import imp = new Import();
                imp.setImportId(rs.getInt("ImportID"));
                imp.setDateImport(rs.getDate("DateImport"));
                imp.setSupplierId(rs.getInt("SupplierID"));
                imp.setSupplierName(rs.getString("SupplierName"));
                imp.setStatus(rs.getString("Status"));
                imp.setTotalAmount(rs.getDouble("TotalAmount"));
                return imp;
            }
        } catch(Exception e) { e.printStackTrace(); }
        return null;
    }
    public List<Import> getAllImports() {
        List<Import> list = new ArrayList<>();
        String sql = "SELECT i.ImportID, i.DateImport, i.Status, i.TotalAmount, s.SupplierName " +
                     "FROM import i " +
                     "JOIN supplier s ON i.SupplierID = s.SupplierID " +
                     "ORDER BY i.ImportID DESC";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while(rs.next()) {
                Import imp = new Import();
                imp.setImportId(rs.getInt("ImportID"));
                imp.setDateImport(rs.getDate("DateImport"));
                imp.setSupplierName(rs.getString("SupplierName"));
                imp.setStatus(rs.getString("Status"));
                imp.setTotalAmount(rs.getDouble("TotalAmount"));
                list.add(imp);
            }
        } catch(Exception e) { e.printStackTrace(); }
        return list;
    }
    public boolean addImportDetail(Import_Detail detail) {        
        String sql = "INSERT INTO import_detail (ImportID, VariantID, Quantity_Import, PriceImport) VALUES (?, ?, ?, ?)";
        String sqlUpdateTotal = "UPDATE import SET TotalAmount = TotalAmount + ? WHERE ImportID = ?";
        
        Connection conn = null;
        try {
            conn = MySQLDriver.getConnection();
            conn.setAutoCommit(false);
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, detail.getImportID());
                ps.setInt(2, detail.getVariantID());
                ps.setInt(3, detail.getQuantity_Import());
                ps.setDouble(4, detail.getPriceImport());
                ps.executeUpdate();
            }            
            try (PreparedStatement ps2 = conn.prepareStatement(sqlUpdateTotal)) {
                ps2.setDouble(1, detail.getTotal()); 
                ps2.setInt(2, detail.getImportID());
                ps2.executeUpdate();
            }
            
            conn.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            try { if(conn!=null) conn.rollback(); } catch(Exception ex){}
            return false;
        } finally {
             try { if(conn!=null) { conn.setAutoCommit(true); conn.close(); } } catch(Exception e){}
        }
    }
    public List<Import_Detail> getImportDetails(int importId) {
        List<Import_Detail> list = new ArrayList<>();
        String sql = "SELECT d.*, v.Color, p.ProductName " +
                     "FROM import_detail d " +
                     "JOIN variant v ON d.VariantID = v.VariantID " +
                     "JOIN product p ON v.ProductID = p.ProductID " +
                     "WHERE d.ImportID = ?";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, importId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Import_Detail d = new Import_Detail();
                d.setImportID(rs.getInt("ImportID"));
                d.setVariantID(rs.getInt("VariantID"));
                d.setQuantity_Import(rs.getInt("Quantity_Import"));
                d.setPriceImport(rs.getDouble("PriceImport"));
                d.setProductName(rs.getString("ProductName"));
                d.setColor(rs.getString("Color"));
                list.add(d);
            }
        } catch(Exception e) { e.printStackTrace(); }
        return list;
    }
    public boolean completeImport(int importId) {
        String sqlGetDetails = "SELECT VariantID, Quantity_Import FROM import_detail WHERE ImportID = ?";
        String sqlUpdateStock = "UPDATE variant SET Stock_quantity = Stock_quantity + ? WHERE VariantID = ?";
        String sqlComplete = "UPDATE import SET Status = 'Completed' WHERE ImportID = ?";
        
        Connection conn = null;
        try {
            conn = MySQLDriver.getConnection();
            conn.setAutoCommit(false);
            
            try (PreparedStatement psGet = conn.prepareStatement(sqlGetDetails);
                 PreparedStatement psStock = conn.prepareStatement(sqlUpdateStock)) {
                
                psGet.setInt(1, importId);
                ResultSet rs = psGet.executeQuery();
                
                while(rs.next()) {
                    int vId = rs.getInt("VariantID");
                    int qty = rs.getInt("Quantity_Import");
                    
                    psStock.setInt(1, qty);
                    psStock.setInt(2, vId);
                    psStock.executeUpdate();
                }
            }            
            try (PreparedStatement psStatus = conn.prepareStatement(sqlComplete)) {
                psStatus.setInt(1, importId);
                psStatus.executeUpdate();
            }
            
            conn.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            try { if(conn!=null) conn.rollback(); } catch(Exception ex){}
            return false;
        } finally {
            try { if(conn!=null) { conn.setAutoCommit(true); conn.close(); } } catch(Exception e){}
        }
    }
    public void deleteImportDetail(int importId, int variantId) {
        String sqlGetAmount = "SELECT Quantity_Import, PriceImport FROM import_detail WHERE ImportID = ? AND VariantID = ?";
        String sqlDelete = "DELETE FROM import_detail WHERE ImportID = ? AND VariantID = ?";
        String sqlUpdateTotal = "UPDATE import SET TotalAmount = TotalAmount - ? WHERE ImportID = ?";
        
        Connection conn = null;
        try {
            conn = MySQLDriver.getConnection();
            conn.setAutoCommit(false); 
            
            double amountToDeduct = 0;
            
            // 1. Tính số tiền cần trừ
            try (PreparedStatement ps = conn.prepareStatement(sqlGetAmount)) {
                ps.setInt(1, importId);
                ps.setInt(2, variantId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    amountToDeduct = rs.getInt("Quantity_Import") * rs.getDouble("PriceImport");
                }
            }            
            try (PreparedStatement ps = conn.prepareStatement(sqlDelete)) {
                ps.setInt(1, importId);
                ps.setInt(2, variantId);
                ps.executeUpdate();
            }            
            try (PreparedStatement ps = conn.prepareStatement(sqlUpdateTotal)) {
                ps.setDouble(1, amountToDeduct);
                ps.setInt(2, importId);
                ps.executeUpdate();
            }
            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
            try { if(conn!=null) conn.rollback(); } catch(Exception ex){}
        } finally {
            try { if(conn!=null) { conn.setAutoCommit(true); conn.close(); } } catch(Exception e){}
        }
    }
}
