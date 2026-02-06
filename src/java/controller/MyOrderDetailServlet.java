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
import java.util.List;
import model.OrderDTO;
import model.OrderDetailDTO;
import model.User;

/**
 *
 * @author huynhvminh
 */
@WebServlet(name = "MyOrderDetailServlet", urlPatterns = {"/my-order-detail"})
public class MyOrderDetailServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MyOrderDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyOrderDetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        String idRaw = request.getParameter("id");
        if (idRaw == null) {
            response.sendRedirect("my-orders");
            return;
        }
        try {
            int orderId = Integer.parseInt(idRaw);

            OrderDTO order = Database.getOrderDao().getOrderById(orderId);
            if (order == null) {
                response.sendRedirect("my-orders");
                return;
            }

            List<OrderDetailDTO> details =
                    Database.getOrderDao().getOrderDetailsById(orderId);

            request.setAttribute("order", order);
            request.setAttribute("details", details);
            request.getRequestDispatcher("/views/my-order-detail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("my-orders");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
