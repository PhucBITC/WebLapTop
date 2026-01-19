<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Manage Orders - Phuc Viet IT</title>
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
            --money-green: #10b981;
        }

        body {
            font-family: 'Inter', sans-serif !important;
            background-color: var(--bg-dark) !important;
            color: #fff;
        }

        #layoutSidenav_content {
            background-image: radial-gradient(circle at top right, rgba(124, 77, 255, 0.05), transparent);
        }

        /* Container & Table Style */
        .table-container {
            background: var(--card-glass);
            backdrop-filter: blur(15px);
            border: 1px solid var(--border-glass);
            border-radius: 24px;
            padding: 30px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            animation: fadeInUp 0.6s ease-out;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .table { color: #e2e8f0 !important; border-color: var(--border-glass) !important; vertical-align: middle; }
        .table thead th {
            background: rgba(124, 77, 255, 0.1);
            color: var(--accent-purple);
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 1px;
            font-weight: 700;
            padding: 18px;
            border: none;
        }

        .table tbody tr { transition: 0.3s; border-bottom: 1px solid var(--border-glass); }
        .table tbody tr:hover { background: rgba(255, 255, 255, 0.02) !important; }

        /* Price Highlight */
        .price-text { color: var(--money-green); font-weight: 700; font-size: 1.05rem; }

        /* Order Status Badges */
        .status-badge {
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            display: inline-block;
        }
        .status-pending { background: rgba(251, 191, 36, 0.15); color: #fbbf24; border: 1px solid rgba(251, 191, 36, 0.3); }
        .status-completed { background: rgba(16, 185, 129, 0.15); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.3); }
        .status-shipping { background: rgba(59, 130, 246, 0.15); color: #3b82f6; border: 1px solid rgba(59, 130, 246, 0.3); }
        .status-cancelled { background: rgba(239, 68, 68, 0.15); color: #ef4444; border: 1px solid rgba(239, 68, 68, 0.3); }

        /* Buttons */
        .btn-action { width: 36px; height: 36px; display: inline-flex; align-items: center; justify-content: center; border-radius: 10px; margin: 0 3px; transition: 0.3s; }
        .btn-action:hover { transform: translateY(-3px); }

        /* Pagination Style */
        .pagination .page-link {
            background: rgba(255, 255, 255, 0.03) !important;
            border: 1px solid var(--border-glass) !important;
            color: #fff !important;
            margin: 0 4px;
            border-radius: 10px !important;
            padding: 10px 18px;
            transition: 0.3s;
        }
        .pagination .page-item.active .page-link {
            background: linear-gradient(135deg, var(--accent-purple) 0%, #a259ff 100%) !important;
            border: none !important;
            box-shadow: 0 0 15px rgba(124, 77, 255, 0.4);
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
                    <h1 class="mt-4">Quản lý đơn hàng</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin" class="text-decoration-none" style="color: var(--text-muted);">Dashboard</a></li>
                        <li class="breadcrumb-item active">Đơn hàng</li>
                    </ol>

                    <div class="table-container mb-5">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="m-0" style="font-weight: 700;">Danh sách giao dịch</h3>
                            <div class="text-muted small">Hiển thị dữ liệu thời gian thực</div>
                        </div>

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Mã đơn</th>
                                        <th>Tổng thanh toán</th>
                                        <th>Khách hàng</th>
                                        <th>Trạng thái</th>
                                        <th class="text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td class="fw-bold text-muted">${order.id}</td>
                                            <td>
                                                <span class="price-text">
                                                    <fmt:formatNumber type="number" value="${order.totalPrice}" /> VNĐ
                                                </span>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="me-2" style="width: 32px; height: 32px; background: rgba(255,255,255,0.05); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                                                        <i class="fas fa-user-circle text-muted"></i>
                                                    </div>
                                                    <span>${order.user.fullName}</span>
                                                </div>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${order.status eq 'PENDING'}">
                                                        <span class="status-badge status-pending">Chờ xử lý</span>
                                                    </c:when>
                                                    <c:when test="${order.status eq 'SHIPPING'}">
                                                        <span class="status-badge status-shipping">Đang giao</span>
                                                    </c:when>
                                                    <c:when test="${order.status eq 'COMPLETE'}">
                                                        <span class="status-badge status-completed">Thành công</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="status-badge status-cancelled">${order.status}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-center">
                                                <a href="/admin/order/${order.id}" class="btn-action btn btn-outline-info" title="Xem chi tiết">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                                <a href="/admin/order/update/${order.id}" class="btn-action btn btn-outline-warning" title="Cập nhật">
                                                    <i class="fas fa-pen-to-square"></i>
                                                </a>
                                                <a href="/admin/order/delete/${order.id}" class="btn-action btn btn-outline-danger" title="Hủy đơn">
                                                    <i class="fas fa-trash-can"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <nav aria-label="Page navigation" class="mt-4">
                            <ul class="pagination justify-content-center">
                                <li class="page-item ${currentOrder <= 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="/admin/order?page=${currentOrder - 1}">
                                        <i class="fas fa-chevron-left"></i>
                                    </a>
                                </li>

                                <c:if test="${totalOrder > 0}">
                                    <c:forEach begin="0" end="${totalOrder - 1}" varStatus="loop">
                                        <li class="page-item ${(loop.index + 1) eq currentOrder ? 'active' : ''}">
                                            <a class="page-link" href="/admin/order?page=${loop.index + 1}">
                                                ${loop.index + 1}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </c:if>

                                <li class="page-item ${currentOrder >= totalOrder ? 'disabled' : ''}">
                                    <a class="page-link" href="/admin/order?page=${currentOrder + 1}">
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