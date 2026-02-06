<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<body>
        <jsp:include page="/inc/_nav.jsp"></jsp:include>
        <main class="flex-grow-1">
            <div class="container product-container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home" class="text-decoration-none text-muted"><i class="fas fa-home"></i> Trang chủ</a></li>
                        <li class="breadcrumb-item"><a href="#" class="text-decoration-none text-muted">${detail.categoryName}</a></li>
                        <li class="breadcrumb-item active fw-bold text-dark" aria-current="page">${detail.productName}</li>
                    </ol>
                </nav>        
                 <div class="row mt-4">
                    <div class="col-md-6 mb-4">
                        <div class="main-image-wrap">
                            <img id="mainImage" src="" alt="Vui lòng chọn màu sắc">
                        </div>
                        <div id="thumbnailContainer" class="thumb-container d-flex flex-wrap"></div>
                    </div>
                    
                    <div class="col-md-6">
                        <h1 class="fw-bold mb-2">${detail.productName}</h1>

                        <div class="mb-3">
                            <span class="badge bg-success rounded-pill px-3 py-2">Còn hàng</span>
                            <span class="text-muted ms-2 small">Mã SP: #${detail.productID}</span>
                        </div>
                        <h2 class="text-danger fw-bold mb-4" id="priceDisplay"></h2>
                        <p class="text-secondary mb-4" style="line-height: 1.6;">
                            ${detail.description}
                        </p>
                        <hr class="text-muted my-4">
                        
                        <form action="" method="">
                            <input type="hidden" name="productId" value="${detail.productID}">
                            <div class="mb-4">
                                <h6 class="fw-bold mb-3">Chọn Phiên Bản:</h6>
                                <div class="d-flex flex-wrap">
                                    <c:forEach items="${detail.variants}" var="v" varStatus="status">
                                        <div class="variant-option">
                                            <input type="radio" 
                                                   name="variantId" 
                                                   id="var_${v.variantID}" 
                                                   value="${v.variantID}" 
                                                   onchange="selectVariant(${v.variantID})"
                                                   ${status.first ? 'checked' : ''}>

                                            <label for="var_${v.variantID}">
                                                ${v.color}
                                            </label>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            
                            <div class="mb-4 d-flex align-items-center">
                                <h6 class="fw-bold me-3 mb-0">Số lượng:</h6>
                                <div class="input-group" style="width: 140px;">
                                    <button class="btn btn-outline-secondary" type="button" onclick="decrementQuantity()">-</button>
                                    <input type="text" class="form-control text-center" value="1" id="quantityInput" name="quantity">
                                    <button class="btn btn-outline-secondary" type="button" onclick="incrementQuantity()">+</button>
                                </div>
                            </div>
                            
                            <div class="d-grid gap-2 d-md-flex">
                                <button type="button" onclick="addToCartAjax()" class="btn btn-dark btn-lg flex-grow-1">
                                    <i class="fas fa-shopping-cart me-2"></i> THÊM VÀO GIỎ
                                </button>
                                <button type="button" class="btn btn-outline-danger btn-lg" title="Yêu thích">
                                    <i class="far fa-heart"></i>
                                </button>
                            </div>
                        </form>
                        
                        <div class="mt-4 p-3 bg-light rounded small border">
                            <ul class="list-unstyled mb-0 d-flex flex-column gap-2">
                                <li><i class="fas fa-truck text-primary me-2"></i> Miễn phí vận chuyển toàn quốc</li>
                                <li><i class="fas fa-shield-alt text-primary me-2"></i> Bảo hành chính hãng 24 tháng</li>
                                <li><i class="fas fa-sync text-primary me-2"></i> Đổi trả trong 7 ngày nếu lỗi</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/inc/_footer.jsp"></jsp:include>
        <jsp:include page="/inc/scripts-global.jsp"></jsp:include>
        <!-- Scripts Logic cho trang -->
        <script>
            var variantData = {};
            <c:forEach items="${detail.variants}" var="v">
                variantData[${v.variantID}] = {
                    price: '<fmt:formatNumber value="${v.price}" type="currency" currencySymbol="$"/>',
                    images: [
                        <c:forEach items="${v.images}" var="img">
                            "${pageContext.request.contextPath}/assets/images/${detail.productName}/${img}",
                        </c:forEach>
                    ]
                };
            </c:forEach>
            
            function selectVariant(variantId) {
                var data = variantData[variantId];
                if (!data) return;

                var priceEl = document.getElementById('priceDisplay');
                if (priceEl) {
                    priceEl.innerText = data.price;
                }
                var container = document.getElementById('thumbnailContainer');
                var mainImg = document.getElementById('mainImage');
                
                container.innerHTML = "";
                if (data.images && data.images.length > 0) {
                    mainImg.src = data.images[0];
                    data.images.forEach(function(imgUrl, index) {
                        var img = document.createElement('img');
                        img.src = imgUrl;
                        img.className = 'product-thumbnail'; // Class style ở thẻ style trên
                        if (index === 0) img.classList.add('active');
                        img.onclick = function() { changeMainImage(this); };
                        container.appendChild(img);
                    });
                } else {
                    mainImg.src = "https://via.placeholder.com/500x500?text=No+Image";
                }
            }
            
            function changeMainImage(element) {
                var mainImg = document.getElementById('mainImage');
                mainImg.src = element.src;        
                var thumbnails = document.getElementsByClassName('product-thumbnail');
                for (var i = 0; i < thumbnails.length; i++) {
                    thumbnails[i].classList.remove('active');
                }
                element.classList.add('active');
            }
            
            function incrementQuantity() {
                var input = document.getElementById('quantityInput');
                var current = parseInt(input.value);
                if(!isNaN(current)) input.value = current + 1;
            }

            function decrementQuantity() {
                var input = document.getElementById('quantityInput');
                var current = parseInt(input.value);
                if(!isNaN(current) && current > 1) input.value = current - 1;
            }

            window.onload = function() {
                var checkedInput = document.querySelector('input[name="variantId"]:checked');
                if (checkedInput) {
                    selectVariant(checkedInput.value);
                }
            };
            
            function addToCartAjax() {
                var checkedInput = document.querySelector('input[name="variantId"]:checked');
                if (!checkedInput) {
                    alert("Vui lòng chọn màu sắc!");
                    return;
                }
                var vId = checkedInput.value;
                var qty = document.getElementById('quantityInput').value;
                var url = "${pageContext.request.contextPath}/cart";

                fetch(url, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: 'variantId=' + vId + '&quantity=' + qty
                })
                .then(response => {
                    if (response.ok) return response.json();
                    throw new Error('Lỗi mạng hoặc server');
                })
                .then(data => {
                    var cartBadge = document.getElementById('cartTotal');
                    if (cartBadge) cartBadge.innerText = data.totalQuantity;
                    // Có thể thêm thông báo Toast thành công ở đây
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("Có lỗi xảy ra, vui lòng thử lại.");
                });
            }
        </script>  
    </body>