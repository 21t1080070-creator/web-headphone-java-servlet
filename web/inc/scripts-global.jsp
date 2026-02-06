<%-- File: web/inc/scripts-global.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- 1. Bootstrap Bundle (Bắt buộc) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- 2. Chatbot (Trang nào cũng hiện) -->
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
  intent="WELCOME"
  chat-title="EcommerceBot"
  agent-id="3155e47b-8cde-4dfa-9263-4bd43a3527df"
  language-code="vi"
></df-messenger>
