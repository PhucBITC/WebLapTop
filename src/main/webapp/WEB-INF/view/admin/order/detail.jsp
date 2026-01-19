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
    <title>Order Detail - PhucXoIT</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="shortcut icon" href="https://scontent.fvii2-1.fna.fbcdn.net/..." type="image/x-icon">
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

        /* Container & Animation */
        .detail-container {
            background: var(--card-glass);
            backdrop-filter: blur(15px);
            border: 1px solid var(--border-glass);
            border-radius: 24px;
            padding: 35px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.4);
            animation: slideUp 0.6s ease-out;
            margin-bottom: 50px;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Table Styling */
        .table { color: #e2e8f0 !important; vertical-align: middle; border: none !important; }
        .table thead th {
            background: rgba(124, 77, 255, 0.1);
            color: var(--accent-purple);
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 1px;
            padding: 18px;
            border: none !important;
        }
        .table tbody tr { border-bottom: 1px solid var(--border-glass); transition: 0.3s; }
        .table tbody tr:hover { background: rgba(255, 255, 255, 0.02) !important; }

        /* Product Image Style */
        .product-img-circle {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border-radius: 16px;
            border: 2px solid var(--border-glass);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            transition: 0.3s;
        }
        tr:hover .product-img-circle {
            border-color: var(--accent-purple);
            transform: scale(1.1) rotate(3deg);
        }

        /* Price Typography */
        .price-text { color: var(--money-green); font-weight: 700; }
        .total-item-text { font-weight: 800; font-size: 1.1rem; color: #fff; }

        /* Product Link */
        .product-link {
            color: #fff;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
        }
        .product-link:hover { color: var(--accent-purple); }

        /* Buttons */
        .btn-back-modern {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-glass);
            color: #fff;
            padding: 12px 30px;
            border-radius: 12px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            transition: 0.3s;
            margin-top: 20px;
        }
        .btn-back-modern:hover {
            background: var(--accent-purple);
            transform: translateX(-5px);
            color: #fff;
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
                    <h1 class="mt-4">Chi tiết đơn hàng</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="/admin/order">Đơn hàng</a></li>
                        <li class="breadcrumb-item active">Mã đơn ${id}</li>
                    </ol>

                    <div class="detail-container">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 style="font-weight: 800; letter-spacing: -0.5px;">
                                <i class="fas fa-receipt text-purple me-2" style="color: var(--accent-purple);"></i>
                                Danh sách sản phẩm mua
                            </h3>
                            <span class="badge bg-dark border border-secondary p-2 px-3" style="border-radius: 10px;">
                                Đơn hàng ID: ${id}
                            </span>
                        </div>

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="width: 120px;">Sản phẩm</th>
                                        <th>Tên máy</th>
                                        <th>Đơn giá</th>
                                        <th>Số lượng</th>
                                        <th class="text-end">Thành tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orderDetail}">
                                        <tr>
                                            <td>
                                                <img class="product-img-circle" 
                                                     src="/images/product/${order.product.image}" 
                                                     alt="Product image">
                                            </td>
                                            <td>
                                                <a href="/product/${order.product.id}" target="_blank" class="product-link">
                                                    ${order.product.name}
                                                </a>
                                                <div class="small text-muted mt-1">Hãng: ${order.product.factory}</div>
                                            </td>
                                            <td>
                                                <span class="price-text">
                                                    <fmt:formatNumber type="number" value="${order.product.price}" /> đ
                                                </span>
                                            </td>
                                            <td class="fw-bold">${order.quantity} chiếc</td>
                                            <td class="text-end">
                                                <span class="total-item-text">
                                                    <fmt:formatNumber type="number" value="${order.quantity * order.price}" /> đ
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div class="text-start">
                            <a href="/admin/order" class="btn-back-modern">
                                <i class="fas fa-arrow-left me-2"></i> Quay lại quản lý đơn
                            </a>
                        </div>
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