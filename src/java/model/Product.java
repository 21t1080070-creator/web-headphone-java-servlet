/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author huynhvminh
 */
public class Product {
    private int ProductID;
    private String ProductName, Description;
    private int CategoryID;

    public Product() {
    }
    public Product(int ProductID, String ProductName, String Description, int CategoryID) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.Description = Description;
        this.CategoryID = CategoryID;
    }
    public Product(ResultSet rs) throws SQLException {
        this.ProductID = rs.getInt("ProductID");
        this.ProductName = rs.getString("ProductName");
        this.Description = rs.getString("Description");
        this.CategoryID=rs.getInt("CategoryID");
    }
    public int getProductID() {
        return ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public String getDescription() {
        return Description;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }
    
}
