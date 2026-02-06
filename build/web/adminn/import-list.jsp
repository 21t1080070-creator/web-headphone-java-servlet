<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="inc/head.jsp" />
    <title>Lịch sử Nhập hàng</title>
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body id="page-top">
    <div id="wrapper">
        <jsp:include page="inc/sidebar.jsp" />
        
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Topbar -->
                </nav>

                <div class="container-fluid">
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex justify-content-between align-items-center">
                            <h6 class="m-0 font-weight-bold text-primary">Lịch sử Nhập kho</h6>
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#createImportModal">
                                <i class="fas fa-plus"></i> Tạo phiếu nhập mới
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Mã Phiếu</th>
                                            <th>Ngày nhập</th>
                                            <th>Nhà cung cấp</th>
                                            <th>Tổng tiền</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${importList}" var="i">
                                            <tr>
                                                <td>#${i.importId}</td>
                                                <td>${i.dateImport}</td>
                                                <td><strong>${i.supplierName}</strong></td>
                                                <td class="text-primary font-weight-bold">
                                                    <fmt:formatNumber value="${i.totalAmount}" type="currency" currencySymbol="đ"/>
                                                </td>
                                                <td>
                                                    <!-- Hiển thị badge: Pending (Đang nhập) / Completed (Đã xong) -->
                                                    <span class="badge badge-${i.status == 'Completed' ? 'success' : 'warning'}">
                                                        ${i.status == 'Completed' ? 'Đã nhập kho' : 'Đang nhập...'}
                                                    </span>
                                                </td>
                                                <td>
                                                    <!-- Nút xem chi tiết / tiếp tục nhập -->
                                                    <a href="import-detail?id=${i.importId}" class="btn btn-info btn-sm" 
                                                       title="${i.status == 'Pending' ? 'Tiếp tục nhập' : 'Xem chi tiết'}">
                                                        <i class="fas fa-${i.status == 'Pending' ? 'edit' : 'eye'}"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            
            <div class="modal fade" id="createImportModal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form action="import-list" method="POST">
                            <div class="modal-header">
                                <h5 class="modal-title font-weight-bold text-primary">Tạo phiếu nhập hàng mới</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="font-weight-bold">Chọn Nhà cung cấp:</label>
                                    <select class="form-control" name="supplierId" required>
                                        <c:forEach items="${suppliers}" var="s">
                                            <option value="${s.supplierId}">${s.supplierName}</option>
                                        </c:forEach>
                                    </select>
                                    <small class="form-text text-muted">Phiếu mới sẽ được tạo với trạng thái "Đang nhập".</small>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-arrow-right"></i> Tạo & Nhập hàng
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            
            <jsp:include page="inc/footer.jsp" />
        </div>
    </div>
    <!-- DataTables Script -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#dataTable').DataTable({ "order": [[ 0, "desc" ]] });
        });
    </script>
</body>
</html>
