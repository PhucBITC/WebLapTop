<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Lịch sử mua hàng - Laptopshop</title>
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

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

                <jsp:include page="../layout/header.jsp" />

                <!-- Cart Page Start -->
                <div class="container-fluid py-5">
                    <div class="container py-5">
                        <div class="mb-4">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Lịch sử mua hàng</li>
                                </ol>
                            </nav>
                            <h1 class="mb-0">Lịch sử mua hàng</h1>
                        </div>

                        <c:if test="${empty orders}">
                            <div class="alert alert-info text-center" role="alert">
                                Không có đơn hàng nào được tạo.
                            </div>
                        </c:if>

                        <c:forEach var="order" items="${orders}">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-header bg-light py-3">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h5 class="mb-0">Đơn hàng: ${order.id}</h5>
                                        </div>
                                        <div class="col-md-6 text-md-end">
                                            <span class="me-3"><strong>Tổng tiền:</strong>
                                                <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                                            </span>
                                            <span><strong>Trạng thái:</strong>
                                                <span
                                                    class="badge 
                                                <c:choose>
                                                    <c:when test='${order.status == "PENDING"}'>bg-warning text-dark</c:when>
                                                    <c:when test='${order.status == "SUCCESS"}'>bg-success</c:when>
                                                    <c:when test='${order.status == "SHIPPING"}'>bg-info text-dark</c:when>
                                                    <c:when test='${order.status == "CANCEL"}'>bg-danger</c:when>
                                                    <c:otherwise>bg-secondary</c:otherwise>
                                                </c:choose>
                                            ">${order.status}</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col" colspan="2">Sản phẩm</th>
                                                    <th scope="col">Giá</th>
                                                    <th scope="col">Số lượng</th>
                                                    <th scope="col" class="text-end">Thành tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="orderDetail" items="${order.orderDetails}">
                                                    <tr>
                                                        <td style="width: 80px;">
                                                            <img src="/images/product/${orderDetail.product.image}"
                                                                class="img-fluid rounded" alt="">
                                                        </td>
                                                        <td>
                                                            <a href="/product/${orderDetail.product.id}"
                                                                target="_blank" class="text-decoration-none">
                                                                ${orderDetail.product.name}
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <fmt:formatNumber type="number"
                                                                value="${orderDetail.price}" /> đ
                                                        </td>
                                                        <td>${orderDetail.quantity}</td>
                                                        <td class="text-end">
                                                            <fmt:formatNumber type="number"
                                                                value="${orderDetail.price * orderDetail.quantity}" />
                                                            đ
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
                <!-- Cart Page End -->


                <jsp:include page="../layout/footer.jsp" />


                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>


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