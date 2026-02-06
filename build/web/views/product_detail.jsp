<%-- 
    Document   : Product Detail
    Created on : 10 thg 1, 2026
    Updated by : AI Assistant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="model.User" %>

<!DOCTYPE html>
<html>
    <head>
        <title>${title}</title>
        <jsp:include page="/inc/_header.jsp"></jsp:include>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/product_detail.css"/>
    </head>  
        <jsp:include page="/inc/_detail.jsp"></jsp:include>
</html>
