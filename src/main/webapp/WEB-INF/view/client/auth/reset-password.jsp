<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <title>Đặt lại mật khẩu - Laptopshop</title>

            <!-- Favicon -->
            <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />


            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

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

                /* Bên trái: Form Reset Password */
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
                    max-width: 400px;
                }

                /* Bên phải: Hình ảnh */
                .login-image-section {
                    flex: 1.2;
                    background-image: url('https://images.unsplash.com/photo-1550751827-4bd374c3f58b?q=80&w=2070&auto=format&fit=crop');
                    background-size: cover;
                    background-position: center;
                    position: relative;
                }

                .login-image-section::after {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    background: linear-gradient(135deg, rgba(0, 123, 255, 0.2), rgba(0, 123, 255, 0.4));
                }

                .brand-logo {
                    font-size: 24px;
                    font-weight: 700;
                    color: var(--primary-blue);
                    margin-bottom: 30px;
                    display: flex;
                    align-items: center;
                    gap: 10px;
                    text-decoration: none;
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

                .btn-submit {
                    background-color: var(--primary-blue);
                    border: none;
                    padding: 12px;
                    border-radius: 8px;
                    font-weight: 600;
                    transition: all 0.3s;
                    color: white;
                    margin-top: 10px;
                }

                .btn-submit:hover {
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
                        <a href="/" class="brand-logo">
                            <i class="fa-solid fa-laptop-code"></i>
                            <span>LAPTOPSHOP</span>
                        </a>

                        <h3 class="fw-bold mb-1" style="color: var(--text-dark);">Thiết lập mật khẩu mới</h3>
                        <p class="text-muted small mb-4">Vui lòng nhập mật khẩu mới để hoàn tất việc khôi phục tài
                            khoản.</p>

                        <form action="/reset-password" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="hidden" name="token" value="${token}" />

                            <div class="mb-4">
                                <label class="form-label">Mật khẩu mới</label>
                                <div class="position-relative">
                                    <input type="password" name="password" class="form-control" placeholder="••••••••"
                                        required minlength="6">
                                </div>
                                <div class="form-text mt-2" style="font-size: 12px;">
                                    <i class="fa-solid fa-circle-info me-1"></i> Mật khẩu nên có ít nhất 6 ký tự.
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary btn-submit w-100">
                                Xác nhận thay đổi
                            </button>

                            <div class="text-center mt-4">
                                <a href="/login" class="text-decoration-none text-muted small">
                                    <i class="fa-solid fa-arrow-left me-1"></i> Quay lại đăng nhập
                                </a>
                            </div>
                        </form>
                    </div>
                </section>

                <section class="login-image-section d-none d-lg-block">
                    <div class="h-100 w-100 d-flex flex-column justify-content-end p-5 text-white"
                        style="position: relative; z-index: 1;">
                        <h2 class="fw-bold">Bảo vệ tài khoản của bạn</h2>
                        <p class="opacity-75">Sử dụng mật khẩu mạnh để tăng cường tính bảo mật cho thông tin cá nhân của
                            bạn tại LaptopShop.</p>
                    </div>
                </section>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
        </body>

        </html>