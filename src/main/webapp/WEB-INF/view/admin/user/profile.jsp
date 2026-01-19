<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Hồ sơ cá nhân - Laptopshop</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap"
                    rel="stylesheet">
                <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />

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

                    .profile-card {
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

                    .form-control:disabled,
                    .form-control[readonly] {
                        background: rgba(255, 255, 255, 0.02);
                        opacity: 0.7;
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

                    .avatar-preview {
                        width: 150px;
                        height: 150px;
                        border-radius: 50%;
                        object-fit: cover;
                        border: 4px solid rgba(124, 77, 255, 0.3);
                        padding: 4px;
                        background: rgba(255, 255, 255, 0.05);
                    }

                    /* Hover nút Hủy */
                    .btn-secondary {
                        transition: all 0.3s ease;
                    }

                    .btn-secondary:hover {
                        background-color: #5a6268;
                        color: #fff;
                        transform: translateY(-2px);
                        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.25);
                    }

                    /* Hover nút Lưu */
                    .btn-primary {
                        transition: all 0.3s ease;
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
                                <h1 class="mt-4">Hồ sơ cá nhân</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin" class="text-decoration-none"
                                            style="color: var(--text-muted);">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Profile</li>
                                </ol>

                                <div class="row justify-content-center">
                                    <div class="col-lg-8">
                                        <div class="profile-card mb-5">
                                            <form:form method="post" action="/admin/profile" modelAttribute="newUser"
                                                enctype="multipart/form-data">
                                                <form:hidden path="id" />

                                                <div class="text-center mb-5">
                                                    <img src="/images/avatar/${newUser.avatar}" alt="Avatar"
                                                        class="avatar-preview mb-3"
                                                        onerror="this.src='/images/avatar/default.png'"
                                                        id="avatarPreview">
                                                    <div class="mt-3">
                                                        <label for="avatarFile" class="btn btn-outline-light btn-sm">
                                                            <i class="fas fa-camera me-2"></i>Đổi ảnh đại diện
                                                        </label>
                                                        <input type="file" id="avatarFile" name="phucvietFile"
                                                            class="d-none" accept="image/*"
                                                            onchange="previewImage(this)">
                                                    </div>
                                                </div>

                                                <div class="row g-4">
                                                    <div class="col-md-6">
                                                        <label class="form-label">Email</label>
                                                        <form:input path="email" type="email" class="form-control"
                                                            disabled="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Vai trò</label>
                                                        <input type="text" class="form-control"
                                                            value="${newUser.role.name}" disabled />
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label class="form-label">Họ và tên</label>
                                                        <form:input path="fullName" type="text" class="form-control" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Số điện thoại</label>
                                                        <form:input path="phone" type="text" class="form-control" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Địa chỉ</label>
                                                        <form:input path="address" type="text" class="form-control" />
                                                    </div>
                                                </div>

                                                <div class="d-flex justify-content-around align-items-center mt-5">
                                                    <a href="/admin" class="btn btn-secondary me-2">
                                                        <i class="fas fa-times me-2"></i>Hủy
                                                    </a>
                                                    <button type="submit" class="btn btn-primary">
                                                        <i class="fas fa-save me-2"></i>Lưu thay đổi
                                                    </button>
                                                </div>
                                            </form:form>
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
                <script>
                    function previewImage(input) {
                        if (input.files && input.files[0]) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                document.getElementById('avatarPreview').src = e.target.result;
                            }
                            reader.readAsDataURL(input.files[0]);
                        }
                    }
                </script>
            </body>

            </html>