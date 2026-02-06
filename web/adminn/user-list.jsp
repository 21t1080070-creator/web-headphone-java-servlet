<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="inc/head.jsp" />
    <title>Quản lý Người dùng</title>
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
                    <h1 class="h3 mb-0 text-gray-800 ml-3">Quản lý Tài khoản</h1>
                </nav>

                <div class="container-fluid">
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex justify-content-between align-items-center">
                            <h6 class="m-0 font-weight-bold text-primary">Danh sách Người dùng</h6>
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addModal">
                                <i class="fas fa-user-plus"></i> Thêm User mới
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Username</th>
                                            <th>Email</th>
                                            <th>SĐT</th>
                                            <th>Vai trò</th>
                                            <th class="text-center">Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listUsers}" var="u">
                                            <tr>
                                                <td>${u.userID}</td>
                                                <td><strong>${u.username}</strong></td>
                                                <td>${u.email}</td>
                                                <td>${u.phone}</td>
                                                <td class="text-center">
                                                    <!-- Hiển thị Role có màu sắc -->
                                                    <c:if test="${u.role == 'Admin'}">
                                                        <span class="badge badge-danger px-2">Admin</span>
                                                    </c:if>
                                                    <c:if test="${u.role != 'Admin'}">
                                                        <span class="badge badge-info px-2">Customer</span>
                                                    </c:if>
                                                </td>
                                                <td class="text-center">
                                                    <!-- Nút Sửa -->
                                                    <button type="button" class="btn btn-warning btn-sm" 
                                                            onclick="fillEditModal('${u.userID}', '${u.username}', '${u.email}', '${u.phone}', '${u.address}', '${u.role}')"
                                                            data-toggle="modal" data-target="#editModal">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    
                                                    <!-- Nút Xóa (Dùng link GET như Category) -->
                                                    <a href="user-list?action=delete&id=${u.userID}" 
                                                       class="btn btn-danger btn-sm" 
                                                       onclick="return confirm('Bạn chắc chắn muốn xóa tài khoản này?');">
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

    <!-- MODAL THÊM MỚI -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="user-list" method="POST">
                    <input type="hidden" name="action" value="add">
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bold text-primary">Thêm Người dùng mới</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Username <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="username" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Mật khẩu <span class="text-danger">*</span></label>
                                <input type="password" class="form-control" name="password" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Số điện thoại</label>
                                <input type="text" class="form-control" name="phone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ</label>
                            <input type="text" class="form-control" name="address">
                        </div>
                        <div class="form-group">
                            <label>Vai trò (Role)</label>
                            <select class="form-control" name="role">
                                <option value="Customer">Khách hàng (Customer)</option>
                                <option value="Admin">Quản trị viên (Admin)</option>
                            </select>
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

    <!-- MODAL SỬA -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="user-list" method="POST">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" id="editId">

                    <div class="modal-header">
                        <h5 class="modal-title text-warning font-weight-bold">Cập nhật thông tin</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" class="form-control" name="username" id="editUsername" required>
                        </div>
                        <!-- KHÔNG CÓ Ô PASSWORD Ở ĐÂY ĐỂ BẢO MẬT -->
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" id="editEmail" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Số điện thoại</label>
                                <input type="text" class="form-control" name="phone" id="editPhone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ</label>
                            <input type="text" class="form-control" name="address" id="editAddress">
                        </div>
                        <div class="form-group">
                            <label>Vai trò</label>
                            <select class="form-control" name="role" id="editRole">
                                <option value="Customer">Khách hàng (Customer)</option>
                                <option value="Admin">Quản trị viên (Admin)</option>
                            </select>
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

    <!-- SCRIPT ĐIỀN DỮ LIỆU VÀO MODAL SỬA -->
    <jsp:include page="inc/footer.jsp" />

    <!-- SCRIPT ĐIỀN DỮ LIỆU VÀO MODAL SỬA -->
    <script>
        function fillEditModal(id, username, email, phone, address, role) {
            console.log("Edit ID: " + id); // Debug xem hàm có chạy không
            document.getElementById('editId').value = id;
            document.getElementById('editUsername').value = username;
            document.getElementById('editEmail').value = email;
            document.getElementById('editPhone').value = phone;
            document.getElementById('editAddress').value = address;
            document.getElementById('editRole').value = role;
        }
    </script>
</body>
</html>

