/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author huynhvminh
 */
public class Order {
    private int OrderID, UserID;
    private String Status;
    private LocalDateTime DateOrder;
//    private String PaymentMethod;   // VNPAY, COD,...
//    private String PaymentStatus;   // PENDING, PAID, FAILED

    public Order(int OrderID, int UserID, String Status, LocalDateTime DateOrder) {
        this.OrderID = OrderID;
        this.UserID = UserID;
        this.Status = Status;
        this.DateOrder = DateOrder;
    }
//    public Order() {
//    }
//
//    public Order(int OrderID, int UserID, String Status,
//                 LocalDateTime DateOrder,
//                 String PaymentMethod, String PaymentStatus) {
//        this.OrderID = OrderID;
//        this.UserID = UserID;
//        this.Status = Status;
//        this.DateOrder = DateOrder;
//        this.PaymentMethod = PaymentMethod;
//        this.PaymentStatus = PaymentStatus;
//    }
//    public String getPaymentMethod() { return PaymentMethod; }
//    public void setPaymentMethod(String PaymentMethod) { this.PaymentMethod = PaymentMethod; }
//
//    public String getPaymentStatus() { return PaymentStatus; }
//    public void setPaymentStatus(String PaymentStatus) { this.PaymentStatus = PaymentStatus; }

    public int getOrderID() {
        return OrderID;
    }

    public int getUserID() {
        return UserID;
    }

    public String getStatus() {
        return Status;
    }

    public LocalDateTime getDateOrder() {
        return DateOrder;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public void setDateOrder(LocalDateTime DateOrder) {
        this.DateOrder = DateOrder;
    }
    
}
