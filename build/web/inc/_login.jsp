<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css"/>
<body>

    <div class="card login-card animate__animated animate__fadeInUp">
        <div class="login-header">
            <!-- Icon ổ khóa hoặc Logo -->
            <div class="login-icon">
                <i class="fas fa-headset"></i>
            </div>
            <h4 class="fw-bold text-dark">Welcome Back!</h4>
            <p class="text-muted small">Đăng nhập để tiếp tục mua sắm</p>
        </div>
        
        <div class="login-body pt-0">
            <!-- Thông báo lỗi -->
            <c:if test="${not empty login_error}">
                <div class="alert alert-danger alert-custom d-flex align-items-center mb-3" role="alert">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    <div>${login_error}</div>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/login" method="post">    
                
<!--                lấy dữ liệu ở đây-->
                <!-- Input Username -->
                <div class="mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                        <input type="text" class="form-control" name="emailphone" placeholder="Tên đăng nhập / Email" required autofocus>
                    </div>
                </div>

                <!-- Input Password -->
                <div class="mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required>
                    </div>
                </div>

                <!-- Remember & Forgot Pass -->
                <div class="d-flex justify-content-between align-items-center mb-4 small">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="rememberMe" name="remember">
                        <label class="form-check-label text-secondary cursor-pointer" for="rememberMe">Ghi nhớ tôi</label>
                    </div>
                    <a href="#" class="text-decoration-none" style="color: #764ba2;">Quên mật khẩu?</a>
                </div>

                <!-- Nút Submit -->
                <button type="submit" class="btn btn-login mb-3">
                    ĐĂNG NHẬP
                </button>

                <!-- Đăng ký -->
                <div class="divider-text">
                    <span>Chưa có tài khoản?</span>
                </div>
                
                <div class="text-center">
                    <a href="register" class="fw-bold text-decoration-none" style="color: #667eea;">Đăng ký tài khoản mới</a>
                </div>
            </form>
        </div>
    </div>
    
</body>
</html>
