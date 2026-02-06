<!-- admin/product-add.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="inc/head.jsp" />
    <title>Thêm sản phẩm mới</title>
</head>

<body id="page-top">
    <div id="wrapper">
        <jsp:include page="inc/sidebar.jsp" />
        
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- ... Copy topbar từ file khác ... -->
                </nav>

                <div class="container-fluid">
                    <h1 class="h3 mb-4 text-gray-800">Thêm sản phẩm mới</h1>

                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <!-- Form gửi dữ liệu về Servlet bằng method POST -->
                            <form action="product-add" method="POST">
                                
                                <div class="form-group">
                                    <label>Tên sản phẩm</label>
                                    <input type="text" class="form-control" name="productName" required placeholder="Nhập tên tai nghe...">
                                </div>

                                <div class="form-group">
                                    <label>Danh mục</label>
                                    <select class="form-control" name="categoryId">
                                        <!-- Đổ dữ liệu Category từ Servlet vào đây -->
                                        <c:forEach items="${categories}" var="c">
                                            <option value="${c.categoryID}">${c.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Mô tả chi tiết</label>
                                    <textarea class="form-control" name="description" rows="5" placeholder="Mô tả tính năng, âm thanh..."></textarea>
                                </div>

                                <button type="submit" class="btn btn-primary">Lưu sản phẩm</button>
                                <a href="product-list" class="btn btn-secondary">Hủy</a>
                            </form>
                        </div>
                    </div>
                </div> <!-- End Container -->
            </div>
            <jsp:include page="inc/footer.jsp" />
        </div>
    </div>
</body>
</html>
