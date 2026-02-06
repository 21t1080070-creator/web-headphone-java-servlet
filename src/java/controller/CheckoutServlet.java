/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import data.dao.Database;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.User;
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

    private boolean checkPrerequisites(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("redirectUrl", "checkout");
            response.sendRedirect("login");
            return false;
        }
        
        Cart cart = (Cart) session.getAttribute("CART");
        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("home?cid=1");
            return false;
        }
        
        request.setAttribute("cart", cart);
        return true;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!checkPrerequisites(request, response)) {
            return;
        }
        double totalMoney = ((Cart) request.getAttribute("cart")).getTotalMoney();
        request.setAttribute("totalMoney", totalMoney);
        request.getRequestDispatcher("/views/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        if (!checkPrerequisites(request, response)) {
            return; 
        }
        
        // Lấy form data và xử lý order
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");
        String note = request.getParameter("note");
        
        try {
            Database.getOrderDao().insertOrder(
                (User) request.getSession().getAttribute("user"), 
                (Cart) request.getAttribute("cart")
            );
            request.getSession().removeAttribute("CART");
            response.sendRedirect("order_success");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đặt hàng thất bại, vui lòng thử lại!");
            request.getRequestDispatcher("/views/checkout.jsp").forward(request, response);
        }
    }
}
