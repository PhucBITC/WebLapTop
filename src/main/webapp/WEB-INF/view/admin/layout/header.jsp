<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <style>
            /* Biến số để đồng nhất với Sidebar */
            :root {
                --nav-bg: rgba(26, 28, 35, 0.85);
                /* Dark Glass */
                --accent-color: #7c4dff;
                --glass-border: rgba(255, 255, 255, 0.1);
                --transition-fast: all 0.3s ease;
            }

            .sb-topnav {
                background: var(--nav-bg) !important;
                backdrop-filter: blur(12px);
                /* Hiệu ứng kính mờ */
                -webkit-backdrop-filter: blur(12px);
                border-bottom: 1px solid var(--glass-border);
                padding-right: 1rem;
                height: 65px;
            }

            /* Hiệu ứng Brand Logo */
            .navbar-brand {
                font-weight: 800 !important;
                letter-spacing: 1px;
                font-size: 1.4rem !important;
                transition: var(--transition-fast);
                background: linear-gradient(45deg, #fff 30%, var(--accent-color) 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }

            .navbar-brand:hover {
                transform: scale(1.05);
                filter: brightness(1.2);
            }

            /* Nút Toggle Sidebar xoay tròn khi hover */
            #sidebarToggle {
                transition: var(--transition-fast);
                border-radius: 50%;
                width: 40px;
                height: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: rgba(255, 255, 255, 0.7) !important;
            }

            #sidebarToggle:hover {
                background: rgba(255, 255, 255, 0.1);
                color: var(--accent-color) !important;
                transform: rotate(90deg);
            }

            /* User Name styling */
            .user-name-display {
                font-weight: 500;
                color: rgba(255, 255, 255, 0.9);
                margin-right: 10px;
                font-size: 0.9rem;
            }

            /* Dropdown Animation */
            .dropdown-menu {
                border: none !important;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5) !important;
                background: #212529 !important;
                border: 1px solid var(--glass-border) !important;
                transform: translateY(10px);
                opacity: 0;
                display: block;
                visibility: hidden;
                transition: all 0.3s ease;
            }

            .dropdown-menu.show {
                transform: translateY(0);
                opacity: 1;
                visibility: visible;
            }

            .dropdown-item {
                color: rgba(255, 255, 255, 0.7) !important;
                padding: 10px 20px !important;
                transition: var(--transition-fast);
            }

            .dropdown-item:hover {
                background: var(--accent-color) !important;
                color: #fff !important;
                padding-left: 25px !important;
                /* Hiệu ứng trượt nhẹ */
            }

            .dropdown-divider {
                border-top: 1px solid var(--glass-border);
            }
        </style>

        <nav class="sb-topnav navbar navbar-expand navbar-dark">
            <a class="navbar-brand ps-3" href="/admin">
                <i class="fas fa-laptop me-2"></i>Laptopshop
            </a>

            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
                <i class="fas fa-bars"></i>
            </button>

            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="user-info d-flex align-items-center">
                    <span class="user-name-display">
                        Xin chào,
                        <c:out value="${pageContext.request.userPrincipal.name}" />
                    </span>
                </div>
            </form>

            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle profile-icon" id="navbarDropdown" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"
                        style="background: var(--glass-border); border-radius: 50%; width: 40px; height: 40px; display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-user-circle fa-lg"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/admin/settings"><i class="fas fa-cog me-2"></i>Cài đặt</a>
                        </li>
                        <li><a class="dropdown-item" href="/admin/profile"><i class="fas fa-id-card me-2"></i>Hồ sơ cá
                                nhân</a></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li>
                            <form method="post" action="/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button class="dropdown-item text-danger">
                                    <i class="fas fa-sign-out-alt me-2"></i>Đăng xuất
                                </button>
                            </form>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>