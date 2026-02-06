<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.User" %>

<!DOCTYPE html>
<html>
    <head>
        <title>${title}</title>
        <jsp:include page="/inc/_header.jsp"></jsp:include>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/home.css"/>
    </head>
    <jsp:include page="/inc/_home.jsp"></jsp:include>
</html>
