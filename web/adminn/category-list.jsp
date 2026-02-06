<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="inc/head.jsp" />
    <title>Quản lý Danh mục</title>
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
                    <h1 class="h3 mb-0 text-gray-800 ml-3">Danh mục Sản phẩm</h1>
                </nav>

                <div class="container-fluid">
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex justify-content-between align-items-center">
                            <h6 class="m-0 font-weight-bold text-primary">Danh sách Danh mục</h6>
                            <!-- Nút mở Modal Thêm -->
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addModal">
                                <i class="fas fa-plus"></i> Thêm mới
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th width="10%">ID</th>
                                            <th>Tên Danh mục</th>
                                            <th width="15%" class="text-center">Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Duyệt list category -->
                                        <c:forEach items="${listCategories}" var="c">
                                            <tr>
                                                <td>${c.categoryID}</td> <!-- Lưu ý: Getter trong model là getCategoryID -->
                                                <td><strong>${c.categoryName}</strong></td>
                                                <td class="text-center">
                                                    <!-- Nút Sửa -->
                                                    <button type="button" class="btn btn-warning btn-sm" 
                                                            onclick="fillEditModal('${c.categoryID}', '${c.categoryName}')"
                                                            data-toggle="modal" data-target="#editModal">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    
                                                    <!-- Nút Xóa (Dùng form ẩn để POST cho an toàn hoặc dùng link GET như Supplier) -->
                                                    <!-- Ở đây dùng link GET cho giống hệt mẫu Supplier bạn gửi -->
                                                    <a href="category-list?action=delete&id=${c.categoryID}" 
                                                       class="btn btn-danger btn-sm" onclick="return confirm('Bạn chắc chắn muốn xóa danh mục này? Nếu danh mục có sản phẩm, thao tác này có thể bị chặn.')">
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
                <form action="category-list" method="POST">
                    <input type="hidden" name="action" value="add">
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bold text-primary">Thêm Danh mục mới</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Tên danh mục <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="name" required placeholder="Ví dụ: Tai nghe Gaming...">
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
                <form action="category-list" method="POST">
                    <!-- Action update -->
                    <input type="hidden" name="action" value="update">
                    <!-- ID ẩn -->
                    <input type="hidden" name="id" id="editId">

                    <div class="modal-header">
                        <h5 class="modal-title text-warning font-weight-bold">Cập nhật Danh mục</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Tên danh mục</label>
                            <input type="text" class="form-control" name="name" id="editName" required>
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
    <script>
        function fillEditModal(id, name) {
            document.getElementById('editId').value = id;
            document.getElementById('editName').value = name;
        }
    </script>

    <!-- INCLUDE FOOTER (Chứa các script JS chung như JQuery, Bootstrap) -->
    <jsp:include page="inc/footer.jsp" />
    
</body>
</html>
