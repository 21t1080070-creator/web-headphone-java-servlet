package model;
import java.sql.Date;
import java.sql.Timestamp; // Dùng Timestamp để lưu cả giờ phút nhập thì tốt hơn

public class Import {
    private int importId;
    private Date dateImport; // Hoặc Timestamp dateImport
    private int supplierId;
    private String status;      // Pending / Completed
    private double totalAmount; 
    private String supplierName;

    public Import() {}
    public Import(int importId, Date dateImport, int supplierId, String status, double totalAmount, String supplierName) {
        this.importId = importId;
        this.dateImport = dateImport;
        this.supplierId = supplierId;
        this.status = status;
        this.totalAmount = totalAmount;
        this.supplierName = supplierName;
    }

    public int getImportId() {
        return importId;
    }

    public Date getDateImport() {
        return dateImport;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public String getStatus() {
        return status;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setImportId(int importId) {
        this.importId = importId;
    }

    public void setDateImport(Date dateImport) {
        this.dateImport = dateImport;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    
    
    public String getStatusBadge() {
        return "Completed".equalsIgnoreCase(status) ? "success" : "warning";
    }
}
