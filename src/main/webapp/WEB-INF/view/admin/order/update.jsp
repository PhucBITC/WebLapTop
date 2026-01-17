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
    <title>Update Order - Phuc Viet IT</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="shortcut icon" href="https://scontent.fvii2-1.fna.fbcdn.net/..." type="image/x-icon">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap" rel="stylesheet">

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
        .update-container {
            background: var(--card-glass);
            backdrop-filter: blur(15px);
            border: 1px solid var(--border-glass);
            border-radius: 28px;
            padding: 40px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.4);
            animation: slideUp 0.6s cubic-bezier(0.2, 0.8, 0.2, 1);
            max-width: 700px;
            margin: 40px auto;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Summary Box */
        .order-summary-bar {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 16px;
            padding: 20px;
            display: flex;
            justify-content: space-around;
            margin-bottom: 30px;
            border: 1px solid var(--border-glass);
        }

        .summary-item label {
            display: block;
            font-size: 0.7rem;
            text-transform: uppercase;
            color: var(--text-muted);
            letter-spacing: 1px;
            margin-bottom: 5px;
        }

        .summary-item span {
            font-weight: 700;
            font-size: 1.1rem;
        }

        .price-highlight {
            color: var(--money-green);
        }

        /* Form Inputs */
        .form-label {
            font-weight: 600;
            font-size: 0.85rem;
            color: var(--text-muted);
            margin-bottom: 10px;
            text-transform: uppercase;
        }

        .form-control, .form-select {
            background-color: rgba(255, 255, 255, 0.05) !important;
            border: 1px solid var(--border-glass) !important;
            color: #fff !important;
            border-radius: 12px !important;
            padding: 12px 15px !important;
            transition: all 0.3s ease;
        }

        .form-control:disabled {
            background-color: rgba(0, 0, 0, 0.2) !important;
            color: var(--text-muted) !important;
            border-style: dashed !important;
        }

        .form-select:focus {
            border-color: var(--accent-purple) !important;
            box-shadow: 0 0 0 4px rgba(124, 77, 255, 0.15) !important;
        }

        /* Custom Buttons */
        .btn-update-order {
            background: linear-gradient(135deg, #ffca28 0%, #ff8f00 100%);
            border: none;
            color: #000;
            font-weight: 700;
            padding: 14px 40px;
            border-radius: 14px;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: 0.3s;
            box-shadow: 0 10px 20px rgba(255, 143, 0, 0.2);
            width: 100%;
        }

        .btn-update-order:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(255, 143, 0, 0.3);
            filter: brightness(1.1);
        }

        .btn-cancel {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-glass);
            color: #fff;
            padding: 14px 40px;
            border-radius: 14px;
            transition: 0.3s;
            text-decoration: none;
            display: block;
            text-align: center;
            font-weight: 600;
        }

        .btn-cancel:hover {
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
              transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(210, 193, 170, 0.3);
            filter: brightness(1.1);
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
                        <li class="breadcrumb-item"><a href="/admin/order" class="text-decoration-none" style="color: var(--text-muted);">Đơn hàng</a></li>
                        <li class="breadcrumb-item active">Cập nhật trạng thái</li>
                    </ol>

                    <div class="update-container">
                        <div class="d-flex align-items-center mb-4">
                            <div class="icon-box me-3" style="background: rgba(255, 202, 40, 0.1); padding: 12px; border-radius: 12px;">
                                <i class="fas fa-truck-ramp-box text-warning fa-xl"></i>
                            </div>
                            <h3 class="m-0" style="font-weight: 800; letter-spacing: -0.5px;">Cập nhật đơn hàng</h3>
                        </div>

                        <div class="order-summary-bar">
                            <div class="summary-item">
                                <label>Mã đơn hàng</label>
                                <span>${newOrder.id}</span>
                            </div>
                            <div class="summary-item">
                                <label>Tổng thanh toán</label>
                                <span class="price-highlight">
                                    <fmt:formatNumber type="number" value="${newOrder.totalPrice}" /> VNĐ
                                </span>
                            </div>
                        </div>

                        <form:form action="/admin/order/update" method="post" modelAttribute="newOrder" class="row g-4">
                            <div class="col-md-6">
                                <label class="form-label">Tên khách hàng / Vai trò</label>
                                <form:input type="text" class="form-control" path="user.role.name" disabled="true" />
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Trạng thái xử lý</label>
                                <form:select class="form-select" path="status">
                                    <form:option value="PENDING" class="bg-black">🕒 Chờ xử lý (PENDING)</form:option>
                                    <form:option value="SHIPPING" class="bg-black">🚚 Đang giao hàng (SHIPPING)</form:option>
                                    <form:option value="COMPLETE" class="bg-black">✅ Hoàn thành (COMPLETE)</form:option>
                                    <form:option value="CANCEL" class="bg-black">❌ Hủy đơn (CANCEL)</form:option>
                                </form:select>
                            </div>

                            <form:input type="hidden" path="id" />

                            <div class="col-12 mt-5">
                                <div class="row g-3 d-flex justify-content-center align-items-center">
                                    <div class="col-sm-6 ">
                                        <a href="/admin/order" class="btn-cancel">Hủy bỏ</a>
                                    </div>
                                    <div class="col-sm-6">
                                        <button type="submit" class="btn btn-update-order">Cập nhật đơn hàng</button>
                                    </div>
                                </div>
                            </div>
                        </form:form>
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