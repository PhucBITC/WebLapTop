<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Phuc Viet IT - Dự án laptopshop" />
                <meta name="author" content="Phuc Viet IT" />
                <title>Delete User - Phuc Viet IT</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <link rel="shortcut icon" href="https://scontent.fvii2-1.fna.fbcdn.net/..." type="image/x-icon">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap"
                    rel="stylesheet">
                <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />


                <style>
                    :root {
                        --bg-dark: #0f111a;
                        --card-glass: rgba(255, 255, 255, 0.03);
                        --danger-glow: rgba(239, 68, 68, 0.2);
                        --border-glass: rgba(255, 255, 255, 0.1);
                        --text-muted: #94a3b8;
                    }

                    body {
                        font-family: 'Inter', sans-serif !important;
                        background-color: var(--bg-dark) !important;
                        color: #fff;
                    }

                    #layoutSidenav_content {
                        background-image: radial-gradient(circle at center, rgba(239, 68, 68, 0.03), transparent);
                    }

                    /* Container xác nhận xóa */
                    .delete-container {
                        background: var(--card-glass);
                        backdrop-filter: blur(15px);
                        border: 1px solid var(--border-glass);
                        border-radius: 24px;
                        padding: 50px 40px;
                        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.5);
                        max-width: 600px;
                        margin: 60px auto;
                        text-align: center;
                        animation: zoomIn 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
                    }

                    @keyframes zoomIn {
                        from {
                            opacity: 0;
                            transform: scale(0.9);
                        }

                        to {
                            opacity: 1;
                            transform: scale(1);
                        }
                    }

                    /* Icon cảnh báo */
                    .warning-icon-wrapper {
                        width: 100px;
                        height: 100px;
                        background: rgba(239, 68, 68, 0.1);
                        color: #ef4444;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0 auto 25px;
                        font-size: 3rem;
                        box-shadow: 0 0 30px var(--danger-glow);
                        border: 2px solid rgba(239, 68, 68, 0.2);
                    }

                    .delete-title {
                        font-weight: 800;
                        font-size: 1.75rem;
                        letter-spacing: -0.5px;
                        margin-bottom: 15px;
                    }

                    .delete-subtitle {
                        color: var(--text-muted);
                        font-size: 1.1rem;
                        margin-bottom: 35px;
                        line-height: 1.6;
                    }

                    .user-id-badge {
                        background: rgba(255, 255, 255, 0.05);
                        padding: 4px 12px;
                        border-radius: 8px;
                        color: #fff;
                        font-family: monospace;
                        border: 1px solid var(--border-glass);
                    }

                    /* Nút bấm */
                    .btn-confirm-delete {
                        background: linear-gradient(135deg, #ef4444 0%, #b91c1c 100%);
                        border: none;
                        color: #fff;
                        padding: 14px 40px;
                        border-radius: 14px;
                        font-weight: 700;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        transition: 0.3s;
                        box-shadow: 0 10px 20px rgba(239, 68, 68, 0.2);
                        margin: 0 10px;
                    }

                    .btn-confirm-delete:hover {
                        transform: translateY(-3px);
                        box-shadow: 0 15px 30px rgba(239, 68, 68, 0.4);
                        filter: brightness(1.1);
                    }

                    .btn-cancel-delete {
                        background: rgba(255, 255, 255, 0.05);
                        border: 1px solid var(--border-glass);
                        color: #fff;
                        padding: 14px 40px;
                        border-radius: 14px;
                        font-weight: 600;
                        transition: 0.3s;
                        text-decoration: none;
                        display: inline-block;
                        margin: 0 10px;
                    }

                    .btn-cancel-delete:hover {
                        background: rgba(255, 255, 255, 0.1);
                        color: #fff;
                        transform: translateY(-3px);
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
                                <h1 class="mt-4">Quản lý người dùng</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/user">Người dùng</a></li>
                                    <li class="breadcrumb-item active">Xác nhận xóa</li>
                                </ol>

                                <div class="delete-container">
                                    <div class="warning-icon-wrapper">
                                        <i class="fas fa-exclamation-triangle"></i>
                                    </div>

                                    <h2 class="delete-title">Xác nhận xóa người dùng?</h2>
                                    <p class="delete-subtitle">
                                        Xóa vĩnh viễn tài khoản có mã
                                        <span class="user-id-badge">${deleteUser}</span>.
                                        <br>Hành động này <strong>không thể hoàn tác</strong>.
                                    </p>

                                    <div class="d-flex justify-content-center">
                                        <form:form action="/admin/user/delete" method="post" modelAttribute="newUser">
                                            <div style="display: none;">
                                                <form:input type="text" path="id" />
                                            </div>
                                            <a href="/admin/user" class="btn-cancel-delete">Hủy bỏ</a>
                                            <button type="submit" class="btn-confirm-delete">Xác nhận xóa</button>
                                        </form:form>
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