/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author huynhvminh
 */
public class Order_Detail {
    private int OrderID, VariantID, Quantity_Order;
    private double Price_Order;

    public Order_Detail(int OrderID, int VariantID, int Quantity_Order, double Price_Order) {
        this.OrderID = OrderID;
        this.VariantID = VariantID;
        this.Quantity_Order = Quantity_Order;
        this.Price_Order = Price_Order;
    }

    public int getOrderID() {
        return OrderID;
    }

    public int getVariantID() {
        return VariantID;
    }

    public int getQuantity_Order() {
        return Quantity_Order;
    }

    public double getPrice_Order() {
        return Price_Order;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public void setVariantID(int VariantID) {
        this.VariantID = VariantID;
    }

    public void setQuantity_Order(int Quantity_Order) {
        this.Quantity_Order = Quantity_Order;
    }

    public void setPrice_Order(double Price_Order) {
        this.Price_Order = Price_Order;
    }
    
}
