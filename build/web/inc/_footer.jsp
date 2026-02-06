<%-- 
    File: inc/footer.jsp
    Mô tả: Giao diện Footer chung
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<footer class="bg-dark text-white pt-5 pb-3 mt-auto" style="background-color: #1a1a1a !important;">
    <div class="container">
        <div class="row gx-5">
            <!-- Cột 1: Thông tin thương hiệu -->
            <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                <h5 class="text-uppercase mb-3 fw-bold text-primary">Headphone Store</h5>
                <p class="small text-secondary mb-3">
                    Chúng tôi mang đến trải nghiệm âm thanh đỉnh cao với những sản phẩm tai nghe chính hãng tốt nhất thị trường.
                </p>
                <!-- Social Icons -->
                <div class="d-flex">
                    <a href="#" class="btn btn-outline-light btn-sm rounded-circle me-2" style="width: 32px; height: 32px; padding: 0; line-height: 30px;"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="btn btn-outline-light btn-sm rounded-circle me-2" style="width: 32px; height: 32px; padding: 0; line-height: 30px;"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="btn btn-outline-light btn-sm rounded-circle me-2" style="width: 32px; height: 32px; padding: 0; line-height: 30px;"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="btn btn-outline-light btn-sm rounded-circle" style="width: 32px; height: 32px; padding: 0; line-height: 30px;"><i class="fab fa-youtube"></i></a>
                </div>
            </div>

            <!-- Cột 2: Quick Links -->
            <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                <h6 class="text-uppercase mb-3 fw-bold small text-light">Liên kết nhanh</h6>
                <div class="row">
                    <div class="col-6">
                        <ul class="list-unstyled small">
                            <li class="mb-2"><a href="home" class="text-secondary text-decoration-none hover-white">Trang chủ</a></li>
                            <li class="mb-2"><a href="#" class="text-secondary text-decoration-none hover-white">Sản phẩm mới</a></li>
                            <li class="mb-2"><a href="#" class="text-secondary text-decoration-none hover-white">Khuyến mãi</a></li>
                        </ul>
                    </div>
                    <div class="col-6">
                        <ul class="list-unstyled small">
                            <li class="mb-2"><a href="#" class="text-secondary text-decoration-none hover-white">Chính sách bảo hành</a></li>
                            <li class="mb-2"><a href="#" class="text-secondary text-decoration-none hover-white">Vận chuyển</a></li>
                            <li class="mb-2"><a href="#" class="text-secondary text-decoration-none hover-white">Liên hệ</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Cột 3: Contact Info -->
            <div class="col-lg-4 col-md-12">
                <h6 class="text-uppercase mb-3 fw-bold small text-light">Thông tin liên hệ</h6>
                <ul class="list-unstyled small text-secondary">
                    <li class="mb-2 d-flex"><i class="fas fa-map-marker-alt me-3 mt-1 text-primary"></i> 123 Đường ABC, Quận 1, TP.HCM</li>
                    <li class="mb-2 d-flex"><i class="fas fa-envelope me-3 mt-1 text-primary"></i> support@headphone.com</li>
                    <li class="mb-2 d-flex"><i class="fas fa-phone-alt me-3 mt-1 text-primary"></i> 1900 1234 (8:00 - 21:00)</li>
                </ul>
                
                <!-- Newsletter Mini -->
                <div class="input-group input-group-sm mt-3">
                    <input type="text" class="form-control bg-dark border-secondary text-white" placeholder="Email nhận tin...">
                    <button class="btn btn-primary" type="button"><i class="fas fa-paper-plane"></i></button>
                </div>
            </div>
        </div>

        <hr class="border-secondary my-4 opacity-25">

        <!-- Copyright -->
        <div class="row align-items-center small text-secondary">
            <div class="col-md-6 text-center text-md-start">
                &copy; 2025 Headphone Store. All rights reserved.
            </div>
            <div class="col-md-6 text-center text-md-end">
                <a href="#" class="text-secondary text-decoration-none me-3">Privacy Policy</a>
                <a href="#" class="text-secondary text-decoration-none">Terms of Service</a>
            </div>
        </div>
    </div>
</footer>
