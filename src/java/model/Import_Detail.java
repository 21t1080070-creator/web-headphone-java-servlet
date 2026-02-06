package model;

public class Import_Detail {
    // Các trường gốc (Mapping với DB)
    private int ImportID;
    private int VariantID;
    private int Quantity_Import;
    private double PriceImport;

    // --- CÁC TRƯỜNG BỔ SUNG (Dùng để hiển thị View) ---
    private String productName; // Tên SP (Sony XM5)
    private String color;       // Màu sắc (Đen)

    // Constructor full (Dùng khi Select từ DB lên để hiển thị)
    public Import_Detail(int ImportID, int VariantID, int Quantity_Import, double PriceImport, String productName, String color) {
        this.ImportID = ImportID;
        this.VariantID = VariantID;
        this.Quantity_Import = Quantity_Import;
        this.PriceImport = PriceImport;
        this.productName = productName;
        this.color = color;
    }
    
    // Constructor đơn giản (Dùng khi Insert xuống DB)
    public Import_Detail(int ImportID, int VariantID, int Quantity_Import, double PriceImport) {
        this.ImportID = ImportID;
        this.VariantID = VariantID;
        this.Quantity_Import = Quantity_Import;
        this.PriceImport = PriceImport;
    }
    
    public Import_Detail() {} // Constructor rỗng

    // Getter & Setter gốc
    public int getImportID() { return ImportID; }
    public void setImportID(int ImportID) { this.ImportID = ImportID; }
    
    public int getVariantID() { return VariantID; }
    public void setVariantID(int VariantID) { this.VariantID = VariantID; }
    
    public int getQuantity_Import() { return Quantity_Import; }
    public void setQuantity_Import(int Quantity_Import) { this.Quantity_Import = Quantity_Import; }
    
    public double getPriceImport() { return PriceImport; }
    public void setPriceImport(double PriceImport) { this.PriceImport = PriceImport; }

    // Getter & Setter bổ sung
    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }
    
    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }

    // Helper: Tính thành tiền của dòng này
    public double getTotal() {
        return Quantity_Import * PriceImport;
    }
}
