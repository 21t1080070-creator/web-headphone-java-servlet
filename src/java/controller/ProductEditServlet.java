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
import java.util.List;
import model.Category;
import model.ProductDetailDTO;

@WebServlet(name = "ProductEditServlet", urlPatterns = {"/product-edit"})
public class ProductEditServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductEditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductEditServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null) { response.sendRedirect("product-list"); return; }
        
        int id = Integer.parseInt(idStr);
        ProductDetailDTO product = Database.getProductDao().getProductBasicInfo(id);
        List<Category> listC = Database.getCategoryDao().findAll();
        request.setAttribute("product", product);
        request.setAttribute("categories", listC);
        request.getRequestDispatcher("/adminn/product-edit.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("productName");
        String desc = request.getParameter("description");
        int cateId = Integer.parseInt(request.getParameter("categoryId"));
        boolean success = Database.getProductDao().updateProduct(id, name, desc, cateId);
        if (success) {
            response.sendRedirect("product-list");
        } else {
            request.setAttribute("error", "Cập nhật thất bại!");
            doGet(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
