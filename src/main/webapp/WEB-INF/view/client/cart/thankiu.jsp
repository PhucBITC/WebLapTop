<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title> Thanh toán - Laptopshop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>
                    <jsp:include page="../layout/header.jsp" />


                    <!-- Featurs Section Start -->
                    <div class="container-fluid featurs py-5">
                        <div class="container py-5">
                            <div class="cotainer" style="margin-bottom: 100px;">
                                <div class="row">
                                    <div class="col-12 mt-5">
                                        <div class="alert alert-success" role="alert">
                                            Cảm ơn bạn đã đặt hàng, đơn hàng đã được xác nhận thành công .
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-4">
                                <div class="col-md-6 col-lg-3">
                                    <div class="featurs-item text-center rounded bg-light p-4">
                                        <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                            <i class="fas fa-car-side fa-3x text-white"></i>
                                        </div>
                                        <div class="featurs-content text-center">
                                            <h5>Free Shipping</h5>
                                            <p class="mb-0">Free on order over $300</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-3">
                                    <div class="featurs-item text-center rounded bg-light p-4">
                                        <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                            <i class="fas fa-user-shield fa-3x text-white"></i>
                                        </div>
                                        <div class="featurs-content text-center">
                                            <h5>Security Payment</h5>
                                            <p class="mb-0">100% security payment</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-3">
                                    <div class="featurs-item text-center rounded bg-light p-4">
                                        <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                            <i class="fas fa-exchange-alt fa-3x text-white"></i>
                                        </div>
                                        <div class="featurs-content text-center">
                                            <h5>30 Day Return</h5>
                                            <p class="mb-0">30 day money guarantee</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-3">
                                    <div class="featurs-item text-center rounded bg-light p-4">
                                        <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                            <i class="fa fa-phone-alt fa-3x text-white"></i>
                                        </div>
                                        <div class="featurs-content text-center">
                                            <h5>24/7 Support</h5>
                                            <p class="mb-0">Support every time fast</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Featurs Section End -->



                    <jsp:include page="../layout/footer.jsp" />

                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>