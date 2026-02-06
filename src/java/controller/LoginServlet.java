package controller;

import data.dao.Database;
import data.utils.API;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            response.sendRedirect("home");
            return;
        }
        request.setAttribute("title", "Login Page");
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String emailphone = request.getParameter("emailphone");
        String password = request.getParameter("password");

        if (emailphone != null) emailphone = emailphone.trim();
        if (password != null) password = password.trim();

        User user = Database.getUserDao().findUser(emailphone, API.getMD5(password));
        HttpSession session = request.getSession();
        if (user == null) {
            session.setAttribute("login_error", "Email/Phone hoặc Password không chính xác!");
            response.sendRedirect("login");
        } else {
            session.removeAttribute("login_error");        
            session.setAttribute("user", user);  
            
            String role = user.getRole();
                        
            if (role != null && role.equalsIgnoreCase("admin")) {
                response.sendRedirect("AdminHome"); 
            } else {
                response.sendRedirect("home");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet handles user authentication";
    }
}