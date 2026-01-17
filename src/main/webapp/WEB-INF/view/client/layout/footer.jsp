<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <style>
            .footer {
                background: #1a1d20;
                /* Màu tối sang trọng hơn bg-dark thuần túy */
                color: #adb5bd;
                font-family: 'Inter', sans-serif;
            }

            .footer-brand h1 {
                font-weight: 800;
                letter-spacing: -1px;
                transition: 0.3s;
            }

            .footer-brand:hover h1 {
                color: #00d2ff !important;
            }

            .footer h4 {
                font-weight: 600;
                position: relative;
                padding-bottom: 12px;
                color: #fff;
            }

            .footer h4::after {
                content: '';
                position: absolute;
                width: 50px;
                height: 2px;
                background: #007bff;
                bottom: 0;
                left: 0;
            }

            .footer .btn-link {
                display: block;
                padding: 5px 0;
                color: #adb5bd;
                text-decoration: none;
                transition: 0.3s;
            }

            .footer .btn-link:hover {
                color: #007bff !important;
                padding-left: 8px;
            }

            .footer .social-icons a {
                width: 40px;
                height: 40px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.05);
                color: #fff;
                transition: 0.3s;
                margin-right: 8px;
            }

            .footer .social-icons a:hover {
                background: #007bff;
                transform: translateY(-3px);
            }

            .contact-item {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }

            .contact-item i {
                width: 35px;
                height: 35px;
                background: rgba(0, 123, 255, 0.1);
                color: #007bff;
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 12px;
            }

            .copyright {
                background: #111416;
                border-top: 1px solid rgba(255, 255, 255, 0.05);
            }
        </style>

        <div class="container-fluid footer pt-5 mt-5">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-4 col-md-6">
                        <div class="footer-brand mb-4">
                            <a href="/" class="text-decoration-none">
                                <h1 class="text-primary mb-0">Laptopshop</h1>
                                <p class="text-secondary small">Technology for Future</p>
                            </a>
                        </div>
                        <p class="mb-4">Chúng tôi cam kết mang đến những sản phẩm công nghệ chất lượng nhất, đi kèm dịch
                            vụ hỗ trợ tận tâm cho từng khách hàng.</p>
                        <div class="social-icons">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6">
                        <h4 class="mb-4">Thông Tin Cửa Hàng</h4>
                        <div class="d-flex flex-column">
                            <a class="btn-link" href="#"><i class="fas fa-angle-right me-2"></i>Về chúng tôi</a>
                            <a class="btn-link" href="#"><i class="fas fa-angle-right me-2"></i>Chính sách bảo hành</a>
                            <a class="btn-link" href="#"><i class="fas fa-angle-right me-2"></i>Chính sách bảo mật</a>
                            <a class="btn-link" href="#"><i class="fas fa-angle-right me-2"></i>Điều khoản sử dụng</a>
                            <a class="btn-link" href="#"><i class="fas fa-angle-right me-2"></i>Hệ thống cửa hàng</a>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6">
                        <h4 class="mb-4">Liên Hệ</h4>
                        <div class="contact-item">
                            <i class="fa fa-map-marker-alt"></i>
                            <span>46/23 Dũng Sĩ Thanh Khê, Đà Nẵng</span>
                        </div>
                        <div class="contact-item">
                            <i class="fa fa-phone-alt"></i>
                            <span>+012 345 67890</span>
                        </div>
                        <div class="contact-item">
                            <i class="fa fa-envelope"></i>
                            <span>support@phucxo.vn</span>
                        </div>
                        <div class="mt-4">
                            <h6 class="text-white mb-3">Chấp nhận thanh toán:</h6>
                            <div class="d-flex gap-2">
                                <i class="fab fa-cc-visa fa-2x"></i>
                                <i class="fab fa-cc-mastercard fa-2x"></i>
                                <i class="fab fa-cc-paypal fa-2x"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       