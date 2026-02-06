/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author huynhvminh
 */
public class ProductDetailDTO {
    private int productID;
    private String productName;
    private String description;
    private String categoryName;
    
    // Quan trọng: Chứa danh sách để hiển thị lên web
    private List<ProductVariantDTO> variants = new ArrayList<>();

    public ProductDetailDTO() {}

    public int getProductID() {
        return productID;
    }

    public String getProductName() {
        return productName;
    }

    public String getDescription() {
        return description;
    }

    public String getCategoryName() {
        return categoryName;
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

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    
    // Getter Setter...
    public List<ProductVariantDTO> getVariants() { return variants; }
    public void setVariants(List<ProductVariantDTO> variants) { this.variants = variants; }
      
    // Helper: Lấy giá thấp nhất để hiển thị mặc định
    public double getMinPrice() {
        if (variants.isEmpty()) return 0;
        return variants.stream().mapToDouble(ProductVariantDTO::getPrice).min().orElse(0);
    }
}