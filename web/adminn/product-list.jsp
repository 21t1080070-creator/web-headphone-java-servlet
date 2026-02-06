<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Include Head -->
    <jsp:include page="inc/head.jsp" />
    <!-- Custom styles for this page (DataTables) -->
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body id="page-top">
    <div id="wrapper">
        <!-- Sidebar -->
        <jsp:include page="inc/sidebar.jsp" />

        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Topbar content giống index.jsp hoặc include file riêng -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <h1 class="h3 mb-0 text-gray-800 ml-3">Quản lý sản phẩm</h1>
                </nav>

                <!-- Page Content -->
                <div class="container-fluid">

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex justify-content-between align-items-center">
                            <h6 class="m-0 font-weight-bold text-primary">Danh sách Tai nghe</h6>
                            <a href="product-add" class="btn btn-primary btn-sm">
                                <i class="fas fa-plus"></i> Thêm mới
                            </a>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Hình ảnh</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Danh mục</th>
                                            <th>Giá (Min)</th>
                                            <th>Tồn kho</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${productList}" var="p">
                                            <tr>
                                                <td>${p.productID}</td>
                                                <td>
                                                    <img src="${pageContext.request.contextPath}/assets/images/${p.productName}/${p.imageUrl}" alt="img" style="width: 50px; height: 50px; object-fit: cover;">
                                                </td>
                                                <td><strong>${p.productName}</strong></td>
                                                <td>${p.categoryName}</td>
                                                <td>
                                                    <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="$"/>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${p.totalStock > 0}">
                                                            <span class="badge badge-success">${p.totalStock}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge badge-danger">Hết hàng</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <!-- Nút Sửa thông tin chung (Tên, Mô tả) -->
                                                    <a href="product-edit?id=${p.productID}" class="btn btn-warning btn-sm" title="Sửa thông tin chung">
                                                        <i class="fas fa-edit"></i>
                                                    </a>

                                                    <!-- Nút QUẢN LÝ VARIANT (Mới) -->
                                                    <a href="variant-list?productId=${p.productID}" class="btn btn-info btn-sm" title="Quản lý màu sắc & giá">
                                                        <i class="fas fa-layer-group"></i> Màu sắc
                                                    </a>

                                                    <a href="#" onclick="confirmDelete(${p.productID})" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- Footer -->
             <jsp:include page="inc/footer.jsp" />
        </div>
    </div>

    <!-- Page level plugins (DataTables) -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#dataTable').DataTable();
        });
        
        function confirmDelete(id) {
            if(confirm("Bạn có chắc muốn xóa sản phẩm ID: " + id + "?")) {
                window.location.href = "product-delete?id=" + id;
            }
        }
    </script>
</body>
</html>
