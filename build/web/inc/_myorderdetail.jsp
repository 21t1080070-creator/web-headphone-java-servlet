<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body class="d-flex flex-column min-vh-100">
        <jsp:include page="/inc/_nav.jsp"></jsp:include>
        <!-- MAIN CONTENT -->
        <main class="flex-grow-1">
            <div class="container my-5">

                <!-- Nút quay lại -->
                <a href="my-orders" class="btn btn-outline-secondary btn-sm mb-4">
                    <i class="fas fa-arrow-left me-2"></i> Quay lại danh sách đơn
                </a>

                <!-- THÔNG TIN ĐƠN HÀNG -->
                <div class="card shadow-sm border-0 mb-4 rounded-3">
                    <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center border-bottom">
                        <h5 class="m-0 fw-bold text-primary">
                            <i class="fas fa-file-invoice me-2"></i> Đơn hàng #${order.orderId}
                        </h5>

                        <span class="badge ${order.statusBadgeClass != null ? order.statusBadgeClass : 'bg-info'} px-3 py-2 rounded-pill">
                            ${order.status}
                        </span>
                    </div>
                    <div class="card-body">
                        <div class="row text-center text-md-start">
                            <div class="col-md-4 mb-3 mb-md-0">
                                <small class="text-muted fw-bold text-uppercase">Ngày đặt hàng</small>
                                <div class="h5 mt-1 text-dark">
                                    <fmt:formatDate value="${order.dateOrder}" pattern="dd/MM/yyyy" />
                                </div>
                            </div>
                            <div class="col-md-4 mb-3 mb-md-0">
                                <small class="text-muted fw-bold text-uppercase">Khách hàng</small>
                                <div class="h5 mt-1 text-dark">${order.customerName}</div>
                            </div>
                            <div class="col-md-4">
                                <small class="text-muted fw-bold text-uppercase">Tổng tiền</small>
                                <div class="h5 mt-1 fw-bold text-danger">
                                    <fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="$"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- DANH SÁCH SẢN PHẨM TRONG ĐƠN -->
                <div class="card shadow-sm border-0 rounded-3">
                    <div class="card-header bg-white py-3">
                        <h6 class="m-0 fw-bold text-dark">Danh sách sản phẩm</h6>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead class="table-light text-secondary">
                                    <tr>
                                        <th class="py-3 ps-4">Sản phẩm</th>
                                        <th class="py-3">Phân loại</th>
                                        <th class="py-3 text-center">Số lượng</th>
                                        <th class="py-3 text-end">Đơn giá</th>
                                        <th class="py-3 text-end pe-4">Thành tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${details}" var="d">
                                        <tr>
                                            <td class="ps-4">
                                                <div class="d-flex align-items-center">
                                                    <img src="${pageContext.request.contextPath}/assets/images/${d.productName}/${d.imageUrl}"
                                                         alt="${d.productName}"
                                                         class="rounded border"
                                                         style="width: 60px; height: 60px; object-fit: cover;">
                                                    <div class="ms-3">
                                                        <a href="detail?id=${d.productId}" class="text-decoration-none fw-bold text-dark">
                                                            ${d.productName}
                                                        </a>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <span class="badge bg-light text-dark border">${d.color}</span>
                                            </td>
                                            <td class="text-center">${d.quantity}</td>
                                            <td class="text-end text-muted">
                                                <fmt:formatNumber value="${d.price}" type="currency" currencySymbol="$"/>
                                            </td>
                                            <td class="text-end fw-bold text-primary pe-4">
                                                <fmt:formatNumber value="${d.total}" type="currency" currencySymbol="$"/>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    <c:if test="${empty details}">
                                        <tr>
                                            <td colspan="5" class="text-center text-muted py-5">
                                                <i class="fas fa-box-open fa-3x mb-3"></i><br>
                                                Chưa có thông tin sản phẩm cho đơn hàng này.
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="/inc/_footer.jsp"></jsp:include>
        <jsp:include page="/inc/scripts-global.jsp"></jsp:include>
    </body>