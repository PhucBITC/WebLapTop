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
    <title>User Detail - Phuc Viet IT</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="shortcut icon" href="https://scontent.fvii2-1.fna.fbcdn.net/..." type="image/x-icon">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">

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

        /* Profile Card Styling */
        .profile-container {
            background: var(--card-glass);
            backdrop-filter: blur(15px);
            border: 1px solid var(--border-glass);
            border-radius: 24px;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.4);
            animation: slideUp 0.6s ease-out;
            max-width: 800px;
            margin: 0 auto;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Avatar Styling */
        .avatar-wrapper {
            position: relative;
            width: 180px;
            height: 180px;
            margin: 0 auto 30px;
        }

        .profile-avatar {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
            border: 4px solid var(--accent-purple);
            padding: 5px;
            box-shadow: 0 0 20px rgba(124, 77, 255, 0.3);
        }

        .status-indicator {
            position: absolute;
            bottom: 10px;
            right: 15px;
            width: 20px;
            height: 20px;
            background: #10b981;
            border: 3px solid #1a1c23;
            border-radius: 50%;
        }

        /* Info List Styling */
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .info-item {
            background: rgba(255,255,255,0.02);
            padding: 15px 20px;
            border-radius: 15px;
            border: 1px solid rgba(255,255,255,0.05);
            display: flex;
            align-items: center;
            transition: 0.3s;
        }

        .info-item:hover {
            background: rgba(124, 77, 255, 0.05);
            border-color: rgba(124, 77, 255, 0.2);
        }

        .info-icon {
            width: 45px;
            height: 45px;
            background: rgba(124, 77, 255, 0.1);
            color: var(--accent-purple);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            font-size: 1.2rem;
        }

        .info-content label {
            display: block;
            font-size: 0.75rem;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 2px;
        }

        .info-content span {
            font-weight: 600;
            color: #fff;
            font-size: 1rem;
        }

        /* Back Button */
        .btn-back {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-glass);
            color: #fff;
            padding: 12px 30px;
            border-radius: 12px;
            font-weight: 600;
            transition: 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            margin-top: 30px;
        }

        .btn-back:hover {
            background: var(--accent-purple);
            color: #fff;
            transform: translateX(-5px);
            box-shadow: 0 5px 15px rgba(124, 77, 255, 0.3);
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
                    <h1 class="mt-4">Thông tin chi tiết</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="/admin/user">Người dùng</a></li>
                        <li class="breadcrumb-item active">Chi tiết ${user.id}</li>
                    </ol>

                    <div class="profile-container mb-5">
                        <div class="text-center">
                            <div class="avatar-wrapper">
                                <img src="/images/avatar/${user.avatar}" class="profile-avatar" alt="User Avatar">
                                <div class="status-indicator"></div>
                            </div>
                            <h2 style="font-weight: 800; letter-spacing: -1px;">${user.fullName}</h2>
                            <p class="text-muted mb-4">Mã định danh: ${user.id}</p>
                        </div>

                        <hr style="border-color: rgba(255,255,255,0.05);">

                        <div class="info-grid">
                            <div class="info-item">
                                <div class="info-icon"><i class="fas fa-envelope"></i></div>
                                <div class="info-content">
                                    <label>Email Address</label>
                                    <span>${user.email}</span>
                                </div>
                            </div>

                            <div class="info-item">
                                <div class="info-icon"><i class="fas fa-id-badge"></i></div>
                                <div class="info-content">
                                    <label>Full Name</label>
                                    <span>${user.fullName}</span>
                                </div>
                            </div>

                            <div class="info-item">
                                <div class="info-icon"><i class="fas fa-map-marker-alt"></i></div>
                                <div class="info-content">
                                    <label>Address</label>
                                    <span>${user.address}</span>
                                </div>
                            </div>

                            <div class="info-item">
                                <div class="info-icon"><i class="fas fa-user-shield"></i></div>
                                <div class="info-content">
                                    <label>System Role</label>
                                    <span style="color: var(--accent-purple);">${user.role.name}</span>
                                </div>
                            </div>
                        </div>

                        <div class="text-center">
                            <a href="/admin/user" class="btn-back">
                                <i class="fas fa-arrow-left me-2"></i> Quay lại danh sách
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