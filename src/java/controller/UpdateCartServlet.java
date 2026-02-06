/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.CartItem;
@WebServlet(name = "UpdateCartServlet", urlPatterns = {"/update-cart"})
public class UpdateCartServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action"); 
        int variantId = Integer.parseInt(request.getParameter("variantId"));
        
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("CART");
        
        if (cart != null) {
            if ("delete".equals(action)) {
                cart.getItems().remove(variantId);
            } 
            else if ("update".equals(action)) {
                int newQuantity = Integer.parseInt(request.getParameter("quantity"));
                CartItem item = cart.getItems().get(variantId);
                if (item != null) {
                    if (newQuantity <= 0) {
                        cart.getItems().remove(variantId);
                    } else {
                        item.setQuantity(newQuantity);
                    }
                }
            }            
            session.setAttribute("CART", cart);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            
            double totalMoney = cart.getTotalMoney();
            int totalQty = cart.getTotalQuantity();
            
            out.print("{\"status\": \"ok\", \"totalMoney\": " + totalMoney + ", \"totalQty\": " + totalQty + "}");
            out.flush();
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
