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
@WebServlet(name = "ImportListServlet", urlPatterns = {"/import-list"})
public class ImportListServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ImportListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImportListServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        request.setAttribute("importList", Database.getImportDao().getAllImports());
        request.setAttribute("suppliers", Database.getSupplierDao().getAllSuppliers());
        
        request.getRequestDispatcher("/adminn/import-list.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sIdStr = request.getParameter("supplierId");
        if (sIdStr != null) {
            int supplierId = Integer.parseInt(sIdStr);
            int newImportId = Database.getImportDao().createImport(supplierId);
            
            if (newImportId != -1) {
                response.sendRedirect("import-detail?id=" + newImportId);
                return;
            }
        }
        response.sendRedirect("import-list");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
