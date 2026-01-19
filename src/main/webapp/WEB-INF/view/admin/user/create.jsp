<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Create User - Phuc Viet IT</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                        --input-bg: rgba(255, 255, 255, 0.05);
                    }

                    body {
                        font-family: 'Inter', sans-serif !important;
                        background-color: var(--bg-dark) !important;
                        color: #fff;
                    }

                    #layoutSidenav_content {
                        background-image: radial-gradient(circle at top right, rgba(124, 77, 255, 0.05), transparent);
                    }

                    /* Container Style */
                    .create-form-container {
                        background: var(--card-glass);
                        backdrop-filter: blur(15px);
                        border: 1px solid var(--border-glass);
                        border-radius: 24px;
                        padding: 40px;
                        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
                        animation: fadeInUp 0.6s ease-out;
                        margin-bottom: 50px;
                    }

                    @keyframes fadeInUp {
                        from {
                            opacity: 0;
                            transform: translateY(30px);
                        }

                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    /* Form Styling */
                    .form-label {
                        font-weight: 600;
                        font-size: 0.85rem;
                        color: var(--text-muted);
                        margin-bottom: 8px;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }

                    .form-control,
                    .form-select {
                        background-color: var(--input-bg) !important;
                        border: 1px solid var(--border-glass) !important;
                        color: #fff !important;
                        border-radius: 12px !important;
                        padding: 12px 15px !important;
                        transition: all 0.3s ease !important;
                    }

                    .form-control:focus,
                    .form-select:focus {
                        background-color: rgba(255, 255, 255, 0.08) !important;
                        border-color: var(--accent-purple) !important;
                        box-shadow: 0 0 0 4px rgba(124, 77, 255, 0.15) !important;
                    }

                    .invalid-feedback {
                        font-size: 0.8rem;
                        color: #ff6b6b;
                        margin-top: 5px;
                    }

                    /* Avatar Section */
                    .avatar-preview-box {
                        border: 2px dashed var(--border-glass);
                        border-radius: 20px;
                        padding: 20px;
                        text-align: center;
                        background: rgba(255, 255, 255, 0.01);
                        transition: 0.3s;
                    }

                    .avatar-preview-box:hover {
                        border-color: var(--accent-purple);
                    }

                    #avatarPreview {
                        width: 150px;
                        height: 150px;
                        object-fit: cover;
                        border-radius: 50%;
                        border: 3px solid var(--accent-purple);
                        box-shadow: 0 0 15px rgba(124, 77, 255, 0.3);
                        margin-bottom: 15px;
                    }

                    /* Create Button */
                    .btn-create-submit {
                        background: linear-gradient(135deg, var(--accent-purple) 0%, #a259ff 100%);
                        border: none;
                        color: #fff;
                        font-weight: 700;
                        padding: 14px 40px;
                        border-radius: 12px;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        box-shadow: 0 8px 20px rgba(124, 77, 255, 0.3);
                        transition: 0.3s;
                        width: 100%;
                    }

                    .btn-create-submit:hover {
                        transform: translateY(-3px);
                        box-shadow: 0 12px 25px rgba(124, 77, 255, 0.4);
                        filter: brightness(1.1);
                    }
                </style>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            if (e.target.files && e.target.files[0]) {
                                const imgURL = URL.createObjectURL(e.target.files[0]);
                                $("#avatarPreview").attr("src", imgURL).fadeIn();
                                $("#avatarPreview").css({ "display": "inline-block" });
                            }
                        });
                    });
                </script>
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
                                    <li class="breadcrumb-item active">Thêm mới thành viên</li>
                                </ol>

                                <div class="row justify-content-center">
                                    <div class="col-xl-10">
                                        <div class="create-form-container">
                                            <div class="d-flex align-items-center mb-4 border-bottom pb-3"
                                                style="border-color: var(--border-glass) !important;">
                                                <div class="icon-box me-3"
                                                    style="background: rgba(124, 77, 255, 0.1); padding: 12px; border-radius: 12px;">
                                                    <i class="fas fa-user-plus text-purple fa-xl"
                                                        style="color: var(--accent-purple);"></i>
                                                </div>
                                                <h3 class="m-0" style="font-weight: 800;">Tạo tài khoản mới</h3>
                                            </div>

                                            <form:form method="post" action="/admin/user/create"
                                                modelAttribute="newUser" class="row g-4" enctype="multipart/form-data">
                                                <div class="col-md-6">
                                                    <c:set var="errorEmail">
                                                        <form:errors path="email" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Email Address</label>
                                                    <form:input type="email"
                                                        class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                        path="email" placeholder="example@gmail.com" />
                                                    ${errorEmail}
                                                </div>

                                                <div class="col-md-6">
                                                    <c:set var="errorPassword">
                                                        <form:errors path="password" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Password</label>
                                                    <form:input type="password"
                                                        class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                        path="password" placeholder="••••••••" />
                                                    ${errorPassword}
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label">Phone Number</label>
                                                    <form:input type="text" class="form-control" path="phone"
                                                        placeholder="0xxx xxx xxx" />
                                                </div>

                                                <div class="col-md-6">
                                                    <c:set var="errorFullName">
                                                        <form:errors path="fullName" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Full Name</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorFullName ? 'is-invalid' : ''}"
                                                        path="fullName" placeholder="Nhập họ tên đầy đủ" />
                                                    ${errorFullName}
                                                </div>

                                                <div class="col-md-8">
                                                    <label class="form-label">Address</label>
                                                    <form:input type="text" class="form-control" path="address"
                                                        placeholder="Địa chỉ thường trú" />
                                                </div>

                                                <div class="col-md-4">
                                                    <label class="form-label">System Role</label>
                                                    <form:select class="form-select" path="role.name">
                                                        <form:option style="background-color:#2B2C39;" value="ADMIN">ADMIN (Quản trị viên)</form:option>
                                                        <form:option style="background-color:#2B2C39;" value="USER">USER (Khách hàng)</form:option>
                                                    </form:select>
                                                </div>

                                                <div class="col-12 mt-4">
                                                    <div class="avatar-preview-box">
                                                        <div class="row align-items-center">
                                                            <div class="col-md-4">
                                                                <img id="avatarPreview"
                                                                    src="/images/avatar/default-avatar.png"
                                                                    alt="preview" style="display: none;" />
                                                                <div id="placeholder" class="mb-2"
                                                                    style="font-size: 3rem; color: var(--border-glass);">
                                                                    <i class="fas fa-image"></i>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-8 text-md-start">
                                                                <label for="avatarFile" class="form-label">Tải lên ảnh
                                                                    đại diện</label>
                                                                <input class="form-control" type="file" id="avatarFile"
                                                                    accept=".png, .jpg, .jpeg" name="phucvietFile" />
                                                                <p class="small text-muted mt-2">Dung lượng tối đa 2MB.
                                                                    Hỗ trợ định dạng JPG, PNG.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-12 mt-5 text-center">
                                                    <hr style="border-color: var(--border-glass) !important;">
                                                    <div class="d-flex gap-3 justify-content-around flex-wrap">
                                                        <a href="/admin/user"
                                                            class="btn btn-outline-secondary px-3 py-2 w-auto">
                                                            Hủy
                                                        </a>

                                                        <button type="submit"
                                                            class="btn btn-create-submit px-3 py-2 w-auto">
                                                            Tạo
                                                        </button>
                                                    </div>

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
            </body>

            </html>