/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author huynhvminh
 */
public class Category {
    public int CategoryID;
    public String CategoryName;

    public Category(int CategoryID, String CategoryName) {
        this.CategoryID = CategoryID;
        this.CategoryName = CategoryName;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }
    
}
