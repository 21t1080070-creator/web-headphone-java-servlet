<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<body>
        <jsp:include page="/inc/_nav.jsp"></jsp:include>

        <!-- MAIN CONTENT -->
        <main class="flex-grow-1">
            <div class="container py-5">
                <div class="text-center mb-5">
                    <h2 class="fw-bold text-dark">Thanh Toán Đơn Hàng</h2>
                </div>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i> ${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <form action="checkout" method="post">
                    <div class="row g-4">

                        <!-- Cột Thông tin giao hàng -->
                        <div class="col-lg-7">
                            <div class="card card-custom p-4 mb-4">
                                <h4 class="mb-4 fw-bold"><i class="fas fa-shipping-fast me-2 text-primary"></i>Thông tin giao hàng</h4>

                                <div class="row g-3">
                                    <div class="col-12">
                                        <label class="form-label">Họ và tên</label>
                                        <input type="text" class="form-control" name="fullName" 
                                               value="${user.username}" required>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Email</label>
                                        <input type="email" class="form-control" name="email" 
                                               value="${user.email}" readonly>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Số điện thoại</label>
                                        <input type="tel" class="form-control" name="phone" 
                                               value="${user.phone}" required>
                                    </div>

                                    <div class="col-12">
                                        <label class="form-label">Địa chỉ nhận hàng</label>
                                        <input type="text" class="form-control" name="address" 
                                               value="${user.address}" required>
                                    </div>

                                    <div class="col-12">
                                        <label class="form-label">Ghi chú (Tùy chọn)</label>
                                        <textarea class="form-control" name="note" rows="2" placeholder="Ví dụ: Giao giờ hành chính"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="card card-custom p-4">
                                <h4 class="mb-4 fw-bold"><i class="fas fa-wallet me-2 text-primary"></i>Phương thức thanh toán</h4>

                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="radio" name="paymentMethod" value="COD" id="cod" checked>
                                    <label class="form-check-label fw-semibold" for="cod">
                                        <i class="fas fa-money-bill-wave me-2 text-success"></i>Thanh toán khi nhận hàng (COD)
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="paymentMethod" value="BANKING" id="banking">
                                    <label class="form-check-label fw-semibold" for="banking">
                                        <i class="fas fa-university me-2 text-info"></i>Chuyển khoản ngân hàng (VNPAY/QR)
                                    </label>
                                </div>
                            </div>
                        </div>

                        <!-- Cột Thông tin đơn hàng -->
                        <div class="col-lg-5">
                            <div class="card card-custom p-0">
                                <div class="p-3 border-bottom d-flex justify-content-between align-items-center bg-light rounded-top">
                                    <h5 class="fw-bold mb-0">Đơn hàng của bạn</h5>
                                    <span class="badge bg-primary rounded-pill">${CART.totalQuantity} sản phẩm</span>
                                </div>

                                <div class="p-3">
                                    <ul class="list-group list-group-flush mb-3">
                                        <c:forEach var="entry" items="${CART.items}">
                                            <c:set var="item" value="${entry.value}" />

                                            <li class="list-group-item d-flex justify-content-between lh-sm border-0 px-0">
                                                <div class="d-flex">
                                                    <div class="me-3">
                                                        <img src="${pageContext.request.contextPath}/assets/images/${item.productName}/${item.imageUrl}" class="product-img-sm" alt="Product">
                                                    </div>
                                                    <div>
                                                        <h6 class="my-0">${item.productName}</h6>
                                                        <small class="text-muted">Màu: ${item.colorName} | SL: x${item.quantity}</small>
                                                    </div>
                                                </div>
                                                <span class="text-dark fw-semibold">
                                                    <fmt:formatNumber value="${item.price * item.quantity}" type="currency"/>
                                                </span>
                                            </li>
                                        </c:forEach>

                                        <c:if test="${empty CART.items}">
                                            <li class="list-group-item text-center text-muted">Giỏ hàng trống</li>
                                        </c:if>
                                    </ul>

                                    <hr class="my-3">

                                    <div class="d-flex justify-content-between align-items-center mt-3 pt-3">
                                        <span class="fw-bold fs-5">Tổng cộng:</span>
                                        <span class="total-price">
                                            <fmt:formatNumber value="${CART.totalMoney}" type="currency"/>
                                        </span>
                                    </div>
                                </div>

                                <div class="p-3">
                                    <button class="btn btn-success w-100 py-3 fw-bold mb-2 shadow-sm" type="submit" name="action" value="COD">
                                        <i class="fas fa-check-circle me-2"></i>XÁC NHẬN ĐẶT HÀNG
                                    </button>
                                    
                                    <!-- Nút VNPAY chỉ hiện nếu bạn có tích hợp -->
                                    <button class="btn btn-warning w-100 py-3 fw-bold text-white shadow-sm" type="submit" name="action" value="VNPAY">
                                        <i class="fas fa-credit-card me-2"></i>Thanh toán VNPAY
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </main>

        <jsp:include page="/inc/_footer.jsp"></jsp:include>
        <jsp:include page="/inc/scripts-global.jsp"></jsp:include>
        
    </body>