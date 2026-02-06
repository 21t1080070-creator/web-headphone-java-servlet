<!-- admin/order-detail.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="inc/head.jsp" />
    <title>Chi tiết đơn hàng #${orderId}</title>
</head>

<body id="page-top">
    <div id="wrapper">
        <jsp:include page="inc/sidebar.jsp" />
        
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Copy Topbar -->
                </nav>

                <div class="container-fluid">
                    
                    <!-- Header + Nút Back -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Chi tiết đơn hàng #${orderId}</h1>
                        <a href="order-list" class="btn btn-sm btn-secondary shadow-sm">
                            <i class="fas fa-arrow-left fa-sm text-white-50"></i> Quay lại
                        </a>
                    </div>

                    <div class="row">
                        <!-- Cột Trái: Danh sách sản phẩm -->
                        <div class="col-lg-8">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Sản phẩm đã đặt</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Sản phẩm</th>
                                                    <th>Đơn giá</th>
                                                    <th>SL</th>
                                                    <th>Thành tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="grandTotal" value="0" />
                                                <c:forEach items="${details}" var="d">
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <img src="${pageContext.request.contextPath}/assets/images/${d.productName}/${d.imageUrl}" alt="img" style="width: 50px; height: 50px; object-fit: cover; margin-right: 10px;">
                                                                <div>
                                                                    <div class="font-weight-bold">${d.productName}</div>
                                                                    <small>Màu: ${d.color}</small>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td><fmt:formatNumber value="${d.price}" type="currency" currencySymbol="$"/></td>
                                                        <td class="text-center">${d.quantity}</td>
                                                        <td class="font-weight-bold text-primary">
                                                            <fmt:formatNumber value="${d.total}" type="currency" currencySymbol="$"/>
                                                        </td>
                                                    </tr>
                                                    <c:set var="grandTotal" value="${grandTotal + d.total}" />
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="3" class="text-right font-weight-bold">Tổng cộng:</td>
                                                    <td class="text-danger font-weight-bold" style="font-size: 1.2rem;">
                                                        <fmt:formatNumber value="${grandTotal}" type="currency" currencySymbol="$"/>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Cột Phải: Thông tin khách hàng -->
                        <div class="col-lg-4">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-success">Thông tin giao hàng</h6>
                                </div>
                                <div class="card-body">
                                    <p><strong>Khách hàng:</strong> ${customer.username}</p> <!-- Username/Fullname -->
                                    <p><strong>Số điện thoại:</strong> ${customer.phone}</p>
                                    <p><strong>Email:</strong> ${customer.email}</p>
                                    <hr>
                                    <p><strong>Địa chỉ nhận hàng:</strong></p>
                                    <div class="alert alert-secondary">
                                        ${customer.address}
                                    </div>
                                    
                                    <!-- Các nút xử lý nhanh (nếu muốn đặt ở đây luôn) -->
                                    <div class="mt-4 text-center">
                                        <c:if test="${order.status == 'Pending'}">
                                            <a href="order-status?id=${orderId}&status=Confirmed" class="btn btn-primary btn-block mb-2">
                                                <i class="fas fa-check"></i> Duyệt đơn ngay
                                            </a>
                                            <a href="order-status?id=${orderId}&status=Cancelled" class="btn btn-danger btn-block" onclick="return confirm('Hủy đơn này?')">
                                                <i class="fas fa-times"></i> Hủy đơn hàng
                                            </a>
                                        </c:if>

                                        <!-- TRƯỜNG HỢP 2: Đã duyệt (Confirmed) -> Hiện nút Giao hàng -->
                                        <c:if test="${order.status == 'Confirmed'}">
                                            <div class="alert alert-info text-center">Đơn đã được duyệt.</div>
                                            <a href="order-status?id=${orderId}&status=Shipping" class="btn btn-info btn-block">
                                                <i class="fas fa-truck"></i> Bắt đầu giao hàng
                                            </a>
                                        </c:if>

                                        <!-- TRƯỜNG HỢP 3: Đang giao (Shipping) -> Hiện nút Hoàn tất -->
                                        <c:if test="${order.status == 'Shipping'}">
                                            <div class="alert alert-warning text-center">Đang giao hàng...</div>
                                            <a href="order-status?id=${orderId}&status=Success" class="btn btn-success btn-block">
                                                <i class="fas fa-star"></i> Xác nhận đã giao
                                            </a>
                                        </c:if>

                                        <!-- TRƯỜNG HỢP 4: Đã hủy (Cancelled) -> Chỉ hiện thông báo đỏ -->
                                        <c:if test="${order.status == 'Cancelled'}">
                                            <div class="alert alert-danger font-weight-bold text-center">
                                                <i class="fas fa-ban"></i> ĐƠN HÀNG ĐÃ HỦY
                                            </div>
                                            <!-- Không hiện nút bấm nào cả -->
                                        </c:if>

                                        <!-- TRƯỜNG HỢP 5: Thành công (Success) -> Thông báo xanh -->
                                        <c:if test="${order.status == 'Success'}">
                                            <div class="alert alert-success font-weight-bold text-center">
                                                <i class="fas fa-check-circle"></i> GIAO DỊCH THÀNH CÔNG
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <jsp:include page="inc/footer.jsp" />
        </div>
    </div>
</body>
</html>
