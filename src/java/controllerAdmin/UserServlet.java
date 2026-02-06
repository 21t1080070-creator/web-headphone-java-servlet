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
import model.User;

/**
 *
 * @author huynhvminh
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/user-list"})
public class UserServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserServlet at " + request.getContextPath() + "</h1>");
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
            if (idStr != null) Database.getUserDao().deleteUser(Integer.parseInt(idStr));
            response.sendRedirect("user-list");
            return;
        }

        request.setAttribute("listUsers", Database.getUserDao().getAllUsers());
        request.getRequestDispatcher("/adminn/user-list.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        User u = new User();
        u.setUsername(request.getParameter("username"));
        u.setEmail(request.getParameter("email"));
        u.setPhone(request.getParameter("phone"));
        u.setAddress(request.getParameter("address"));
        u.setRole(request.getParameter("role"));
        if ("add".equals(action)) {
            String pass = request.getParameter("password");
            u.setPassword(pass);
            Database.getUserDao().addUser(u);
            
        } else if ("update".equals(action)) {
            String idStr = request.getParameter("id");
            if(idStr != null && !idStr.isEmpty()){
                u.setUserID(Integer.parseInt(idStr));
                Database.getUserDao().updateUser(u);
            }
        }
        
        response.sendRedirect("user-list");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
