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
import model.CartItem;
@WebServlet(name = "cartServlet", urlPatterns = {"/cart"})
public class cartServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet cartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String variantIdRaw = request.getParameter("variantId");
        String quantityRaw = request.getParameter("quantity");
        
        
        try {
            int variantId = Integer.parseInt(variantIdRaw);
            int quantity = Integer.parseInt(quantityRaw);            
            CartItem item = Database.getVariantDao().getCartItemInfo(variantId);
            
            if (item != null) {
                item.setQuantity(quantity);
                HttpSession session = request.getSession();
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
                    cart = new Cart();
                }
                
                cart.add(item);
                session.setAttribute("CART", cart);                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print("{\"totalQuantity\": " + cart.getTotalQuantity() + "}");
                out.flush();
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
