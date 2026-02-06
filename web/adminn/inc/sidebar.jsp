<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="AdminHome">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-headset"></i> <!-- Icon tai nghe -->
        </div>
        <div class="sidebar-brand-text mx-3">Headphone Admin</div>
    </a>

    <hr class="sidebar-divider my-0">

    <!-- Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="AdminHome"> <!-- Mapping tới Servlet -->
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Tổng quan</span>
        </a>
    </li>

    <hr class="sidebar-divider">

    <!-- Quản lý Sản phẩm -->
    <div class="sidebar-heading">Kinh doanh</div>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true">
            <i class="fas fa-fw fa-box"></i>
            <span>Sản phẩm</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="product-list">Danh sách Tai nghe</a>
                <a class="collapse-item" href="category-list">Danh mục (Category)</a>
            </div>
        </div>
    </li>

    <!-- Quản lý Đơn hàng -->
    <li class="nav-item">
        <a class="nav-link" href="order-list">
            <i class="fas fa-fw fa-shopping-cart"></i>
            <span>Đơn hàng (Orders)</span>
        </a>
    </li>
    
    <!-- Quản lý Kho -->
    <div class="sidebar-heading">Kho hàng</div>
    <li class="nav-item">
        <a class="nav-link" href="import-list">
            <i class="fas fa-fw fa-truck"></i>
            <span>Nhập hàng (Import)</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="supplier-list">
            <i class="fas fa-fw fa-building"></i>
            <span>Nhà cung cấp</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="user-list">
            <i class="fas fa-fw fa-building"></i>
            <span>Quản lý khách hàng</span>
        </a>
    </li>

    <hr class="sidebar-divider d-none d-md-block">
</ul>
