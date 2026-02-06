<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<body class="d-flex flex-column min-vh-100">
        <jsp:include page="/inc/_nav.jsp"></jsp:include>
        <main>
            <c:choose>
                <c:when test="${not empty listProducts}">
                    <div class="container py-5">
                        <h2 class="mb-4">Danh sách sản phẩm</h2> 
                        <div class="row g-4">   
                            <c:forEach items="${listProducts}" var="p">
                                <div class="col-12 col-md-6 col-lg-4 d-flex">
                                    <article class="card h-100 shadow-sm border-0">
                                        <a href="detail?id=${p.productID}" class="text-decoration-none product-img-wrap bg-light rounded-top">
                                            <img src="${pageContext.request.contextPath}/assets/images/${p.productName}/${p.imageUrl}" 
                                                 class="card-img-top p-3 img-primary" 
                                                 alt="${p.productName}" 
                                                 style="object-fit: contain; height: 400px;">
                                            <img src="${pageContext.request.contextPath}/assets/images/${p.productName}/${p.secondImageUrl}" 
                                                 class="card-img-top p-3 img-secondary" 
                                                 alt="${p.productName}" 
                                                 style="object-fit: contain; height: 400px;">
                                        </a>
                                        <div class="card-body d-flex flex-column p-3">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <h5 class="card-title mb-0 fs-6 text-truncate" style="max-width: 65%;">
                                                    <a href="#" class="text-dark text-decoration-none">${p.productName}</a>
                                                </h5>
                                                <span class="fw-bold text-primary small">$${p.price}</span>
                                            </div>
                                            <p class="card-text text-muted small flex-grow-1" style="font-size: 0.85rem;">
                                                ${p.description}
                                            </p>
                                            <div class="mt-auto">
                                                <a class="btn btn-outline-dark mt-auto" href="detail?id=${p.productID}">
                                                    <i class="fas fa-cog me-1"></i> Tùy chọn mua
                                                </a>
                                            </div>
                                        </div>
                                    </article>            
                                </div>
                            </c:forEach> 
                        </div>
                    </div>
                </c:when>

                <c:otherwise>
                    <!-- BẮT ĐẦU PHẦN CAROUSEL (SLIDER) -->
                    <div id="headerCarousel" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#headerCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#headerCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#headerCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active" style="height: 600px;">
                                <img src="${pageContext.request.contextPath}/assets/images/main4.png" class="d-block w-100 h-100" alt="Banner 1" style="object-fit: cover;">
                                <div class="carousel-caption d-none d-md-block pb-5 mb-5" style="background-color: rgba(0, 0, 0, 0.5); border-radius: 10px; padding: 20px;">
                                    <h1 class="display-4 fw-bolder">Âm thanh đỉnh cao</h1>
                                    <p class="lead fw-normal text-white-50">Trải nghiệm không gian âm nhạc sống động.</p>
                                    <a class="btn btn-primary btn-lg px-4" href="#featured-categories">Khám phá ngay</a>
                                </div>
                            </div>
                            <div class="carousel-item" style="height: 600px;">
                                <img src="${pageContext.request.contextPath}/assets/images/main3.png" class="d-block w-100 h-100" alt="Banner 2" style="object-fit: cover;">
                                <div class="carousel-caption d-none d-md-block pb-5 mb-5" style="background-color: rgba(0, 0, 0, 0.5); border-radius: 10px; padding: 20px;">
                                    <h1 class="display-4 fw-bolder">Thiết kế thời thượng</h1>
                                    <p class="lead fw-normal text-white-50">Phong cách hiện đại, dẫn đầu xu hướng.</p>
                                    <a class="btn btn-outline-light btn-lg px-4" href="#featured-categories">Xem chi tiết</a>
                                </div>
                            </div>
                            <div class="carousel-item" style="height: 600px;">
                                <img src="${pageContext.request.contextPath}/assets/images/main2.png" class="d-block w-100 h-100" alt="Banner 3" style="object-fit: cover;">
                                <div class="carousel-caption d-none d-md-block pb-5 mb-5" style="background-color: rgba(0, 0, 0, 0.5); border-radius: 10px; padding: 20px;">
                                    <h1 class="display-4 fw-bolder">Công nghệ chống ồn</h1>
                                    <p class="lead fw-normal text-white-50">Tận hưởng sự yên tĩnh tuyệt đối.</p>
                                    <a class="btn btn-primary btn-lg px-4" href="#featured-categories">Mua ngay</a>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#headerCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#headerCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>

                    <section class="py-5 bg-light" id="featured-categories">
                        <div class="container px-4 px-lg-5 mt-5">
                            <div class="text-center mb-5">
                                <h2 class="fw-bolder">Danh mục sản phẩm</h2>
                                <p class="text-muted">Lựa chọn phù hợp cho nhu cầu của bạn</p>
                            </div>
                            <div class="row gx-4 gx-lg-5 justify-content-center">
                                <div class="col-md-4 mb-5">
                                    <div class="card h-100 border-0 shadow-sm hover-top">
                                        <img class="card-img-top" src="${pageContext.request.contextPath}/assets/images/headphone.png" alt="Wireless Headphones" style="height: 250px; object-fit: cover;" />
                                        <div class="card-body p-4 text-center">
                                            <h5 class="card-title fw-bold">Head Phone</h5>
                                            <p class="card-text text-muted small">Tự do di chuyển, âm thanh trung thực.</p>
                                        </div>
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent text-center">
                                            <a class="btn btn-outline-dark mt-auto" href="home?cid=1">Xem thêm</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-5">
                                    <div class="card h-100 border-0 shadow-sm hover-top">
                                        <img class="card-img-top" src="${pageContext.request.contextPath}/assets/images/aerphone.png" alt="Gaming Headset" style="height: 250px; object-fit: cover;" />
                                        <div class="card-body p-4 text-center">
                                            <h5 class="card-title fw-bold">Aer Phone</h5>
                                            <p class="card-text text-muted small">Nhỏ gọn, tiện lợi, pin trâu.</p>
                                        </div>
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent text-center">
                                            <a class="btn btn-outline-dark mt-auto" href="home?cid=2">Xem thêm</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-5">
                                    <div class="card h-100 border-0 shadow-sm hover-top">
                                        <img class="card-img-top" src="${pageContext.request.contextPath}/assets/images/pads.png" alt="Earbuds" style="height: 250px; object-fit: cover;" />
                                        <div class="card-body p-4 text-center">
                                            <h5 class="card-title fw-bold">Aer Pads</h5>
                                            <p class="card-text text-muted small">Thoải mái, dễ chịu</p>
                                        </div>
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent text-center">
                                            <a class="btn btn-outline-dark mt-auto" href="home?cid=3">Xem thêm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </c:otherwise>
            </c:choose>
        </main>
        <jsp:include page="/inc/_footer.jsp"></jsp:include>
        <jsp:include page="/inc/scripts-global.jsp"></jsp:include>
    </body>