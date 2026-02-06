<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 1. Include Head (CSS, Title) -->
    <jsp:include page="inc/head.jsp" />
    <title>Quản lý Variant - ${product.productName}</title>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- 2. Include Sidebar -->
        <jsp:include page="inc/sidebar.jsp" />

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- 3. Topbar (Bắt buộc phải có để đẩy nội dung xuống, nếu không sẽ bị che) -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <!-- Page Heading -->
                    <h1 class="h3 mb-0 text-gray-800 ml-3">Chi tiết sản phẩm</h1>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content (Nội dung chính của bạn nằm ở đây) -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Sản phẩm: ${product.productName}</h1>
                        <a href="product-list" class="btn btn-sm btn-secondary shadow-sm">
                            <i class="fas fa-arrow-left fa-sm text-white-50"></i> Quay lại danh sách
                        </a>
                    </div>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Danh mục: ${product.categoryName}</h6>
                        </div>
                        <div class="card-body">
                            
                            <!-- Nút Thêm mới -->
                            <a href="variant-add?productId=${product.productID}" class="btn btn-primary mb-3">
                                <i class="fas fa-plus"></i> Thêm màu mới
                            </a>

                            <!-- Bảng dữ liệu -->
                            <div class="table-responsive">
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Màu sắc</th>
                                            <th>Giá bán</th>
                                            <th>Tồn kho</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Kiểm tra nếu list rỗng -->
                                        <c:if test="${empty variantList}">
                                            <tr>
                                                <td colspan="5" class="text-center">Chưa có phiên bản nào. Hãy thêm mới!</td>
                                            </tr>
                                        </c:if>

                                        <c:forEach items="${variantList}" var="v">
                                            <tr>
                                                <td>${v.variantID}</td>
                                                <td>
                                                    <span class="badge badge-secondary" style="font-size: 1rem;">${v.color}</span>
                                                </td>
                                                <td>
                                                    <fmt:formatNumber value="${v.price}" type="currency" currencySymbol="$"/>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${v.stockQuantity > 0}">
                                                            <span class="text-success font-weight-bold">${v.stockQuantity}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="text-danger font-weight-bold">Hết hàng</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="variant-edit?id=${v.variantID}" class="btn btn-sm btn-warning">
                                                        <i class="fas fa-edit"></i> Sửa
                                                    </a>
                                                    <a href="#" onclick="if(confirm('Xóa màu này?')) window.location.href='variant-delete?id=${v.variantID}'" class="btn btn-sm btn-danger">
                                                        <i class="fas fa-trash"></i> Xóa
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div> <!-- End Table Responsive -->
                        </div> <!-- End Card Body -->
                    </div> <!-- End Card -->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- 4. Footer -->
            <jsp:include page="inc/footer.jsp" />

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

</body>
</html>
