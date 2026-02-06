<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
        <jsp:include page="/inc/_nav.jsp"></jsp:include>
        <!-- MAIN CONTENT -->
        <main class="flex-grow-1">
            <div class="container my-5">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="mb-0 page-title">Đơn hàng của tôi</h3>
                    <c:if test="${not empty orders}">
                        <span class="text-muted small">
                            Tổng số: <strong>${fn:length(orders)}</strong> đơn
                        </span>
                    </c:if>
                </div>

                <div class="order-wrapper">
                    <c:if test="${empty orders}">
                        <div class="alert alert-info text-center mb-0 py-4">
                            <h5 class="mb-2">Bạn chưa có đơn hàng nào</h5>
                            <p class="mb-0">Hãy ghé cửa hàng và đặt đơn đầu tiên nhé!</p>
                            <a href="home" class="btn btn-primary mt-3">Mua sắm ngay</a>
                        </div>
                    </c:if>

                    <c:if test="${not empty orders}">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead>
                                    <tr>
                                        <th scope="col">Mã đơn</th>
                                        <th scope="col">Ngày đặt</th>
                                        <th scope="col">Tổng tiền</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col" class="text-center">Chi tiết</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${orders}" var="o">
                                        <tr>
                                            <td class="fw-semibold text-primary">#${o.orderId}</td>
                                            <td>
                                                <fmt:formatDate value="${o.dateOrder}" pattern="dd/MM/yyyy" />
                                            </td>
                                            <td class="text-danger fw-bold">
                                                <fmt:formatNumber value="${o.totalAmount}" type="currency" currencySymbol="$"/>
                                            </td>
                                            <td>
                                                <!-- Bạn cần đảm bảo Model Order có phương thức getStatusBadgeClass() hoặc logic tương tự -->
                                                <span class="badge rounded-pill bg-${o.statusBadgeClass != null ? o.statusBadgeClass : 'secondary'}">
                                                    ${o.status}
                                                </span>
                                            </td>
                                            <td class="text-center">
                                                <!-- Link này trỏ tới order_detail.jsp bạn đã ghép ở bước trước -->
                                                <a href="my-order-detail?id=${o.orderId}" class="btn btn-sm btn-outline-primary rounded-pill px-3">
                                                    Xem chi tiết
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </div>
        </main>
       <jsp:include page="/inc/_footer.jsp"></jsp:include>
       <jsp:include page="/inc/scripts-global.jsp"></jsp:include>
    </body>