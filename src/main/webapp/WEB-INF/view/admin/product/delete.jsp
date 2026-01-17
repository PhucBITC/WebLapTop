<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Delete Product - Phuc Viet IT</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="shortcut icon" href="https://scontent.fvii2-1.fna.fbcdn.net/..." type="image/x-icon">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">

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

        /* Container xác nhận */
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
            from { opacity: 0; transform: scale(0.85); }
            to { opacity: 1; transform: scale(1); }
        }

        /* Icon cảnh báo rung nhẹ */
        @keyframes shake {
            0%, 100% { transform: rotate(0deg); }
            25% { transform: rotate(5deg); }
            75% { transform: rotate(-5deg); }
        }

        .warning-glow-icon {
            width: 90px;
            height: 90px;
            background: rgba(239, 68, 68, 0.1);
            color: var(--danger-red);
            border-radius: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
            font-size: 3rem;
            border: 2px solid rgba(239, 68, 68, 0.2);
            box-shadow: 0 0 30px rgba(239, 68, 68, 0.2);
            animation: shake 2s infinite ease-in-out;
        }

        .delete-title {
            font-weight: 800;
            font-size: 1.6rem;
            margin-bottom: 10px;
            letter-spacing: -0.5px;
        }

        .product-id-badge {
            background: rgba(239, 68, 68, 0.15);
            color: #ff8080;
            padding: 4px 14px;
            border-radius: 10px;
            font-family: 'Courier New', Courier, monospace;
            font-weight: 700;
            border: 1px solid rgba(239, 68, 68, 0.2);
        }

        .alert-custom {
            color: var(--text-muted);
            line-height: 1.6;
            margin: 25px 0 40px;
        }

        /* Nút bấm */
        .btn-action-delete {
            background: linear-gradient(135deg, #ef4444 0%, #991b1b 100%);
            border: none;
            color: #fff;
            padding: 14px 35px;
            border-radius: 14px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: 0.3s;
            box-shadow: 0 10px 20px rgba(239, 68, 68, 0.2);
        }

        .btn-action-delete:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(239, 68, 68, 0.4);
            filter: brightness(1.1);
        }

        .btn-cancel-light {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-glass);
            color: #fff;
            padding: 14px 35px;
            border-radius: 14px;
            font-weight: 600;
            transition: 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-cancel-light:hover {
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
                    <h1 class="mt-4">Quản lý sản phẩm</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="/admin/product">Sản phẩm</a></li>
                        <li class="breadcrumb-item active">Xóa sản phẩm</li>
                    </ol>

                    <div class="delete-card">
                        <div class="warning-glow-icon">
                            <i class="fas fa-trash-alt"></i>
                        </div>
                        
                        <h2 class="delete-title">Gỡ bỏ sản phẩm khỏi hệ thống?</h2>
                        <div class="mt-2">
                            <span class="text-muted">Mã sản phẩm:</span> 
                            <span class="product-id-badge">${id}</span>
                        </div>

                        <p class="alert-custom">
                            Hành động này sẽ xóa vĩnh viễn sản phẩm này khỏi cơ sở dữ liệu. 
                            Bạn có chắc chắn muốn tiếp tục không?
                        </p>

                        <div class="d-flex justify-content-center gap-3">
                            <form:form action="/admin/product/delete" method="post" modelAttribute="newProduct">
                                <div style="display: none;">
                                    <form:input type="hidden" path="id" />
                                </div>
                                <a href="/admin/product" class="btn-cancel-light">
                                    <i class="fas fa-times me-2"></i>Hủy bỏ
                                </a>
                                <button type="submit" class="btn-action-delete">
                                    <i class="fas fa-check me-2"></i>Xác nhận xóa
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