package model;
import java.sql.Date; // Hoặc Timestamp tùy DB

public class OrderDTO {
    private int orderId;
    private Date dateOrder;
    private String customerName; // Thay vì int userId
    private double totalAmount;  // Tổng tiền
    private String status;       // Pending, Shipping, Cancelled...

    public OrderDTO() {}

    public OrderDTO(int orderId, Date dateOrder, String customerName, double totalAmount, String status) {
        this.orderId = orderId;
        this.dateOrder = dateOrder;
        this.customerName = customerName;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public int getOrderId() {
        return orderId;
    }

    public Date getDateOrder() {
        return dateOrder;
    }

    public String getCustomerName() {
        return customerName;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

    // Getter & Setter...
    public String getStatusBadgeClass() {
        // Helper để hiển thị màu sắc trên JSP cho đẹp
        if ("Pending".equalsIgnoreCase(status)) return "warning"; // Vàng
        if ("Confirmed".equalsIgnoreCase(status)) return "primary"; // Xanh dương
        if ("Shipping".equalsIgnoreCase(status)) return "info"; // Xanh nhạt
        if ("Success".equalsIgnoreCase(status)) return "success"; // Xanh lá
        if ("Cancelled".equalsIgnoreCase(status)) return "danger"; // Đỏ
        return "secondary";
    }
}
