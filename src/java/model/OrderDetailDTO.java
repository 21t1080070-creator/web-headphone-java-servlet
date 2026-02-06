package model;

public class OrderDetailDTO {
    private int productId; // Để click vào xem lại SP nếu cần
    private String productName;
    private String color;
    private String imageUrl;
    private int quantity;
    private double price;

    public OrderDetailDTO() {}

    public OrderDetailDTO(int productId, String productName, String color, String imageUrl, int quantity, double price) {
        this.productId = productId;
        this.productName = productName;
        this.color = color;
        this.imageUrl = imageUrl;
        this.quantity = quantity;
        this.price = price;
    }

    // Getter & Setter đầy đủ
    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }
    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }
    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    
    // Helper tính thành tiền
    public double getTotal() { return quantity * price; }
}
