<%-- 
    File: inc/nav.jsp
    Mô tả: Thanh menu điều hướng (Navbar)
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.User"%>

<header>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-custom">
        <div class="container">
            <!-- LOGO -->
            <a class="navbar-brand" href="home">
                <img src="${pageContext.request.contextPath}/assets/images/logo1.png" alt="Logo" style="height: 50px;" class="rounded-pill">
            </a>

            <!-- Toggle Mobile -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- MENU ITEMS -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link ${tag == null ? 'active' : ''}" href="home">Trang chủ</a>
                    </li>
                    <c:forEach items="${listCategory}" var="c">
                        <li class="nav-item">
                            <a class="nav-link ${c.categoryID == tag ? 'active' : ''}" href="home?cid=${c.categoryID}">
                                ${c.categoryName}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
                
                <!-- Search -->
                <form action="home" method="get" class="d-flex search-box">
                    <input class="input-search" type="text" name="txt" placeholder="Tìm sản phẩm..." required>
                    <button class="btn-search-icon" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                </form>

                <div class="d-flex align-items-center">
                    <!-- Cart -->
                    <a class="btn-cart nav-link" href="cart">
                        <img src="${pageContext.request.contextPath}/assets/icon/cart.png" alt="Cart" style="width: 28px; height: 28px; object-fit: contain;">
                        <span id="cartTotal" class="position-absolute top-0 start-100 translate-middle badge rounded-pill badge-cart" style="font-size: 10px; padding: 4px 7px;">
                            ${sessionScope.CART != null ? sessionScope.CART.totalQuantity : 0}
                        </span>
                    </a>

                    <!-- User -->
                    <c:if test="${sessionScope.user == null}">
                        <a class="btn btn-login-custom" href="login">
                            <i class="fas fa-sign-in-alt me-1"></i> Đăng nhập
                        </a>
                    </c:if>

                    <c:if test="${sessionScope.user != null}">
                        <div class="dropdown">
                            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <div class="user-avatar">
                                    <%
                                        User u = (User) session.getAttribute("user");
                                        if (u != null && u.getUsername() != null && !u.getUsername().isEmpty()) {
                                            out.print(u.getUsername().toUpperCase().charAt(0));
                                        } else {
                                            out.print("U");
                                        }
                                    %>
                                </div>
                                <span class="fw-bold text-dark">
                                    ${sessionScope.user.username}
                                </span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2">
                                <li><a class="dropdown-item" href="my-orders"><i class="fas fa-user me-2 text-primary"></i> Đơn hàng của tôi</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li>
                                    <a class="dropdown-item text-danger" href="Logout">
                                        <i class="fas fa-sign-out-alt me-2"></i> Đăng xuất
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>
    <div style="height: 80px;"></div>
</header>
