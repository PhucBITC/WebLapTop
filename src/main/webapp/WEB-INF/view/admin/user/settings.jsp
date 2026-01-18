<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Cài đặt - Laptopshop</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap"
                    rel="stylesheet">
                <style>
                    :root {
                        --bg-dark: #0f111a;
                        --card-glass: rgba(255, 255, 255, 0.03);
                        --accent-purple: #7c4dff;
                        --border-glass: rgba(255, 255, 255, 0.1);
                        --text-muted: #94a3b8;
                    }

                    body {
                        font-family: 'Inter', sans-serif !important;
                        background-color: var(--bg-dark) !important;
                        color: #fff;
                    }

                    #layoutSidenav_content {
                        background-image: radial-gradient(circle at top right, rgba(124, 77, 255, 0.05), transparent);
                    }

                    .settings-card {
                        background: var(--card-glass);
                        backdrop-filter: blur(15px);
                        border: 1px solid var(--border-glass);
                        border-radius: 24px;
                        padding: 40px;
                        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
                        animation: fadeInUp 0.6s ease-out;
                    }

                    @keyframes fadeInUp {
                        from {
                            opacity: 0;
                            transform: translateY(20px);
                        }

                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    .form-control {
                        background: rgba(255, 255, 255, 0.05);
                        border: 1px solid var(--border-glass);
                        color: #fff;
                        padding: 12px 20px;
                        border-radius: 12px;
                    }

                    .form-control:focus {
                        background: rgba(255, 255, 255, 0.08);
                        border-color: var(--accent-purple);
                        color: #fff;
                        box-shadow: 0 0 0 4px rgba(124, 77, 255, 0.15);
                    }

                    .form-label {
                        font-weight: 600;
                        color: var(--text-muted);
                        margin-bottom: 8px;
                        font-size: 0.9rem;
                    }

                    .btn-primary {
                        background: linear-gradient(135deg, var(--accent-purple) 0%, #a259ff 100%);
                        border: none;
                        padding: 12px 30px;
                        border-radius: 12px;
                        font-weight: 600;
                        letter-spacing: 0.5px;
                        transition: 0.3s;
                    }

                    .btn-primary:hover {
                        background-color: #0b5ed7;
                        transform: translateY(-2px);
                        box-shadow: 0 6px 14px rgba(13, 110, 253, 0.4);
                    }
                </style>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Cài đặt tài khoản</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin" class="text-decoration-none"
                                            style="color: var(--text-muted);">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Settings</li>
                                </ol>

                                <div class="row justify-content-center">
                                    <div class="col-lg-6">
                                        <div class="settings-card mb-5">
                                            <h4 class="mb-4"><i class="fas fa-lock me-2"></i>Đổi mật khẩu</h4>

                                            <c:if test="${not empty success}">
                                                <div
                                                    class="alert alert-success border-0 bg-success bg-opacity-25 text-white mb-4">
                                                    ${success}</div>
                                            </c:if>
                                            <c:if test="${not empty error}">
                                                <div
                                                    class="alert alert-danger border-0 bg-danger bg-opacity-25 text-white mb-4">
                                                    ${error}</div>
                                            </c:if>

                                            <form action="/admin/settings" method="post">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <div class="mb-3">
                                                    <label class="form-label">Mật khẩu hiện tại</label>
                                                    <input type="password" name="currentPassword" class="form-control"
                                                        required />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Mật khẩu mới</label>
                                                    <input type="password" name="newPassword" class="form-control"
                                                        required />
                                                </div>
                                                <div class="mb-4">
                                                    <label class="form-label">Xác nhận mật khẩu mới</label>
                                                    <input type="password" name="confirmPassword" class="form-control"
                                                        required />
                                                </div>
                                                <div class="d-flex justify-content-end">
                                                    <button type="submit" class="btn btn-primary">Cập nhật mật
                                                        khẩu</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>