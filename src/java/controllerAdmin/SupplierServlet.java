/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import data.dao.Database;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Supplier;

/**
 *
 * @author huynhvminh
 */
@WebServlet(name = "SupplierServlet", urlPatterns = {"/supplier-list"})
public class SupplierServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SupplierServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SupplierServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");        
        if ("delete".equals(action)) {
            String idStr = request.getParameter("id");
            if (idStr != null) {
                Database.getSupplierDao().deleteSupplier(Integer.parseInt(idStr));
            }
            response.sendRedirect("supplier-list");
            return;
        }
        request.setAttribute("listS", Database.getSupplierDao().getAllSuppliers());
        request.getRequestDispatcher("/adminn/supplier-list.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String addr = request.getParameter("address");
        
        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Supplier s = new Supplier(id, name, phone, addr);
            Database.getSupplierDao().updateSupplier(s); 
            
        } else {
            Supplier s = new Supplier(0, name, phone, addr);
            Database.getSupplierDao().insertSupplier(s);
        }        
        response.sendRedirect("supplier-list");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
