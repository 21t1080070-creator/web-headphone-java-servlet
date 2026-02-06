<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="inc/head.jsp" />
    <title>Quản lý Nhà cung cấp</title>
</head>

<body id="page-top">
    <div id="wrapper">
        <jsp:include page="inc/sidebar.jsp" />
        
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <h1 class="h3 mb-0 text-gray-800 ml-3">Nhà cung cấp</h1>
                </nav>

                <div class="container-fluid">
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex justify-content-between align-items-center">
                            <h6 class="m-0 font-weight-bold text-primary">Danh sách Nhà cung cấp</h6>
                            <!-- Nút mở Modal -->
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addModal">
                                <i class="fas fa-plus"></i> Thêm mới
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên Nhà Cung Cấp</th>
                                            <th>Số điện thoại</th>
                                            <th>Địa chỉ</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listS}" var="s">
                                            <tr>
                                                <td>${s.supplierId}</td>
                                                <td><strong>${s.supplierName}</strong></td>
                                                <td>${s.phone}</td>
                                                <td>${s.address}</td>
                                                <td>
                                                    <button type="button" class="btn btn-warning btn-sm" 
                                                            onclick="fillEditModal('${s.supplierId}', '${s.supplierName}', '${s.phone}', '${s.address}')"
                                                            data-toggle="modal" data-target="#editModal">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    <a href="supplier-list?action=delete&id=${s.supplierId}" 
                                                       class="btn btn-danger btn-sm" onclick="return confirm('Xóa nhà cung cấp này?')">
                                                        <i class="fas fa-trash"></i>
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
        </div>
    </div>

    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="supplier-list" method="POST">
                    <input type="hidden" name="action" value="add">
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bold text-primary">Thêm Nhà cung cấp mới</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Tên nhà cung cấp <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="name" required placeholder="Ví dụ: Sony Việt Nam">
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại</label>
                            <input type="text" class="form-control" name="phone" required placeholder="098...">
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ</label>
                            <textarea class="form-control" name="address" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Lưu lại</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="supplier-list" method="POST">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" id="editId">

                    <div class="modal-header">
                        <h5 class="modal-title text-warning font-weight-bold">Cập nhật thông tin</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Tên nhà cung cấp</label>
                            <input type="text" class="form-control" name="name" id="editName" required>
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại</label>
                            <input type="text" class="form-control" name="phone" id="editPhone" required>
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ</label>
                            <textarea class="form-control" name="address" id="editAddr" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                        <button type="submit" class="btn btn-warning">Lưu thay đổi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        function fillEditModal(id, name, phone, addr) {
            // Tìm các thẻ input trong Modal Edit và gán giá trị
            document.getElementById('editId').value = id;
            document.getElementById('editName').value = name;
            document.getElementById('editPhone').value = phone;
            document.getElementById('editAddr').value = addr;
        }
    </script>
    <jsp:include page="inc/footer.jsp" />
</body>
</html>

