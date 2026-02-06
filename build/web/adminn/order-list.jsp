<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="inc/head.jsp" />
    <title>Quản lý Đơn hàng</title>
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body id="page-top">
    <div id="wrapper">
        <jsp:include page="inc/sidebar.jsp" />
        
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                     <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <h1 class="h3 mb-0 text-gray-800 ml-3">Danh sách Đơn hàng</h1>
                </nav>

                <!-- Main Content -->
                <div class="container-fluid">
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Tất cả đơn đặt hàng</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Mã Đơn</th>
                                            <th>Ngày đặt</th>
                                            <th>Khách hàng</th>
                                            <th>Tổng tiền</th>
                                            <th>Trạng thái</th>
                                            <th style="width: 250px;">Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${orderList}" var="o">
                                            <tr>
                                                <td>#${o.orderId}</td>
                                                <td>${o.dateOrder}</td>
                                                <td><strong>${o.customerName}</strong></td>
                                                <td class="text-danger font-weight-bold">
                                                    <fmt:formatNumber value="${o.totalAmount}" type="currency" currencySymbol="$"/>
                                                </td>
                                                <td>
                                                    <!-- Hiển thị Badge màu sắc theo trạng thái (Dùng hàm helper hoặc c:choose) -->
                                                    <span class="badge badge-${o.statusBadgeClass}" style="font-size: 0.9rem;">
                                                        ${o.status}
                                                    </span>
                                                </td>
                                                <td>
                                                    <!-- Nút Xem chi tiết (Luôn hiện) -->
                                                    <a href="order-detail?id=${o.orderId}" class="btn btn-secondary btn-sm" title="Xem chi tiết">
                                                        <i class="fas fa-eye"></i>
                                                    </a>

                                                    <!-- Logic Nút bấm chuyển trạng thái -->
                                                    <c:choose>
                                                        <c:when test="${o.status == 'Pending'}">
                                                            <a href="order-status?id=${o.orderId}&status=Confirmed" class="btn btn-primary btn-sm">Duyệt</a>
                                                            <a href="order-status?id=${o.orderId}&status=Cancelled" class="btn btn-danger btn-sm" 
                                                               onclick="return confirm('Hủy đơn #${o.orderId} và hoàn kho?')">Hủy</a>
                                                        </c:when>
                                                        
                                                        <c:when test="${o.status == 'Confirmed'}">
                                                            <a href="order-status?id=${o.orderId}&status=Shipping" class="btn btn-info btn-sm">Giao hàng</a>
                                                        </c:when>
                                                        
                                                        <c:when test="${o.status == 'Shipping'}">
                                                            <a href="order-status?id=${o.orderId}&status=Success" class="btn btn-success btn-sm">Hoàn tất</a>
                                                        </c:when>
                                                        <c:when test="${o.status == 'Cancelled'}">
                                                            <a href="order-delete?id=${o.orderId}" class="btn btn-danger btn-sm" 
                                                               onclick="return confirm('XÓA VĨNH VIỄN đơn #${o.orderId}?\nLưu ý: Hành động này không thể hoàn tác!')" 
                                                               title="Xóa khỏi hệ thống">
                                                                <i class="fas fa-trash-alt"></i> Xóa
                                                            </a>
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div> <!-- /.container-fluid -->
            </div>
            
            <jsp:include page="inc/footer.jsp" />
        </div>
    </div>
    
    <!-- DataTables Script -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function() {
            // Sắp xếp cột ID (index 0) giảm dần để thấy đơn mới nhất
            $('#dataTable').DataTable({
                "order": [[ 0, "desc" ]] 
            });
        });
    </script>
</body>
</html>
