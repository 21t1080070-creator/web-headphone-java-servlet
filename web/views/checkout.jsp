<%-- 
    Document   : Checkout
    Created on : 10 thg 1, 2026
    Updated by : AI Assistant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.User"%>

<fmt:setLocale value="vi_VN"/>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Thanh Toán</title>
        <jsp:include page="/inc/_header.jsp"></jsp:include>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/checkout2.css"/>
    </head>
    <jsp:include page="/inc/_checkout.jsp"></jsp:include>
</html>
