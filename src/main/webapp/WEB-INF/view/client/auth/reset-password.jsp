<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="utf-8" />
            <title>Đặt lại mật khẩu - Laptopshop</title>
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
                    width: 100%;
                    max-width: 450px;
                }

                .card-body {
                    padding: 30px;
                    background: #fff;
                    border-radius: 15px;
                }

                .btn-primary {
                    background-color: #007bff;
                    border: none;
                    padding: 12px;
                    border-radius: 8px;
                    font-weight: 600;
                    width: 100%;
                }

                .form-control {
                    padding: 12px;
                    border-radius: 8px;
                }
            </style>
        </head>

        <body>
            <div class="card card-custom">
                <div class="card-body">
                    <h4 class="fw-bold text-center mb-4">Đặt mật khẩu mới</h4>

                    <form action="/reset-password" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="hidden" name="token" value="${token}" />

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Mật khẩu mới</label>
                            <input type="password" name="password" class="form-control" placeholder="••••••••" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Xác nhận thay đổi</button>
                    </form>
                </div>
            </div>
        </body>

        </html>