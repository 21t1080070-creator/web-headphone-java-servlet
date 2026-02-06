<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="d-flex flex-column min-vh-100">

    <!-- PHẦN NỘI DUNG CHÍNH -->
    <main class="flex-grow-1 d-flex align-items-center justify-content-center py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="success-card">
                        <div class="icon-box">
                            <i class="fas fa-check"></i>
                        </div>
                        
                        <h2 class="fw-bold text-success mb-3">Đặt Hàng Thành Công!</h2>
                        <p class="text-muted mb-4">
                            Cảm ơn bạn đã mua sắm. Đơn hàng của bạn đang được xử lý.
                            Chúng tôi sẽ liên hệ với bạn sớm nhất.
                        </p>

                        <div class="d-grid gap-2 col-10 mx-auto">
                            <a href="home" class="btn btn-primary py-2 rounded-pill">
                                <i class="fas fa-home me-2"></i>Quay về trang chủ
                            </a>
                            <a href="home?cid=1" class="btn btn-outline-secondary py-2 rounded-pill">
                                Tiếp tục mua sắm
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="/inc/_footer.jsp"></jsp:include>
    <jsp:include page="/inc/scripts-global.jsp"></jsp:include>
</body>