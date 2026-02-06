package model;

import java.util.ArrayList;
import java.util.List;

public class ProductVariantDTO {
    private int variantID;
    private String color;
    private double price;
    private int stockQuantity;
    
    // --- THÊM TRƯỜNG NÀY ---
    private String productName; 
    
    private List<String> images = new ArrayList<>();

    // Constructor cũ (giữ lại để không lỗi code cũ)
    public ProductVariantDTO(int variantID, String color, double price, int stockQuantity) {
        this.variantID = variantID;
        this.color = color;
        this.price = price;
        this.stockQuantity = stockQuantity;
    }
    
    // Constructor rỗng (để linh hoạt set dữ liệu)
    public ProductVariantDTO() {
    }

    // --- Getter & Setter cho productName ---
    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    // Các getter/setter cũ giữ nguyên...
    public int getVariantID() { return variantID; }
    public void setVariantID(int variantID) { this.variantID = variantID; }
    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public int getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(int stockQuantity) { this.stockQuantity = stockQuantity; }
    public List<String> getImages() { return images; }
    public void setImages(List<String> images) { this.images = images; }
}
