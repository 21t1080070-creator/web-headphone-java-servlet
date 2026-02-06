/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package data.dao;

import java.util.List;
import model.Cart;
import model.OrderDTO;
import model.OrderDetailDTO;
import model.User;

/**
 *
 * @author huynhvminh
 */
public interface OrderDao {
    public void insertOrder(User user, Cart cart);
    public List<OrderDTO> getAllOrders();
    public boolean cancelOrder(int orderId);
    public boolean updateStatus(int orderId, String newStatus);
    public List<OrderDetailDTO> getOrderDetailsById(int orderId);
    public User getOrderCustomerInfo(int orderId);
    public OrderDTO getOrderById(int orderId);
    public boolean deleteOrder(int orderId);
    public double getDoanhThu();
    public List<OrderDTO> getOrdersByUser(int userId);
    public List<OrderDetailDTO> getOrderDetailsByIdAndUser(int orderId, int userId);
    
}
