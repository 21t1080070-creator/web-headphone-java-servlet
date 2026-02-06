<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>

<div class="container py-5">
    <div class="text-center mb-5">
        <h2 class="fw-bold text-dark">Thanh Toán Đơn Hàng</h2>
        <p class="text-muted">Vui lòng kiểm tra thông tin và giỏ hàng trước khi đặt hàng.</p>
    </div>

    <form action="submit-order" method="post"> <div class="row g-4">
            
            <div class="col-lg-7">
                <div class="card card-custom p-4 mb-4">
                    <h4 class="mb-4 fw-bold"><i class="fas fa-user-circle me-2 text-primary"></i>Thông tin giao hàng</h4>
                    
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Họ và tên</label>
                            <input type="text" class="form-control" name="fullName" placeholder="Nguyễn Văn" required>
                        </div>
                       

                        <div class="col-12">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" placeholder="email@example.com">
                        </div>

                        <div class="col-12">
                            <label class="form-label">Số điện thoại</label>
                            <input type="tel" class="form-control" name="phone" placeholder="09xx xxx xxx" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Địa chỉ nhận hàng</label>
                            <input type="text" class="form-control" name="address" placeholder="Số nhà, đường, phường/xã..." required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Ghi chú (Tùy chọn)</label>
                            <textarea class="form-control" rows="3" name="note "placeholder="Ví dụ: Giao giờ hành chính"></textarea>
                        </div>
                    </div>
                </div>

                <div class="card card-custom p-4">
                    <h4 class="mb-4 fw-bold"><i class="fas fa-wallet me-2 text-primary"></i>Phương thức thanh toán</h4>
                    
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="radio" name="paymentMethod" id="cod" checked>
                        <label class="form-check-label fw-semibold" for="cod">
                            <i class="fas fa-money-bill-wave me-2 text-success"></i>Thanh toán khi nhận hàng (COD)
                        </label>
                        <div class="text-muted small ms-4">Bạn chỉ phải thanh toán khi đã nhận được hàng.</div>
                    </div>

                    <div class="form-check mb-3">
                        <input class="form-check-input" type="radio" name="paymentMethod" id="banking">
                        <label class="form-check-label fw-semibold" for="banking">
                            <i class="fas fa-university me-2 text-info"></i>Chuyển khoản ngân hàng (QR Code)
                        </label>
                    </div>

                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="paymentMethod" id="momo">
                        <label class="form-check-label fw-semibold" for="momo">
                            <i class="fas fa-mobile-alt me-2 text-danger"></i>Ví MoMo / ZaloPay
                        </label>
                    </div>
                </div>
            </div>

            <div class="col-lg-5">
                <div class="card card-custom p-0">
                    <div class="p-3 cart-header d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold mb-0">Đơn hàng của bạn</h5>
                        <span class="badge bg-primary rounded-pill">3 sản phẩm</span>
                    </div>

                    <div class="p-3">
                        <ul class="list-group list-group-flush mb-3">
                            
                            <li class="list-group-item d-flex justify-content-between lh-sm product-item rounded my-1 border-0">
                                <div class="d-flex align-items-center">
                                    <div class="me-3">
                                        <div class="bg-light rounded d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                                            <i class="fas fa-box text-secondary"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="my-0">MacBook Pro M3</h6>
                                        <small class="text-muted">Space Gray / 512GB</small>
                                    </div>
                                </div>
                                <span class="text-dark fw-semibold">35.000.000₫</span>
                            </li>

                            <li class="list-group-item d-flex justify-content-between lh-sm product-item rounded my-1 border-0">
                                <div class="d-flex align-items-center">
                                    <div class="me-3">
                                        <div class="bg-light rounded d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                                            <i class="fas fa-headphones text-secondary"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="my-0">AirPods Pro 2</h6>
                                        <small class="text-muted">Số lượng: 1</small>
                                    </div>
                                </div>
                                <span class="text-dark fw-semibold">5.000.000₫</span>
                            </li>

                            <li class="list-group-item d-flex justify-content-between lh-sm product-item rounded my-1 border-0">
                                <div class="d-flex align-items-center">
                                    <div class="me-3">
                                        <div class="bg-light rounded d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                                            <i class="fas fa-mouse text-secondary"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="my-0">Logitech MX Master 3</h6>
                                        <small class="text-muted">Black</small>
                                    </div>
                                </div>
                                <span class="text-dark fw-semibold">2.500.000₫</span>
                            </li>
                        </ul>

                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Mã giảm giá">
                            <button class="btn btn-outline-secondary" type="button">Áp dụng</button>
                        </div>

                        <hr class="my-3">

                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted">Tạm tính:</span>
                            <span class="fw-semibold">42.500.000₫</span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted">Phí vận chuyển:</span>
                            <span class="text-success fw-semibold">Miễn phí</span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mt-3 pt-3 border-top">
                            <span class="fw-bold fs-5">Tổng cộng:</span>
                            <span class="total-price">42.500.000₫</span>
                        </div>
                    </div>

                    <div class="p-3">
                        <button class="btn btn-primary btn-checkout w-100 shadow" type="submit">
                            Đặt hàng ngay
                        </button>
                        <p class="text-center mt-3 small text-muted">
                            <i class="fas fa-lock me-1"></i> Thông tin của bạn được bảo mật tuyệt đối
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>