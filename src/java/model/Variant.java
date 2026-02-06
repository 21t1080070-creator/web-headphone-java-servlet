package model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Variant {
    private int VariantID;
    private int ProductID;
    private String Color;
    private double Price;
    private int Stock_quantity;

    public Variant() {
    }

    public Variant(int VariantID, int ProductID, String Color, double Price, int Stock_quantity) {
        this.VariantID = VariantID;
        this.ProductID = ProductID;
        this.Color = Color;
        this.Price = Price;
        this.Stock_quantity = Stock_quantity;
    }

    public Variant(ResultSet rs) throws SQLException {
        this.VariantID = rs.getInt("VariantID");
        this.ProductID = rs.getInt("ProductID");
        this.Color = rs.getString("Color");
        this.Price = rs.getDouble("Price");
        this.Stock_quantity = rs.getInt("Stock_quantity");
    }

    // --- GETTER & SETTER CŨ (Giữ nguyên) ---
    public int getVariantID() {
        return VariantID;
    }

    public void setVariantID(int VariantID) {
        this.VariantID = VariantID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public int getStock_quantity() {
        return Stock_quantity;
    }

    public void setStock_quantity(int Stock_quantity) {
        this.Stock_quantity = Stock_quantity;
    }
}