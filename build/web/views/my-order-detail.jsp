<%-- 
    Document   : Order Detail
    Created on : 10 thg 1, 2026
    Updated by : AI Assistant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.User"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Chi tiết đơn hàng #${order.orderId}</title>
        <jsp:include page="/inc/_header.jsp"></jsp:include>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/myorderdetail.css"/>  
    </head>  
    <jsp:include page="/inc/_myorderdetail.jsp"></jsp:include>
</html>
