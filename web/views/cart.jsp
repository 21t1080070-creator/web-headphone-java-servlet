<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Giỏ hàng của bạn</title>
    <jsp:include page="/inc/_header.jsp"></jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cart.css"/>
</head>
    <jsp:include page="/inc/_cart.jsp"></jsp:include>
</html>
