<!-- admin/product-edit.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="inc/head.jsp" />
    <title>Cập nhật sản phẩm</title>
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
                    <h1 class="h3 mb-0 text-gray-800 ml-3">Chỉnh sửa sản phẩm</h1>
                </nav>

                <!-- Main Content -->
                <div class="container-fluid">
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">ID Sản phẩm: ${product.productID}</h6>
                        </div>
                        <div class="card-body">
                            
                            <!-- Báo lỗi nếu có -->
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">${error}</div>
                            </c:if>

                            <form action="product-edit" method="POST">
                                <!-- INPUT ẨN QUAN TRỌNG: Để Servlet biết đang sửa ID nào -->
                                <input type="hidden" name="id" value="${product.productID}">

                                <div class="form-group">
                                    <label class="font-weight-bold">Tên sản phẩm</label>
                                    <input type="text" class="form-control" name="productName" required 
                                           value="${product.productName}"> <!-- Hiển thị tên cũ -->
                                </div>

                                <div class="form-group">
                                    <label class="font-weight-bold">Danh mục</label>
                                    <select class="form-control" name="categoryId">
                                        <c:forEach items="${categories}" var="c">
                                            <!-- LOGIC CHỌN MỤC CŨ: 
                                                 So sánh tên danh mục của SP hiện tại với tên trong list.
                                                 Lưu ý: Nếu DTO của bạn có field 'categoryID' thì so sánh ID sẽ chuẩn hơn.
                                                 Nhưng ở đây mình so sánh Name vì DTO ProductDetailDTO của bạn đang lưu CategoryName.
                                            -->
                                            <option value="${c.categoryID}" ${c.categoryName == product.categoryName ? 'selected' : ''}>
                                                ${c.categoryName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="font-weight-bold">Mô tả chi tiết</label>
                                    <textarea class="form-control" name="description" rows="6">${product.description}</textarea> <!-- Hiển thị mô tả cũ -->
                                </div>

                                <hr>
                                <div class="d-flex justify-content-end">
                                    <a href="product-list" class="btn btn-secondary mr-2">Hủy bỏ</a>
                                    <button type="submit" class="btn btn-primary px-4">
                                        <i class="fas fa-save"></i> Cập nhật
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
