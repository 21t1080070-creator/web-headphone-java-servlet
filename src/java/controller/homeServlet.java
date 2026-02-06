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
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.ProductHomeDTO;
import model.Variant;
@WebServlet(name = "homeServlet", urlPatterns = {"/home"})
public class homeServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet homeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet homeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> listCategory = Database.getCategoryDao().findAll();
        request.setAttribute("listCategory", listCategory); 
        String txtSearch = request.getParameter("txt");
        String cid_raw = request.getParameter("cid");
        List<ProductHomeDTO> listProducts;
        if (txtSearch != null && !txtSearch.trim().isEmpty()) {
            listProducts = Database.getProductDao().searchByName(txtSearch.trim());            
            request.setAttribute("txtS", txtSearch); 
        }else {            
            int cid = 0;
            try {
                if (cid_raw != null) {
                    cid = Integer.parseInt(cid_raw);
                }
            } catch (NumberFormatException e) {
                cid = 0;
            }            
            listProducts = Database.getProductDao().getProductsForHomePage(cid);
            
            // Gửi cid về để active menu
            request.setAttribute("tag", cid);
        }
//        int cid = 0; 
//        try {
//            if (cid_raw != null) {
//                cid = Integer.parseInt(cid_raw);
//            }
//        } catch (NumberFormatException e) {
//            cid = 0;
//        } 
//        List<ProductHomeDTO> listProducts = Database.getProductDao().getProductsForHomePage(cid);
        request.setAttribute("listProducts", listProducts);
//        request.setAttribute("tag", cid);   
        request.getRequestDispatcher("/views/home.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
