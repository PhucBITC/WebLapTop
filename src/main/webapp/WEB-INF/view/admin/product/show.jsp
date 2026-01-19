<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Manage Products - Phuc Viet IT</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />

    <style>
        :root {
            --bg-dark: #0f111a;
            --card-glass: rgba(255, 255, 255, 0.03);
            --accent-purple: #7c4dff;
            --border-glass: rgba(255, 255, 255, 0.1);
            --text-muted: #94a3b8;
            --price-color: #10b981; /* Màu xanh lá cho giá tiền */
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
            background: var(--card-glass);
            padding: 12px 20px;
            border-radius: 12px;
            border: 1px solid var(--border-glass);
        }

        .breadcrumb-item a { color: var(--text-muted); text-decoration: none; transition: 0.3s; }
        .breadcrumb-item a:hover { color: var(--accent-purple); }
        .breadcrumb-item.active { color: var(--accent-purple) !important; font-weight: 600; }

        /* Table Container */
        .table-container {
            background: var(--card-glass);
            backdrop-filter: blur(15px);
            border: 1px solid var(--border-glass);
            border-radius: 20px;
            padding: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            animation: fadeInUp 0.6s ease-out;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Table Styling */
        .table { color: #e2e8f0 !important; border-color: var(--border-glass) !important; vertical-align: middle; }
        
        .table thead th {
            background: rgba(124, 77, 255, 0.1);
            color: var(--accent-purple);
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 1px;
            font-weight: 700;
            padding: 15px;
            border: none;
        }

        .table tbody tr { transition: 0.3s; border-bottom: 1px solid var(--border-glass); }
        .table tbody tr:hover { background: rgba(255, 255, 255, 0.02) !important; }

        .price-text { color: var(--price-color); font-weight: 700; }

        /* Factory Badge */
        .factory-badge {
            background: rgba(255, 255, 255, 0.05);
            color: #fff;
            padding: 5px 12px;
            border-radius: 8px;
            font-size: 0.8rem;
            border: 1px solid var(--border-glass);
        }

        /* Buttons */
        .btn-create {
            background: linear-gradient(135deg, var(--accent-purple) 0%, #a259ff 100%);
            border: none;
            border-radius: 12px;
            font-weight: 600;
            padding: 10px 20px;
            box-shadow: 0 4px 15px rgba(124, 77, 255, 0.3);
        }

        .btn-action { width: 35px; height: 35px; display: inline-flex; align-items: center; justify-content: center; border-radius: 8px; margin: 0 2px; transition: 0.3s; }

        /* Pagination */
        .pagination .page-item .page-link {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid var(--border-glass);
            color: #fff;
            margin: 0 3px;
            border-radius: 8px;
        }

        .pagination .page-item.active .page-link {
            background: var(--accent-purple) !important;
            border-color: var(--accent-purple) !important;
            box-shadow: 0 0 10px rgba(124, 77, 255, 0.5);
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
                    <h1 class="mt-4">Quản lý sản phẩm</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item active">Sản phẩm</li>
                    </ol>

                    <div class="table-container">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="m-0" style="font-weight: 700;">Danh sách Laptop</h3>
                            <a href="/admin/product/create" class="btn btn-primary btn-create">
                                <i class="fas fa-plus-circle me-2"></i>Thêm sản phẩm
                            </a>
                        </div>

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá thành</th>
                                        <th>Hãng sản xuất</th>
                                        <th class="text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="product" items="${products}">
                                        <tr>
                                            <td class="text-muted">${product.id}</td>
                                            <td class="fw-bold">${product.name}</td>
                                            <td>
                                                <span class="price-text">
                                                    <fmt:formatNumber value="${product.price}" type="number" /> đ
                                                </span>
                                            </td>
                                            <td><span class="factory-badge">${product.factory}</span></td>
                                            <td class="text-center">
                                                <a href="/admin/product/${product.id}" class="btn-action btn btn-outline-info" title="Xem">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                                <a href="/admin/product/update/${product.id}" class="btn-action btn btn-outline-warning" title="Sửa">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="/admin/product/delete/${product.id}" class="btn-action btn btn-outline-danger" title="Xóa">
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
                                <li class="page-item ${1 eq currentPage ? 'disabled' : ''}">
                                    <a class="page-link" href="/admin/product?page=${currentPage - 1}">
                                        <i class="fas fa-chevron-left"></i>
                                    </a>
                                </li>
                                <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                    <li class="page-item ${(loop.index + 1) eq currentPage ? 'active' : ''}">
                                        <a class="page-link" href="/admin/product?page=${loop.index + 1}">
                                            ${loop.index + 1}
                                        </a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${totalPages eq currentPage ? 'disabled' : ''}">
                                    <a class="page-link" href="/admin/product?page=${currentPage + 1}">
                                        <i class="fas fa-chevron-right"></i>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
</body>

</html>