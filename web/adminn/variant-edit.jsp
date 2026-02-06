<!-- admin/variant-edit.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="inc/head.jsp" />
    <title>Sửa phiên bản</title>
</head>

<body id="page-top">
    <div id="wrapper">
        <jsp:include page="inc/sidebar.jsp" />
        
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Copy Topbar -->
                </nav>

                <div class="container-fluid">
                    
                    <!-- Breadcrumb -->
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="product-list">Sản phẩm</a></li>
                            <li class="breadcrumb-item"><a href="variant-list?productId=${product.productID}">${product.productName}</a></li>
                            <li class="breadcrumb-item active">Sửa màu: ${variant.color}</li>
                        </ol>
                    </nav>

                    <div class="card shadow mb-4" style="max-width: 800px; margin: 0 auto;">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Cập nhật phiên bản</h6>
                        </div>
                        <div class="card-body">
                            
                            <form action="variant-edit" method="POST">
                                <!-- Input Ẩn -->
                                <input type="hidden" name="id" value="${variant.variantID}">
                                <input type="hidden" name="productId" value="${product.productID}">

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="font-weight-bold">Màu sắc</label>
                                        <input type="text" class="form-control" name="color" required 
                                               value="${variant.color}">
                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                        <label class="font-weight-bold">Tồn kho</label>
                                        <input type="number" class="form-control" name="stock" required min="0" 
                                               value="${variant.stockQuantity}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="font-weight-bold">Giá bán (VNĐ)</label>
                                    <div class="input-group">
                                        <!-- Lưu ý: Định dạng giá khi hiển thị lại trong input number phải là số thuần, ko dấu phẩy -->
                                        <!-- Dùng fmt:formatNumber với pattern="#" để bỏ số thập phân thừa -->
                                        <input type="number" class="form-control" name="price" required min="0" 
                                               value="${String.format('%.0f', variant.price)}"> 
                                        <div class="input-group-append">
                                            <span class="input-group-text">VNĐ</span>
                                        </div>
                                    </div>
                                </div>

                                <hr>
                                <div class="d-flex justify-content-end">
                                    <a href="variant-list?productId=${product.productID}" class="btn btn-secondary mr-2">Hủy bỏ</a>
                                    <button type="submit" class="btn btn-primary px-4">Lưu thay đổi</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
            <jsp:include page="inc/footer.jsp" />
        </div>
    </div>
</body>
</html>
