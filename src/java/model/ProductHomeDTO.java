/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author huynhvminh
 */

// Class này KHÔNG phải là bảng trong DB, nó là class tổng hợp
public class ProductHomeDTO {
    private int productID;
    private String productName;
    private String description;
    private double price;       // Lấy từ bảng Variant
    private String imageUrl;
    private String secondImageUrl;    // Lấy từ bảng Image
    public ProductHomeDTO() {}
    private String categoryName;
    private int totalStock;

    public ProductHomeDTO(int productID, String productName, String description, double price, String imageUrl, String secondImageUrl) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.imageUrl = imageUrl;
        this.secondImageUrl=secondImageUrl;
    }
    public ProductHomeDTO(int productID, String productName, String categoryName, double price, int totalStock) {
        this.productID = productID;
        this.productName = productName;
        this.categoryName = categoryName;
        this.price = price;       // Có thể là giá min
        this.totalStock = totalStock;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public int getTotalStock() {
        return totalStock;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setTotalStock(int totalStock) {
        this.totalStock = totalStock;
    }
    

    public int getProductID() {
        return productID;
    }

    public String getProductName() {
        return productName;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public String getImageUrl() {
        return imageUrl;
    }
    public void setProductID(int productID) {
        this.productID = productID;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getSecondImageUrl() {
        return secondImageUrl;
    }

    public void setSecondImageUrl(String secondImageUrl) {
        this.secondImageUrl = secondImageUrl;
    }
    public String getFormattedPrice() {
        return String.format("%,.0f đ", price); // Hàm phụ trợ để hiển thị giá đẹp trên JSP
    }
}