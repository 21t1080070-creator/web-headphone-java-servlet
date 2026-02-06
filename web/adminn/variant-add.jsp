<!-- admin/variant-add.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="inc/head.jsp" />
    <title>Thêm Phiên bản mới</title>
</head>

<body id="page-top">
    <div id="wrapper">
        <!-- Sidebar -->
        <jsp:include page="inc/sidebar.jsp" />
        
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <!-- Page Heading -->
                    <h1 class="h3 mb-0 text-gray-800 ml-3">Quản lý phiên bản</h1>
                </nav>

                <!-- Main Content -->
                <div class="container-fluid">
                    
                    <!-- Breadcrumb điều hướng cho dễ dùng -->
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="product-list">Sản phẩm</a></li>
                            <li class="breadcrumb-item"><a href="variant-list?productId=${product.productID}">${product.productName}</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Thêm màu mới</li>
                        </ol>
                    </nav>

                    <div class="card shadow mb-4" style="max-width: 800px; margin: 0 auto;">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Thêm phiên bản cho: ${product.productName}</h6>
                        </div>
                        <div class="card-body">
                            
                            <!-- Hiển thị thông báo lỗi nếu có -->
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">${error}</div>
                            </c:if>

                            <form action="variant-add" method="POST">
                                <!-- INPUT QUAN TRỌNG: Product ID (Ẩn) -->
                                <input type="hidden" name="productId" value="${product.productID}">

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="font-weight-bold">Màu sắc <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" name="color" required 
                                               placeholder="Ví dụ: Đen nhám, Trắng ngọc trai...">
                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                        <label class="font-weight-bold">Số lượng tồn kho ban đầu</label>
                                        <input type="number" class="form-control" name="stock" value="0" min="0" required
                                               title="Nhập 0 nếu chưa có hàng">
                                        <small class="form-text text-muted">Có thể nhập hàng sau ở module Nhập kho.</small>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="font-weight-bold">Giá bán ($) <span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <input type="number" class="form-control" name="price" required min="0" 
                                               placeholder="Ví dụ: 5000000">
                                        <div class="input-group-append">
                                            <span class="input-group-text">VNĐ</span>
                                        </div>
                                    </div>
                                </div>

                                <hr>
                                
                                <div class="d-flex justify-content-end">
                                    <a href="variant-list?productId=${product.productID}" class="btn btn-secondary mr-2">Hủy bỏ</a>
                                    <button type="submit" class="btn btn-primary px-4">
                                        <i class="fas fa-save"></i> Lưu phiên bản
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div> <!-- /.container-fluid -->
            </div>
            
            <jsp:include page="inc/footer.jsp" />
        </div>
    </div>
</body>
</html>
