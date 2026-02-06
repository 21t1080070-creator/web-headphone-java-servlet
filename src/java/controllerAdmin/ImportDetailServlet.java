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
import java.util.List;
import model.Import;
import model.Import_Detail;
import model.ProductVariantDTO;

@WebServlet(name = "ImportDetailServlet", urlPatterns = {"/import-detail"})
public class ImportDetailServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ImportDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImportDetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null) { response.sendRedirect("import-list"); return; }
        int importId = Integer.parseInt(idStr);
        Import imp = Database.getImportDao().getImportById(importId);
        List<Import_Detail> details = Database.getImportDao().getImportDetails(importId);
        List<ProductVariantDTO> variants = Database.getVariantDao().getAllVariantsFullInfo(); 
        request.setAttribute("imp", imp);
        request.setAttribute("details", details);
        request.setAttribute("variants", variants);
        
        request.getRequestDispatcher("/adminn/import-detail.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int importId = Integer.parseInt(request.getParameter("importId"));
        
        if ("add".equals(action)) {
            int variantId = Integer.parseInt(request.getParameter("variantId"));
            int qty = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            
            Import_Detail detail = new Import_Detail();
            detail.setImportID(importId);
            detail.setVariantID(variantId);
            detail.setQuantity_Import(qty);
            detail.setPriceImport(price);
            
            Database.getImportDao().addImportDetail(detail);
            
        }else if ("delete".equals(action)) {
        int variantId = Integer.parseInt(request.getParameter("variantId"));
        
        Database.getImportDao().deleteImportDetail(importId, variantId);
        
        }else if ("complete".equals(action)) {
            Database.getImportDao().completeImport(importId);
        }
        
        response.sendRedirect("import-detail?id=" + importId);

    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
