<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    /* Biến số đồng bộ với hệ thống Light Mode */
    :root {
        --footer-bg: #ffffff;
        --accent-blue: #0d6efd;
        --border-color: #e2e8f0;
        --text-muted: #64748b;
        --transition-std: all 0.3s ease;
    }

    .footer-modern {
        background: var(--footer-bg) !important;
        border-top: 1px solid var(--border-color);
        color: var(--text-muted) !important;
        position: relative;
    }

    .footer-link {
        color: var(--text-muted) !important;
        text-decoration: none !important;
        transition: var(--transition-std);
        display: inline-flex;
        align-items: center;
        padding: 5px 12px;
        border-radius: 8px;
        font-weight: 500;
    }

    .footer-link:hover {
        color: var(--accent-blue) !important;
        background: #f1f5f9;
        transform: translateY(-2px);
    }

    .footer-link i {
        font-size: 1.1rem;
        transition: var(--transition-std);
    }

    .footer-link:hover .fa-globe { color: var(--accent-blue); }
    .footer-link:hover .fa-youtube { color: #ff0000; }

    .copyright-text {
        font-size: 0.9rem;
        letter-spacing: 0.5px;
    }

    .brand-highlight {
        color: var(--accent-blue);
        font-weight: 700;
        text-transform: uppercase;
    }
</style>

<footer class="py-4 mt-auto footer-modern">
    <div class="container-fluid px-4">
        <div class="d-flex align-items-center justify-content-between small">
            <div class="copyright-text">
                Copyright &copy; <span class="brand-highlight">Phuc Viet</span> 2026 
                <span class="ms-2 d-none d-sm-inline">&middot; All rights reserved</span>
            </div>    
        </div>
    </div>
</footer>