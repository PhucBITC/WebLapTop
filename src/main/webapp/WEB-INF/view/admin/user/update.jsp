<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <title>Update User - Phuc Viet IT</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <link rel="shortcut icon" href="https://scontent.fvii2-1.fna.fbcdn.net/..." type="image/x-icon">
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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

                        /* Form Container Style */
                        .update-form-container {
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

                        /* Input Styling */
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
                            outline: none;
                        }

                        /* Avatar Preview Section */
                        .avatar-upload-section {
                            display: flex;
                            flex-direction: column;
                            align-items: center;
                            justify-content: center;
                            border: 2px dashed var(--border-glass);
                            border-radius: 20px;
                            padding: 20px;
                            transition: 0.3s;
                            background: rgba(255, 255, 255, 0.01);
                        }

                        .avatar-upload-section:hover {
                            border-color: var(--accent-purple);
                            background: rgba(124, 77, 255, 0.02);
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

                        /* Buttons */
                        .btn-update {
                            background: linear-gradient(135deg, #ffca28 0%, #ff8f00 100%);
                            border: none;
                            color: #000;
                            font-weight: 700;
                            padding: 12px 30px;
                            border-radius: 12px;
                            text-transform: uppercase;
                            letter-spacing: 1px;
                            transition: all 0.3s;
                            width: 100%;
                        }

                        .btn-update:hover {
                            transform: translateY(-3px);
                            box-shadow: 0 10px 20px rgba(255, 143, 0, 0.3);
                            filter: brightness(1.1);
                        }

                        .btn-cancel {
                            background: rgba(255, 255, 255, 0.05);
                            border: 1px solid var(--border-glass);
                            color: #fff;
                            padding: 12px 30px;
                            border-radius: 12px;
                            transition: 0.3s;
                            text-decoration: none;
                            display: inline-block;
                            text-align: center;
                            width: 100%;
                        }

                        .btn-cancel:hover {
                            background: rgba(255, 255, 255, 0.1);
                            color: #fff;
                        }
                    </style>

                    <script>
                        $(document).ready(() => {
                            const avatarFile = $("#avatarFile");
                            avatarFile.change(function (e) {
                                if (e.target.files && e.target.files[0]) {
                                    const imgURL = URL.createObjectURL(e.target.files[0]);
                                    $("#avatarPreview").attr("src", imgURL).fadeIn();
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
                                        <li class="breadcrumb-item active">Cập nhật thông tin</li>
                                    </ol>

                                    <div class="row justify-content-center">
                                        <div class="col-xl-10">
                                            <div class="update-form-container">
                                                <div class="d-flex align-items-center mb-4">
                                                    <div class="icon-box me-3"
                                                        style="background: rgba(255, 202, 40, 0.1); padding: 10px; border-radius: 12px;">
                                                        <i class="fas fa-user-edit text-warning fa-2x"></i>
                                                    </div>
                                                    <h3 class="m-0" style="font-weight: 800;">Chỉnh sửa tài khoản</h3>
                                                </div>

                                                <form:form method="post" action="/admin/user/update"
                                                    modelAttribute="newUser" enctype="multipart/form-data">
                                                    <div class="row">
                                                        <div class="col-lg-4 text-center mb-4 mb-lg-0">
                                                            <div class="avatar-upload-section h-100">
                                                                <label class="form-label">Ảnh đại diện</label>
                                                                <img src="/images/avatar/${newUser.avatar}"
                                                                    alt="avatar preview" id="avatarPreview">
                                                                <input class="form-control form-control-sm" type="file"
                                                                    id="avatarFile" accept=".png, .jpg, .jpeg"
                                                                    name="phucvietFile" />
                                                                <p class="small text-muted mt-2">Định dạng hỗ trợ: PNG,
                                                                    JPG, JPEG</p>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-8">
                                                            <div class="row g-3">
                                                                <form:hidden path="id" />
                                                                <form:hidden path="avatar" />

                                                                <div class="col-md-6">
                                                                    <label class="form-label">Email Address</label>
                                                                    <spring:bind path="email">
                                                                        <form:input type="email"
                                                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                            path="email"
                                                                            placeholder="example@gmail.com" />
                                                                        <form:errors path="email"
                                                                            cssClass="invalid-feedback" />
                                                                    </spring:bind>
                                                                </div>

                                                                <div class="col-md-6">
                                                                    <label class="form-label">Phone Number</label>
                                                                    <spring:bind path="phone">
                                                                        <form:input type="text"
                                                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                            path="phone" placeholder="0123 456 789" />
                                                                        <form:errors path="phone"
                                                                            cssClass="invalid-feedback" />
                                                                    </spring:bind>
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <label class="form-label">Full Name</label>
                                                                    <spring:bind path="fullName">
                                                                        <form:input type="text"
                                                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                            path="fullName"
                                                                            placeholder="Nguyen Van A" />
                                                                        <form:errors path="fullName"
                                                                            cssClass="invalid-feedback" />
                                                                    </spring:bind>
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <label class="form-label">Password</label>
                                                                    <spring:bind path="password">
                                                                        <form:input type="password"
                                                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                            path="password" />
                                                                        <form:errors path="password"
                                                                            cssClass="invalid-feedback" />
                                                                    </spring:bind>
                                                                    <small class="text-muted"><i
                                                                            class="fas fa-info-circle me-1"></i>Để trống
                                                                        nếu không muốn thay đổi mật khẩu.</small>
                                                                </div>

                                                                <div class="col-md-8">
                                                                    <label class="form-label">Address</label>
                                                                    <spring:bind path="address">
                                                                        <form:input type="text"
                                                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                            path="address"
                                                                            placeholder="123 Street, District..." />
                                                                        <form:errors path="address"
                                                                            cssClass="invalid-feedback" />
                                                                    </spring:bind>
                                                                </div>

                                                                <div class="col-md-4">
                                                                    <label class="form-label">System Role</label>
                                                                    <form:select class="form-select" path="role.name">
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="ADMIN">ADMIN (Quản trị)</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="USER">USER (Người dùng)</form:option>
                                                                    </form:select>
                                                                </div>
                                                            </div>

                                                            <div class="row mt-5 g-3">
                                                                <div class="col-6">
                                                                    <a href="/admin/user" class="btn-cancel">Hủy bỏ</a>
                                                                </div>
                                                                <div class="col-6">
                                                                    <button type="submit" class="btn btn-update">Cập
                                                                        nhật ngay</button>
                                                                </div>
                                                            </div>
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