<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Đăng ký - Laptopshop</title>

                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />

                <style>
                    :root {
                        --primary-blue: #007bff;
                        --soft-blue: #f0f7ff;
                        --text-dark: #2d3436;
                    }

                    body,
                    html {
                        height: 100%;
                        margin: 0;
                        font-family: 'Inter', sans-serif;
                        background-color: #fff;
                        overflow: hidden;
                    }

                    .login-container {
                        display: flex;
                        height: 100vh;
                    }

                    /* Bên trái: Form Login */
                    .login-form-section {
                        flex: 1;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        padding: 40px;
                        background-color: #ffffff;
                    }

                    .login-box {
                        width: 100%;
                        max-width: 450px;
                    }

                    /* Bên phải: Hình ảnh */
                    .login-image-section {
                        flex: 1.2;
                        background-image: url('https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?q=80&w=2070&auto=format&fit=crop');
                        background-size: cover;
                        background-position: center;
                        position: relative;
                    }

                    /* Lớp phủ màu xanh dương nhạt cho ảnh */
                    .login-image-section::after {
                        content: '';
                        position: absolute;
                        top: 0;
                        left: 0;
                        right: 0;
                        bottom: 0;
                        background: linear-gradient(135deg, rgba(0, 123, 255, 0.1), rgba(0, 123, 255, 0.3));
                    }

                    .brand-logo {
                        font-size: 24px;
                        font-weight: 700;
                        color: var(--primary-blue);
                        margin-bottom: 30px;
                        display: flex;
                        align-items: center;
                        gap: 10px;
                    }

                    .form-label {
                        font-weight: 500;
                        font-size: 14px;
                        color: #636e72;
                    }

                    .form-control {
                        border: 1px solid #e1e8ed;
                        padding: 12px 15px;
                        border-radius: 8px;
                        font-size: 15px;
                        transition: all 0.2s;
                    }

                    .form-control:focus {
                        border-color: var(--primary-blue);
                        box-shadow: 0 0 0 4px rgba(0, 123, 255, 0.1);
                    }

                    .btn-login {
                        background-color: var(--primary-blue);
                        border: none;
                        padding: 12px;
                        border-radius: 8px;
                        font-weight: 600;
                        margin-top: 10px;
                        transition: all 0.3s;
                    }

                    .btn-login:hover {
                        background-color: #0056b3;
                        transform: translateY(-1px);
                    }

                    @media (max-width: 992px) {
                        .login-image-section {
                            display: none;
                        }
                    }
                </style>
            </head>

            <body>
                <div class="login-container">
                    <section class="login-form-section">
                        <div class="login-box">
                            <div class="brand-logo">
                                <i class="fa-solid fa-laptop-code"></i>
                                <span>LAPTOPSHOP</span>
                            </div>

                            <h3 class="fw-bold mb-1" style="color: var(--text-dark);">Tạo tài khoản mới</h3>
                            <p class="text-muted small mb-4">Nhập thông tin cá nhân của bạn để đăng ký.</p>

                            <form:form action="/register" method="post" modelAttribute="registerUser">

                                <c:set var="errorFirstName">
                                    <form:errors path="firstName" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorLastName">
                                    <form:errors path="lastName" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorEmail">
                                    <form:errors path="email" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorPassword">
                                    <form:errors path="passWord" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorConfirmPassword">
                                    <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                </c:set>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Họ</label>
                                        <form:input class="form-control ${not empty errorFirstName ? 'is-invalid' : ''}"
                                            path="firstName" placeholder="Nguyen Van" />
                                        ${errorFirstName}
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Tên</label>
                                        <form:input class="form-control ${not empty errorLastName ? 'is-invalid' : ''}"
                                            path="lastName" placeholder="A" />
                                        ${errorLastName}
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <form:input class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                        path="email" type="email" placeholder="name@example.com" />
                                    ${errorEmail}
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Mật khẩu</label>
                                        <form:input class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                            path="passWord" type="password" placeholder="••••••••" />
                                        ${errorPassword}
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Xác nhận mật khẩu</label>
                                        <form:input
                                            class="form-control ${not empty errorConfirmPassword ? 'is-invalid' : ''}"
                                            path="confirmPassword" type="password" placeholder="••••••••" />
                                        ${errorConfirmPassword}
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-primary btn-login w-100 mt-2">
                                    Đăng ký tài khoản
                                </button>

                                <div class="text-center mt-4">
                                    <p class="small text-muted">Đã có tài khoản?
                                        <a href="/login" class="text-primary fw-bold text-decoration-none">Đăng nhập
                                            ngay</a>
                                    </p>
                                </div>
                            </form:form>
                        </div>
                    </section>

                    <section class="login-image-section d-none d-lg-block">
                        <div class="h-100 w-100 d-flex flex-column justify-content-end p-5 text-white"
                            style="position: relative; z-index: 1;">
                            <h2 class="fw-bold">Tham gia cộng đồng công nghệ</h2>
                            <p class="opacity-75">Tạo tài khoản để theo dõi đơn hàng và nhận ưu đãi hấp dẫn.</p>
                        </div>
                    </section>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
            </body>

            </html>