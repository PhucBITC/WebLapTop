<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Phuc Viet - Dự án laptopshop" />
            <meta name="author" content="Phuc Viet IT" />
            <title>Dashboard - Phuc Viet IT</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap"
                rel="stylesheet">
            <style>
                body {
                    font-family: 'Inter', sans-serif !important;
                    background-color: #0f111a !important;
                    /* Tối hơn một chút để nổi bật Card */
                }

                /* Tổng thể layout content */
                #layoutSidenav_content {
                    background-color: #12141a;
                    /* Nền tối sâu đồng bộ */
                    background-image: radial-gradient(circle at top right, rgba(124, 77, 255, 0.05), transparent);
                }

                .container-fluid {
                    padding-top: 2rem !important;
                }

                h1.mt-4 {
                    color: #fff;
                    font-weight: 800;
                    letter-spacing: -1px;
                    margin-bottom: 0.5rem;
                }

                .breadcrumb {
                    background: rgba(255, 255, 255, 0.05);
                    padding: 10px 20px;
                    border-radius: 10px;
                    border: 1px solid rgba(255, 255, 255, 0.1);
                }

                .breadcrumb-item.active {
                    color: #7c4dff !important;
                    font-weight: 500;
                }

                /* Thẻ Card Thống Kê Modern */
                /* Tinh chỉnh lại thẻ Card để không bị che chữ */
                .stat-card {
                    border: none !important;
                    border-radius: 20px !important;
                    overflow: hidden;
                    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
                    position: relative;
                    z-index: 1;
                    /* Thay height cố định bằng min-height */
                    min-height: 170px;
                    display: flex;
                    flex-direction: column;
                    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
                }

                .stat-card:hover {
                    transform: translateY(-8px);
                    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.4);
                }

                .stat-card .card-body {
                    padding: 1.25rem 1.5rem;
                    /* Giảm nhẹ padding trên dưới */
                    flex-grow: 1;
                    /* Để body chiếm hết không gian còn lại */
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    /* Căn giữa nội dung theo chiều dọc */
                    position: relative;
                }

                /* Icon chìm phía sau - Chỉnh lại vị trí để không đè chữ */
                .stat-card i.bg-icon {
                    position: absolute;
                    right: 15px;
                    top: 50%;
                    transform: translateY(-50%) rotate(-15deg);
                    font-size: 4rem;
                    opacity: 0.12;
                    transition: all 0.4s ease;
                    pointer-events: none;
                    /* Tránh việc icon chắn click vào link */
                }

                .stat-card:hover i.bg-icon {
                    transform: translateY(-50%) rotate(0deg) scale(1.1);
                    opacity: 0.2;
                }

                .stat-value {
                    font-size: 2.8rem;
                    /* Tăng kích thước số cho nổi bật */
                    font-weight: 800;
                    line-height: 1.1;
                    margin: 5px 0 0 0;
                }

                .stat-label {
                    font-size: 0.85rem;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    font-weight: 600;
                    opacity: 0.8;
                }

                /* Footer của Card - Đảm bảo luôn nằm dưới cùng và rõ ràng */
                .stat-card .card-footer {
                    background: rgba(0, 0, 0, 0.15) !important;
                    border: none !important;
                    padding: 0.75rem 1.5rem !important;
                    backdrop-filter: blur(5px);
                }

                .stat-card .card-footer a {
                    font-size: 0.85rem;
                    font-weight: 500;
                    transition: all 0.3s;
                }

                .stat-card .card-footer:hover a {
                    letter-spacing: 0.5px;
                }

                /* Gradients cho từng loại card */
                .card-user {
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                }

                .card-product {
                    background: linear-gradient(135deg, #ff6b6b 0%, #ee0979 100%);
                }

                .card-order {
                    background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
                }

                .stat-value {
                    font-size: 2.5rem;
                    font-weight: 800;
                    line-height: 1;
                    margin-top: 10px;
                }

                .stat-label {
                    font-size: 0.9rem;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    opacity: 0.9;
                }

                /* Footer của Card */
                .stat-card .card-footer {
                    background: rgba(0, 0, 0, 0.1) !important;
                    border: none !important;
                    padding: 0.8rem 1.5rem !important;
                }

                .stat-card .card-footer a {
                    font-weight: 500;
                    letter-spacing: 0.5px;
                }

                /* Animation vào trang */
                @keyframes slideUpFade {
                    from {
                        opacity: 0;
                        transform: translateY(30px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                .animate-in {
                    animation: slideUpFade 0.6s ease forwards;
                }

                .delay-1 {
                    animation-delay: 0.1s;
                }

                .delay-2 {
                    animation-delay: 0.2s;
                }

                .delay-3 {
                    animation-delay: 0.3s;
                }
            </style>
            </style>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4 animate-in">Dashboard Overview</h1>
                            <ol class="breadcrumb mb-4 animate-in">
                                <li class="breadcrumb-item"><a href="/admin" class="text-decoration-none"
                                        style="color: #aaa;">Admin</a></li>
                                <li class="breadcrumb-item active">Thống kê hệ thống</li>
                            </ol>

                            <div class="row mt-5">
                                <div class="col-xl-4 col-md-6 mb-4">
                                    <div class="card stat-card card-user text-white animate-in delay-1">
                                        <div class="card-body">
                                            <div style="position: relative; z-index: 2;">
                                                <div class="stat-label">Tổng người dùng</div>
                                                <div class="stat-value">${countUser}</div>
                                            </div>
                                            <i class="fas fa-users bg-icon"></i>
                                        </div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link text-decoration-none"
                                                href="/admin/user">
                                                Xem chi tiết
                                            </a>
                                            <div class="small text-white"><i class="fas fa-chevron-right"></i></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-4 col-md-6 mb-4">
                                    <div class="card stat-card card-product text-white animate-in delay-2">
                                        <div class="card-body">
                                            <div style="position: relative; z-index: 2;">
                                                <div class="stat-label">Sản phẩm hiện có</div>
                                                <div class="stat-value">${countProduct}</div>
                                            </div>
                                            <i class="fas fa-box-open bg-icon"></i>
                                        </div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link text-decoration-none"
                                                href="/admin/product">
                                                Quản lý kho
                                            </a>
                                            <div class="small text-white"><i class="fas fa-chevron-right"></i></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-4 col-md-6 mb-4">
                                    <div class="card stat-card card-order text-white animate-in delay-3">
                                        <div class="card-body">
                                            <div style="position: relative; z-index: 2;">
                                                <div class="stat-label">Đơn hàng mới</div>
                                                <div class="stat-value">${countOrder}</div>
                                            </div>
                                            <i class="fas fa-shopping-cart bg-icon"></i>
                                        </div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link text-decoration-none"
                                                href="/admin/order">
                                                Kiểm tra đơn
                                            </a>
                                            <div class="small text-white"><i class="fas fa-chevron-right"></i></div>
                                        </div>
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
            <script src="js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
            <script src="js/chart-area-demo.js"></script>
            <script src="js/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                crossorigin="anonymous"></script>
            <script src="js/datatables-simple-demo.js"></script>
        </body>

        </html>