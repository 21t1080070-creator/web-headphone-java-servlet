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

@WebServlet(name = "detailServlet", urlPatterns = {"/detail"})
public class detailServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet detailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet detailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> categories = Database.getCategoryDao().findAll();
        request.setAttribute("listCategory", categories);
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("home"); 
            return;
        }
        try {
            int productId = Integer.parseInt(idParam);

            ProductDetailDTO productDetail = Database.getProductDao().getProductDetail(productId);
            request.setAttribute("detail", productDetail);

            request.getRequestDispatcher("/views/product_detail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("home");
        } catch (Exception e) {
            e.printStackTrace();
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
    }

}
