<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<body>
    <!-- 3. NAV (Menu) -->
    <jsp:include page="/inc/_nav.jsp"></jsp:include>

    <!-- 4. NỘI DUNG CHÍNH -->
    <main class="container my-5">
        <div class="card card-cart bg-white shadow-sm">
            <div class="row g-0">
                
                <!-- Cột Trái: Danh sách sản phẩm -->
                <div class="col-lg-8">
                    <div class="p-4 p-md-5">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="cart-title mb-0">Giỏ hàng</h3>
                            <span class="text-muted">
                                <span id="headerTotalQty">${CART.totalQuantity}</span> sản phẩm
                            </span>
                        </div>
                        
                        <hr class="my-4">

                        <!-- Trường hợp giỏ hàng trống -->
                        <c:if test="${CART == null || CART.totalQuantity == 0}">
                            <div class="text-center py-5">
                                <i class="fas fa-shopping-basket fa-3x text-muted mb-3"></i>
                                <h5>Giỏ hàng của bạn đang trống</h5>
                                <a href="home" class="btn btn-primary mt-3">Mua sắm ngay</a>
                            </div>
                        </c:if>

                        <!-- Danh sách Item -->
                        <c:forEach items="${CART.items.values()}" var="item">
                            <div class="row mb-4 d-flex justify-content-between align-items-center item-row-${item.variantID}">
                                <!-- Ảnh -->
                                <div class="col-md-2 col-lg-2 col-xl-2 text-center text-md-start">
                                    <img src="${pageContext.request.contextPath}/assets/images/${item.productName}/${item.imageUrl}" 
                                         class="img-fluid product-img rounded-3" alt="${item.productName}">
                                </div>
                                
                                <!-- Tên & Loại -->
                                <div class="col-md-3 col-lg-3 col-xl-3">
                                    <h6 class="product-name text-truncate" title="${item.productName}">${item.productName}</h6>
                                    <div class="product-category text-muted small">Màu: ${item.colorName}</div>
                                </div>
                                
                                <!-- Số lượng -->
                                <div class="col-md-3 col-lg-3 col-xl-2 d-flex justify-content-center">
                                    <div class="quantity-control d-flex align-items-center border rounded">
                                        <button class="btn btn-link px-2" 
                                                onclick="updateQuantity(${item.variantID}, ${item.quantity - 1})">
                                            <i class="fas fa-minus small"></i>
                                        </button>
                                        
                                        <input id="qty-${item.variantID}" min="1" name="quantity" value="${item.quantity}" type="text"
                                               class="form-control form-control-sm text-center border-0" style="width: 50px;" readonly />
                                        
                                        <button class="btn btn-link px-2"
                                                onclick="updateQuantity(${item.variantID}, ${item.quantity + 1})">
                                            <i class="fas fa-plus small"></i>
                                        </button>
                                    </div>
                                </div>
                                
                                <!-- Giá tiền -->
                                <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1 text-center text-md-end">
                                    <h6 class="mb-0 price-text">
                                        <fmt:formatNumber value="${item.price * item.quantity}" type="currency" currencySymbol="$" maxFractionDigits="0"/>
                                    </h6>
                                </div>
                                
                                <!-- Nút Xóa -->
                                <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                    <a href="javascript:void(0)" onclick="removeItem(${item.variantID})" class="text-danger" title="Xóa sản phẩm">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </div>
                            </div>
                            <hr class="my-4 item-row-${item.variantID}">
                        </c:forEach>

                        <div class="pt-2">
                            <a href="home" class="text-decoration-none fw-bold" style="color: #667eea;">
                                <i class="fas fa-long-arrow-alt-left me-2"></i>Tiếp tục mua sắm
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Cột Phải: Tổng tiền & Thanh toán -->
                <div class="col-lg-4 summary-section bg-light">
                    <div class="p-4 p-md-5">
                        <h3 class="fw-bold mb-4 mt-2 pt-1 text-uppercase text-muted h6">Thanh Toán</h3>
                        <hr class="my-4">

                        <div class="d-flex justify-content-between mb-4">
                            <span class="text-muted">Tạm tính:</span>
                            <span class="fw-bold" id="subTotalMoney">
                                <fmt:formatNumber value="${CART.totalMoney}" type="currency" currencySymbol="$" maxFractionDigits="0"/>
                            </span>
                        </div>
                        
                        <div class="mb-4">
                            <!-- Placeholder cho mã giảm giá nếu cần sau này -->
                        </div>

                        <hr class="my-4">

                        <div class="d-flex justify-content-between mb-5">
                            <span class="text-uppercase fw-bold">Tổng tiền</span>
                            <span class="h5 fw-bold text-primary" id="finalTotalMoney">
                                <fmt:formatNumber value="${CART.totalMoney}" type="currency" currencySymbol="$" maxFractionDigits="0"/>
                            </span>
                        </div>

                        <div class="d-grid">
                            <a href="checkout" class="btn btn-dark btn-lg py-3 text-white text-decoration-none">
                                THANH TOÁN NGAY
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="/inc/_footer.jsp"></jsp:include>
    <jsp:include page="/inc/scripts-global.jsp"></jsp:include>
    
    <script>
        // Khai báo biến BASE_URL để file cart.js sử dụng
        const BASE_URL = "${pageContext.request.contextPath}";
    </script>
    <script src="${pageContext.request.contextPath}/assets/js/cart.js"></script>

</body>