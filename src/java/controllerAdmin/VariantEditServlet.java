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
import model.ProductDetailDTO;
import model.ProductVariantDTO;
@WebServlet(name = "VariantEditServlet", urlPatterns = {"/variant-edit"})
public class VariantEditServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VariantEditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VariantEditServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null) { response.sendRedirect("product-list"); return; }
        
        int vId = Integer.parseInt(idStr);
        
        ProductVariantDTO variant = Database.getVariantDao().getVariantById(vId);
        int productId = Database.getProductDao().getProductIdByVariantId(vId); // Hàm này bạn đã viết ở phần Delete rồi
        ProductDetailDTO product = Database.getProductDao().getProductBasicInfo(productId);
        
        request.setAttribute("variant", variant);
        request.setAttribute("product", product); // Để dùng cho breadcrumb và nút Hủy
        
        request.getRequestDispatcher("/adminn/variant-edit.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        int vId = Integer.parseInt(request.getParameter("id"));
        int pId = Integer.parseInt(request.getParameter("productId")); // Lấy để redirect về
        
        String color = request.getParameter("color");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        boolean success = Database.getVariantDao().updateVariant(vId, color, price, stock);
        if (success) {
            response.sendRedirect("variant-list?productId=" + pId);
        } else {
            request.setAttribute("error", "Lỗi cập nhật!");
            doGet(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
