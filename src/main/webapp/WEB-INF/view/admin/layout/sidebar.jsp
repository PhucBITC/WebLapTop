<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    /* Định nghĩa các biến màu sắc hiện đại */
    :root {
        --sidebar-bg: #1a1c23;
        --accent-color: #7c4dff; /* Màu tím hiện đại */
        --hover-bg: rgba(124, 77, 255, 0.15);
        --text-muted: #9e9e9e;
        --transition-speed: 0.4s;
    }

    #layoutSidenav_nav {
        background-color: var(--sidebar-bg);
        box-shadow: 4px 0 10px rgba(0, 0, 0, 0.3);
    }

    .sb-sidenav-dark {
        background-color: transparent !important;
    }

    /* Hiệu ứng trượt vào (Slide-in) cho toàn bộ Sidebar */
    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .nav-link {
        color: rgba(255, 255, 255, 0.7) !important;
        margin: 8px 15px;
        border-radius: 12px !important;
        transition: all var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1) !important; /* Cải tiến từ transition cũ [cite: 2] */
        padding: 12px 15px !important;
        animation: fadeInUp 0.5s ease-out forwards;
    }

    /* Tinh chỉnh hiệu ứng Hover */
    .nav-link:hover {
        background-color: var(--hover-bg) !important; /* Sáng hơn so với bản cũ [cite: 3] */
        color: #fff !important;
        transform: translateX(8px) scale(1.02) !important; /* Di chuyển xa hơn và phóng to nhẹ [cite: 4] */
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    }

    /* Hiệu ứng xoay nhẹ icon khi hover */
    .nav-link:hover .sb-nav-link-icon {
        color: var(--accent-color);
        transform: rotate(15deg);
        transition: transform 0.3s ease;
    }

    .sb-nav-link-icon {
        transition: color 0.3s ease;
        font-size: 1.1rem;
    }

    .sb-sidenav-menu-heading {
        color: var(--accent-color) !important;
        font-weight: 700 !important;
        text-transform: uppercase;
        letter-spacing: 1.5px;
        font-size: 0.75rem !important;
        margin-top: 1.5rem !important;
        padding-left: 25px !important;
    }

    /* Sidebar Footer phong cách mới */
    .sb-sidenav-footer {
        background-color: rgba(0, 0, 0, 0.2) !important;
        border-top: 1px solid rgba(255, 255, 255, 0.05) !important;
        padding: 1rem 1.5rem !important;
    }

    .footer-user-name {
        color: #fff;
        font-weight: 600;
        display: block;
        margin-top: 4px;
    }
</style>

<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Quản trị hệ thống</div> <a class="nav-link" href="/admin" style="animation-delay: 0.1s;"> <div class="sb-nav-link-icon"><i class="fas fa-chart-line"></i></div>
                    Dashboard
                </a>

                <a class="nav-link" href="/admin/user" style="animation-delay: 0.2s;"> <div class="sb-nav-link-icon"><i class="fas fa-user-shield"></i></div>
                    Người dùng
                </a>

                <a class="nav-link" href="/admin/product" style="animation-delay: 0.3s;"> <div class="sb-nav-link-icon"><i class="fas fa-shopping-bag"></i></div>
                    Sản phẩm
                </a>

                <a class="nav-link" href="/admin/order" style="animation-delay: 0.4s;"> <div class="sb-nav-link-icon"><i class="fas fa-file-invoice-dollar"></i></div>
                    Đơn hàng
                </a>
            </div>
        </div>
        
        <div class="sb-sidenav-footer">
            <div class="small" style="color: var(--text-muted);">Đang đăng nhập:</div>
            <span class="footer-user-name">
                <i class="fas fa-circle text-success me-1" style="font-size: 0.6rem;"></i>
                <c:out value="${pageContext.request.userPrincipal.name}" /> </span>
        </div>
    </nav>
</div>