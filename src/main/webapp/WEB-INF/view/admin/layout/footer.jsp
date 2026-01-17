<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    /* Biến số đồng bộ với hệ thống */
    :root {
        --footer-bg: rgba(26, 28, 35, 0.95);
        --accent-purple: #7c4dff;
        --glass-border: rgba(255, 255, 255, 0.05);
        --transition-std: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    .footer-modern {
        background: var(--footer-bg) !important;
        backdrop-filter: blur(10px);
        border-top: 1px solid var(--glass-border);
        color: rgba(255, 255, 255, 0.6) !important;
        position: relative;
        overflow: hidden;
    }

    /* Hiệu ứng đường kẻ màu tím chạy phía trên footer */
    .footer-modern::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 1px;
        background: linear-gradient(90deg, transparent, var(--accent-purple), transparent);
    }

    .footer-link {
        color: rgba(255, 255, 255, 0.5) !important;
        text-decoration: none !important;
        transition: var(--transition-std);
        display: inline-flex;
        align-items: center;
        padding: 5px 10px;
        border-radius: 8px;
    }

    .footer-link:hover {
        color: #fff !important;
        background: rgba(255, 255, 255, 0.05);
        transform: translateY(-3px);
    }

    .footer-link i {
        font-size: 1.1rem;
        transition: var(--transition-std);
    }

    .footer-link:hover .fa-globe { color: #00d2ff; }
    .footer-link:hover .fa-youtube { color: #ff0000; }

    .copyright-text {
        font-size: 0.9rem;
        letter-spacing: 0.5px;
    }

    .brand-highlight {
        color: var(--accent-purple);
        font-weight: 700;
        text-transform: uppercase;
    }
</style>

<footer class="py-4 mt-auto footer-modern">
    <div class="container-fluid px-4">
        <div class="d-flex align-items-center justify-content-between small">
            <div class="copyright-text">
                Copyright &copy; <span class="brand-highlight">Phucxo IT</span> 2026 
                <span class="ms-2 d-none d-sm-inline">&middot; All rights reserved</span>
            </div>

            <div class="d-flex gap-2">
                <a href="#" target="_blank" class="footer-link">
                    <i class="fas fa-globe me-2"></i>
                    <span>Website</span>
                </a>
                <span class="text-muted d-flex align-items-center">&middot;</span>
                <a href="#" target="_blank" class="footer-link">
                    <i class="fab fa-youtube me-2"></i>
                    <span>Youtube channel</span>
                </a>
            </div>
        </div>
    </div>
</footer>