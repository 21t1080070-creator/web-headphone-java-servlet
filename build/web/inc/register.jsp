<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-6"> <div class="card card-registration bg-white"> 
                    <div class="card-header-custom">
                        <h3 class="fw-bold mb-0" style="color: #4a4a4a;">Tạo Tài Khoản</h3>
                        <p class="text-muted small mt-2">Điền thông tin chi tiết để tham gia</p>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <% String error = (String) request.getAttribute("errorMessage"); 
                           if (error != null) { %>
                            <div class="alert alert-danger d-flex align-items-center" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>
                                <div><%= error %></div>
                            </div>
                        <% } %>
                        <span style="color: red; margin-left: 40px; font-size: 21px">${exist_user}</span>
                        
<!--                        lấy dữ liệu ở đây(name,email,phone, address,password,repassword)-->
                        <form action="" method="post">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="fullname" name="name" placeholder="Nguyễn Văn A" required>
                                <label for="fullname"><i class="fas fa-user me-2 text-secondary"></i>Họ và tên</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="email" title="Vui lòng nhập đúng định dạng email (ví dụ: ten@domain.com)" name="email" placeholder="name@example.com" required pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$">
                                <label for="email"><i class="fas fa-envelope me-2 text-secondary"></i>Địa chỉ Email</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="phone" name="phone" placeholder="0901234567" pattern="[0-9]{10}" title="Vui lòng nhập 10 chữ số">
                                <label for="phone"><i class="fas fa-phone me-2 text-secondary"></i>Số điện thoại</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="address" name="address" placeholder="Địa chỉ của bạn">
                                <label for="address"><i class="fas fa-map-marker-alt me-2 text-secondary"></i>Địa chỉ liên hệ</label>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="form-floating">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" required>
                                        <label for="password"><i class="fas fa-lock me-2 text-secondary"></i>Mật khẩu</label>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <div class="form-floating">
                                        <input type="password" class="form-control" id="confirmPassword" name="repassword" placeholder="Xác nhận" required>
                                        <label for="confirmPassword">Xác nhận lại</label>
                                        <span style="color: red">${err_repassword}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-check d-flex justify-content-start mb-4">
                                <input class="form-check-input me-2" type="checkbox" value="" id="terms" required />
                                <label class="form-check-label text-muted small" for="terms">
                                  Tôi đồng ý với <a href="#!" class="text-decoration-none" style="color: #667eea;">Điều khoản dịch vụ</a>
                                </label>
                            </div>
                            <div class="d-grid mb-4">
                                <button type="submit" class="btn btn-primary btn-register btn-lg text-white">ĐĂNG KÝ</button>
                            </div>
                            <div class="text-center">
                                <p class="mb-0 text-muted small">Đã có tài khoản? <a href="login" class="fw-bold text-decoration-none" style="color: #764ba2;">Đăng nhập</a></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>