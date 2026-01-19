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
                <title>Users Management - Phuc Viet IT</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <link rel="shortcut icon" href="https://scontent.fvii2-1.fna.fbcdn.net/..." type="image/x-icon">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap"
                    rel="stylesheet">
                <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />


                <style>
                    :root {
                        --bg-dark: #12141a;
                        --card-bg: rgba(255, 255, 255, 0.03);
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

                    /* Breadcrumb Style */
                    .breadcrumb {
                        background: var(--card-bg);
                        padding: 12px 20px;
                        border-radius: 12px;
                        border: 1px solid var(--border-glass);
                    }

                    .breadcrumb-item a {
                        color: var(--text-muted);
                        text-decoration: none;
                        transition: 0.3s;
                    }

                    .breadcrumb-item a:hover {
                        color: var(--accent-purple);
                    }

                    .breadcrumb-item.active {
                        color: var(--accent-purple) !important;
                        font-weight: 600;
                    }

                    /* Table Card Container */
                    .table-container {
                        background: var(--card-bg);
                        backdrop-filter: blur(10px);
                        border: 1px solid var(--border-glass);
                        border-radius: 20px;
                        padding: 25px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
                        margin-bottom: 30px;
                        animation: fadeIn 0.6s ease-out;
                    }

                    @keyframes fadeIn {
                        from {
                            opacity: 0;
                            transform: translateY(20px);
                        }

                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    /* Custom Table Styling */
                    .table {
                        color: #e2e8f0 !important;
                        border-color: var(--border-glass) !important;
                        vertical-align: middle;
                    }

                    .table thead th {
                        background: rgba(124, 77, 255, 0.1);
                        color: var(--accent-purple);
                        text-transform: uppercase;
                        font-size: 0.75rem;
                        letter-spacing: 1px;
                        font-weight: 700;
                        border: none;
                        /* padding: 15px; */
                    }

                    .table tbody tr {
                        transition: 0.3s;
                        border-bottom: 1px solid var(--border-glass);
                    }

                    .table tbody tr:hover {
                        background: rgba(255, 255, 255, 0.02) !important;
                    }

                    .table td,
                    .table th {
                        padding: 15px;
                        border: none !important;
                    }

                    /* Status Badge for Roles */
                    .role-badge {
                        background: rgba(124, 77, 255, 0.2);
                        color: var(--accent-purple);
                        padding: 4px 12px;
                        border-radius: 20px;
                        font-size: 0.8rem;
                        font-weight: 600;
                    }

                    /* Modern Buttons */
                    .btn-create {
                        background: linear-gradient(135deg, var(--accent-purple) 0%, #a259ff 100%);
                        border: none;
                        padding: 10px 24px;
                        border-radius: 12px;
                        font-weight: 600;
                        box-shadow: 0 4px 15px rgba(124, 77, 255, 0.3);
                        transition: 0.3s;
                    }

                    .btn-create:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 6px 20px rgba(124, 77, 255, 0.4);
                        filter: brightness(1.1);
                    }

                    .btn-action {
                        width: 38px;
                        height: 38px;
                        display: inline-flex;
                        align-items: center;
                        justify-content: center;
                        border-radius: 10px;
                        transition: 0.3s;
                        margin: 0 2px;
                    }

                    /* Pagination Styling */
                    /* Tinh chỉnh Pagination phong cách Modern Dark */
                    .pagination {
                        gap: 8px;
                        /* Khoảng cách giữa các nút số */
                    }

                    .pagination .page-item .page-link {
                        background: rgba(255, 255, 255, 0.03) !important;
                        border: 1px solid rgba(255, 255, 255, 0.1) !important;
                        color: var(--text-muted) !important;
                        border-radius: 10px !important;
                        padding: 10px 18px;
                        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                        font-weight: 600;
                    }

                    /* Hiệu ứng khi Hover vào các nút số */
                    .pagination .page-item:not(.active):not(.disabled) .page-link:hover {
                        background: rgba(124, 77, 255, 0.1) !important;
                        color: var(--accent-purple) !important;
                        border-color: var(--accent-purple) !important;
                        transform: translateY(-3px);
                    }

                    /* Trạng thái trang HIỆN TẠI (Active) */
                    .pagination .page-item.active .page-link {
                        background: linear-gradient(135deg, var(--accent-purple) 0%, #a259ff 100%) !important;
                        color: #fff !important;
                        border: none !important;
                        box-shadow: 0 0 15px rgba(124, 77, 255, 0.5);
                        /* Hiệu ứng phát sáng */
                        transform: scale(1.1);
                        /* Phóng to nhẹ trang đang đứng */
                    }

                    /* Trạng thái nút bị vô hiệu hóa (Disabled) */
                    .pagination .page-item.disabled .page-link {
                        background: rgba(255, 255, 255, 0.01) !important;
                        border-color: rgba(255, 255, 255, 0.05) !important;
                        color: rgba(255, 255, 255, 0.1) !important;
                        cursor: not-allowed;
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
                                    <li class="breadcrumb-item active">Người dùng</li>
                                </ol>

                                <div class="table-container">
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <h3 class="m-0" style="font-weight: 700; color: #fff;">Danh sách thành viên</h3>
                                        <a href="/admin/user/create" class="btn btn-primary btn-create">
                                            <i class="fas fa-user-plus me-2"></i>Thêm người dùng
                                        </a>
                                    </div>

                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Thông tin cơ bản</th>
                                                    <th>Họ tên</th>
                                                    <th>Vai trò</th>
                                                    <th class="text-center">Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="user" items="${user1}">
                                                    <tr>
                                                        <td class="fw-bold" style="color: var(--text-muted);">${user.id}
                                                        </td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <div class="avatar-circle me-3"
                                                                    style="width: 40px; height: 40px; background: rgba(255,255,255,0.05); border-radius: 50%; display: flex; align-items: center; justify-content: center; border: 1px solid var(--border-glass);">
                                                                    <i class="fas fa-envelope text-muted"
                                                                        style="font-size: 0.9rem;"></i>
                                                                </div>
                                                                <span>${user.email}</span>
                                                            </div>
                                                        </td>
                                                        <td>${user.fullName}</td>
                                                        <td><span class="role-badge">${user.role.name}</span></td>
                                                        <td class="text-center">
                                                            <a href="/admin/user/${user.id}"
                                                                class="btn btn-action btn-outline-info" title="Xem">
                                                                <i class="fas fa-eye"></i>
                                                            </a>
                                                            <a href="/admin/user/update/${user.id}"
                                                                class="btn btn-action btn-outline-warning" title="Sửa">
                                                                <i class="fas fa-edit"></i>
                                                            </a>
                                                            <a href="/admin/user/delete/${user.id}"
                                                                class="btn btn-action btn-outline-danger" title="Xóa">
                                                                <i class="fas fa-trash-alt"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                    <nav aria-label="Page navigation" class="mt-4">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item ${currentUser == 1 ? 'disabled' : ''}">
                                                <a class="page-link" href="/admin/user?page=${currentUser - 1}"
                                                    aria-label="Previous">
                                                    <span aria-hidden="true"><i class="fas fa-chevron-left"></i></span>
                                                </a>
                                            </li>

                                            <c:forEach begin="0" end="${totalUser - 1}" varStatus="loop">
                                                <li
                                                    class="page-item ${(loop.index + 1) eq currentUser ? 'active' : ''}">
                                                    <a class="page-link" href="/admin/user?page=${loop.index + 1}">
                                                        ${loop.index + 1}
                                                    </a>
                                                </li>
                                            </c:forEach>

                                            <li class="page-item ${currentUser == totalUser ? 'disabled' : ''}">
                                                <a class="page-link" href="/admin/user?page=${currentUser + 1}"
                                                    aria-label="Next">
                                                    <span aria-hidden="true"><i class="fas fa-chevron-right"></i></span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
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