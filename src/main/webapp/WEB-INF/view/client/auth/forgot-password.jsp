<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="utf-8" />
            <title>Quên mật khẩu - Laptopshop</title>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
            <style>
                body {
                    font-family: 'Inter', sans-serif;
                    background-color: #f8f9fa;
                    height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .card-custom {
                    border: none;
                    border-radius: 15px;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
                    overflow: hidden;
                    width: 100%;
                    max-width: 450px;
                }

                .card-header {
                    background: #fff;
                    border-bottom: 1px solid #f0f0f0;
                    padding: 25px;
                    text-align: center;
                }

                .card-body {
                    padding: 30px;
                    background: #fff;
                }

                .btn-primary {
                    background-color: #007bff;
                    border: none;
                    padding: 12px;
                    border-radius: 8px;
                    font-weight: 600;
                    width: 100%;
                }

                .btn-primary:hover {
                    background-color: #0056b3;
                }

                .form-control {
                    padding: 12px;
                    border-radius: 8px;
                }
            </style>
        </head>

        <body>
            <div class="card card-custom">
                <div class="card-header">
                    <h4 class="fw-bold mb-0">Quên mật khẩu?</h4>
                    <p class="text-muted small mt-2 mb-0">Nhập email của bạn để đặt lại mật khẩu</p>
                </div>
                <div class="card-body">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger small">${error}</div>
                    </c:if>
                    <c:if test="${not empty message}">
                        <div class="alert alert-success small">${message}</div>
                    </c:if>

                    <form action="/forgot-password" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Email đăng ký</label>
                            <input type="email" name="email" class="form-control" placeholder="name@example.com"
                                required>
                        </div>
                        <button type="submit" class="btn btn-primary">Gửi yêu cầu</button>
                    </form>
                    <div class="text-center mt-4">
                        <a href="/login" class="text-decoration-none text-muted small">Quay lại đăng nhập</a>
                    </div>
                </div>
            </div>
        </body>

        </html>