/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
@WebServlet(name = "DialogflowWebhookServlet", urlPatterns = {"/Dialogflow"})
public class DialogflowWebhookServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DialogflowWebhookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DialogflowWebhookServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        // Parse JSON (nếu cần lấy intent, parameters...)
        JsonObject body = JsonParser.parseString(sb.toString()).getAsJsonObject();
        String intentName = body.getAsJsonObject("queryResult")
                                .getAsJsonObject("intent")
                                .get("displayName").getAsString();

        // TODO: tùy intent mà xử lý, tạm thời trả text đơn giản
        String replyText = "Xin chào, đây là phản hồi từ webhook Java/Servlet!";

        // Tạo JSON response đúng format Dialogflow
        JsonObject fulfillment = new JsonObject();
        fulfillment.addProperty("fulfillmentText", replyText);

        response.setContentType("application/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.print(fulfillment.toString());
        }

    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
