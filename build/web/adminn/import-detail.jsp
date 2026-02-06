<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="inc/head.jsp" />
    <title>Chi tiết phiếu nhập #${imp.importId}</title>

    <!-- Select2 cho dropdown sản phẩm -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <style>
        .select2-container .select2-selection--single { 
            height: 38px !important; 
            border: 1px solid #d1d3e2 !important; 
        }
        .select2-selection__rendered { 
            line-height: 36px !important; 
        }
        .select2-container--default .select2-selection--single .select2-selection__arrow { 
            height: 36px !important; 
        }
    </style>
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
                    <h1 class="h3 mb-0 text-gray-800 ml-3">Chi tiết phiếu nhập</h1>
                </nav>

                <div class="container-fluid mt-2">

                    <a href="import-list" class="btn btn-secondary btn-sm mb-3">
                        <i class="fas fa-arrow-left"></i> Quay lại danh sách
                    </a>

                    <!-- Thông tin phiếu -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex justify-content-between align-items-center">
                            <h6 class="m-0 font-weight-bold text-primary">
                                Thông tin phiếu nhập #${imp.importId}
                            </h6>

                            <c:if test="${imp.status == 'Completed'}">
                                <span class="badge badge-success px-3 py-2">Đã hoàn tất</span>
                            </c:if>
                            <c:if test="${imp.status != 'Completed'}">
                                <span class="badge badge-warning px-3 py-2">Đang nhập hàng</span>
                            </c:if>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <strong>Nhà cung cấp:</strong><br/>
                                    ${imp.supplierName}
                                </div>
                                <div class="col-md-4">
                                    <strong>Ngày tạo:</strong><br/>
                                    ${imp.dateImport}
                                </div>
                                <div class="col-md-4">
                                    <strong>Tổng tiền hiện tại:</strong><br/>
                                    <span class="text-danger font-weight-bold">
                                        <fmt:formatNumber value="${imp.totalAmount}" type="currency" currencySymbol="₫"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Form thêm sản phẩm vào phiếu (chỉ khi chưa Completed) -->
                    <c:if test="${imp.status != 'Completed'}">
                        <div class="card shadow mb-4 border-left-primary">
                            <div class="card-body">
                                <form action="import-detail" method="POST" class="row align-items-end">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="importId" value="${imp.importId}">

                                    <div class="col-md-5 form-group">
                                        <label class="font-weight-bold">Chọn sản phẩm nhập:</label>
                                        <select class="form-control select2-product" name="variantId" required>
                                            <option value="">-- Tìm kiếm sản phẩm --</option>
                                            <c:forEach items="${variants}" var="v">
                                                <option value="${v.variantID}">
                                                    ${v.productName} - ${v.color} (Tồn: ${v.stockQuantity})
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-md-3 form-group">
                                        <label class="font-weight-bold">Giá nhập đơn vị (VNĐ):</label>
                                        <input type="number" class="form-control" name="price" min="0" required placeholder="Nhập giá vốn...">
                                    </div>

                                    <div class="col-md-2 form-group">
                                        <label class="font-weight-bold">Số lượng:</label>
                                        <input type="number" class="form-control" name="quantity" min="1" value="1" required>
                                    </div>

                                    <div class="col-md-2 form-group">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            <i class="fas fa-plus-circle"></i> Thêm
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </c:if>

                    <!-- Bảng chi tiết các dòng nhập -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Danh sách hàng trong phiếu</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped" width="100%" cellspacing="0">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th>Màu sắc</th>
                                            <th>Giá nhập</th>
                                            <th>Số lượng</th>
                                            <th>Thành tiền</th>
                                            <c:if test="${imp.status != 'Completed'}">
                                                <th class="text-center">Xóa</th>
                                            </c:if>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${details}" var="d">
                                            <tr>
                                                <td>${d.productName}</td>
                                                <td>${d.color}</td>
                                                <td>
                                                    <fmt:formatNumber value="${d.priceImport}" type="currency" currencySymbol="₫"/>
                                                </td>
                                                <td class="text-center font-weight-bold">
                                                    ${d.quantity_Import}
                                                </td>
                                                <td class="text-right">
                                                    <fmt:formatNumber value="${d.quantity_Import * d.priceImport}" type="currency" currencySymbol="₫"/>
                                                </td>

                                                <c:if test="${imp.status != 'Completed'}">
                                                    <td class="text-center">
                                                        <form action="import-detail" method="POST"
                                                              onsubmit="return confirm('Xóa sản phẩm này khỏi phiếu?');">
                                                            <input type="hidden" name="action" value="delete">
                                                            <input type="hidden" name="importId" value="${imp.importId}">
                                                            <input type="hidden" name="variantId" value="${d.variantID}">
                                                            <button type="submit" class="btn btn-danger btn-sm btn-circle">
                                                                <i class="fas fa-trash"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>

                                        <c:if test="${empty details}">
                                            <tr>
                                                <td colspan="6" class="text-center text-muted py-4">
                                                    Chưa có sản phẩm nào được thêm vào phiếu này.
                                                </td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Nút hoàn tất phiếu -->
                        <c:if test="${imp.status != 'Completed' && not empty details}">
                            <div class="card-footer text-right">
                                <form action="import-detail" method="POST"
                                      onsubmit="return confirm('Xác nhận hoàn tất? Kho sẽ được cập nhật và phiếu sẽ bị khóa.');">
                                    <input type="hidden" name="action" value="complete">
                                    <input type="hidden" name="importId" value="${imp.importId}">
                                    <span class="mr-3 text-muted small">Kiểm tra kỹ trước khi lưu.</span>
                                    <button type="submit" class="btn btn-success btn-lg">
                                        <i class="fas fa-check-circle"></i> Hoàn tất Nhập kho
                                    </button>
                                </form>
                            </div>
                        </c:if>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            $('.select2-product').select2({
                placeholder: "Gõ tên sản phẩm để tìm...",
                allowClear: true,
                width: '100%'
            });
        });
    </script>

    <jsp:include page="inc/footer.jsp" />
</body>
</html>
