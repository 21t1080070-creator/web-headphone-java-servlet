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
import java.io.File;
import model.ProductDetailDTO;

/**
 *
 * @author huynhvminh
 */
@WebServlet(name = "ProductAddServlet", urlPatterns = {"/product-add"})
public class ProductAddServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductAddServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductAddServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("categories", Database.getCategoryDao().findAll());
        request.getRequestDispatcher("/adminn/product-add.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String name = request.getParameter("productName");
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        ProductDetailDTO product = new ProductDetailDTO();
        product.setProductName(name);
        product.setDescription(description);
        boolean success = Database.getProductDao().insertProduct(product, categoryId); 
        if (success) {
            try {
                String basePath = "D:\\WebBanTaiNghe\\web\\assets\\images\\";
                
                String safeFolderName = name.replaceAll("[^a-zA-Z0-9 \\-_àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđĐ]", "").trim();
                
                File directory = new File(basePath + safeFolderName);
                
                if (!directory.exists()) {
                    boolean created = directory.mkdirs();
                    if (created) {
                        System.out.println("Đã tạo thư mục: " + directory.getAbsolutePath());
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Lỗi tạo thư mục ảnh: " + e.getMessage());
            }

            response.sendRedirect("product-list");
        } else {
            request.setAttribute("error", "Thêm thất bại!");
            doGet(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
