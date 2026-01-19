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
    <title>Delete Order - Phuc Viet IT</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="shortcut icon" href="https://scontent.fvii2-1.fna.fbcdn.net/..." type="image/x-icon">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />

    <style>
        :root {
            --bg-dark: #0f111a;
            --card-glass: rgba(255, 255, 255, 0.03);
            --danger-red: #ef4444;
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
        .delete-card {
            background: var(--card-glass);
            backdrop-filter: blur(15px);
            border: 1px solid var(--border-glass);
            border-radius: 28px;
            padding: 50px 40px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.5);
            max-width: 550px;
            margin: 60px auto;
            text-align: center;
            animation: popIn 0.5s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        @keyframes popIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

        /* Icon cảnh báo phát sáng */
        .warning-glow-icon {
            width: 100px;
            height: 100px;
            background: rgba(239, 68, 68, 0.1);
            color: var(--danger-red);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
            font-size: 3rem;
            border: 2px solid rgba(239, 68, 68, 0.2);
            box-shadow: 0 0 30px rgba(239, 68, 68, 0.2);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(239, 68, 68, 0.4); }
            70% { box-shadow: 0 0 0 20px rgba(239, 68, 68, 0); }
            100% { box-shadow: 0 0 0 0 rgba(239, 68, 68, 0); }
        }

        .delete-title {
            font-weight: 800;
            font-size: 1.75rem;
            letter-spacing: -0.5px;
            margin-bottom: 15px;
        }

        .order-id-badge {
            background: rgba(255, 255, 255, 0.05);
            padding: 4px 14px;
            border-radius: 10px;
            color: #fff;
            font-family: monospace;
            border: 1px solid var(--border-glass);
            font-weight: 700;
        }

        .alert-text {
            color: var(--text-muted);
            font-size: 1.1rem;
            margin: 25px 0 40px;
            line-height: 1.6;
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
        }

        .btn-confirm-delete:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(239, 68, 68, 0.4);
            filter: brightness(1.1);
        }

        .btn-cancel-action {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-glass);
            color: #fff;
            padding: 14px 40px;
            border-radius: 14px;
            font-weight: 600;
            transition: 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-cancel-action:hover {
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
                    <h1 class="mt-4">Quản lý đơn hàng</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="/admin/order">Đơn hàng</a></li>
                        <li class="breadcrumb-item active">Xác nhận hủy</li>
                    </ol>

                    <div class="delete-card">
                        <div class="warning-glow-icon">
                            <i class="fas fa-exclamation-circle"></i>
                        </div>
                        
                        <h2 class="delete-title">Xác nhận hủy đơn hàng?</h2>
                        <div class="mt-2">
                            <span class="text-muted">Mã đơn hàng:</span> 
                            <span class="order-id-badge">${id}</span>
                        </div>

                        <p class="alert-text">
                            Hành động này sẽ loại bỏ đơn hàng khỏi hệ thống. 
                            Dữ liệu sau khi xóa <strong>không thể khôi phục</strong>. 
                            Bạn có chắc chắn muốn thực hiện?
                        </p>

                        <div class="d-flex justify-content-center gap-3">
                            <form:form method="post" action="/admin/order/delete" modelAttribute="deleteHandle">
                                <div style="display: none;">
                                    <form:input value="${id}" type="hidden" path="id" />
                                </div>
                                <a href="/admin/order" class="btn-cancel-action">
                                    <i class="fas fa-arrow-left me-2"></i>Quay lại
                                </a>
                                <button type="submit" class="btn-confirm-delete">
                                    <i class="fas fa-trash-alt me-2"></i>Xác nhận xóa
                                </button>
                            </form:form>
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