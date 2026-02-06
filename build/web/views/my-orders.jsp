<%-- 
    Document   : My Orders
    Created on : 10 thg 1, 2026
    Updated by : AI Assistant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="model.User"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Đơn hàng của tôi</title>
        <jsp:include page="/inc/_header.jsp"></jsp:include>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/myorder.css"/>
    </head>
    <jsp:include page="/inc/myorder.jsp"></jsp:include>
</html>
