<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
    <meta charset="utf-8">
    <title>User Profile</title>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

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
    <div class="container-fluid pt-4 px-4" style="margin-top: 100px">
        <div class="row g-4">
            <div class="col-12">
                <div class="bg-light rounded h-100 p-4">
                    <h2>Trang cá nhân</h2>
                    <hr>
                    <div class="row">
                        <div class="col-md-3">
                                <h4>Ảnh đại diện</h4>
                                <hr>
                                <img src="/images/avatar/${user.avatar}" alt="Avatar" class="img-fluid"
                                    style="width: 150px; height: 150px; border-radius: 50%;" />
                            </div>
                            <div class="col-md-5">
                                <h4>Thông tin chi tiết</h4>
                                <hr>
                                <form:form method="post" action="/user/profile" modelAttribute="user"
                                    enctype="multipart/form-data">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="mb-3">
                                        <label class="form-label">Cập nhật ảnh đại diện:</label>
                                        <input class="form-control" type="file" name="avatarFile" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="fullName" class="form-label">Họ và tên</label>
                                        <form:input type="text" class="form-control" id="fullName" path="fullName" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <form:input type="email" class="form-control" id="email" path="email"
                                            readonly="true" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="address" class="form-label">Địa chỉ</label>
                                        <form:input type="text" class="form-control" id="address" path="address" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="phone" class="form-label">Số điện thoại</label>
                                        <form:input type="text" class="form-control" id="phone" path="phone" />
                                    </div>
                                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                                </form:form>
                            </div>
                            <div class="col-md-4">
                                <h4>Thay đổi mật khẩu</h4>
                                <hr>
                                <form method="post" action="/user/change-password">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="mb-3">
                                        <label for="oldPassword" class="form-label">Mật khẩu cũ</label>
                                        <input type="password" class="form-control" id="oldPassword"
                                            name="oldPassword">
                                    </div>
                                    <div class="mb-3">
                                        <label for="newPassword" class="form-label">Mật khẩu
                                            mới</label>
                                        <input type="password" class="form-control" id="newPassword"
                                            name="newPassword">
                                    </div>
                                    <div class="mb-3">
                                        <label for="confirmPassword" class="form-label">Xác nhận mật
                                            khẩu</label>
                                        <input type="password" class="form-control" id="confirmPassword"
                                            name="confirmPassword">
                                    </div>
                                    <button type="submit" class="btn btn-warning">Đổi mật
                                        khẩu</button>
                                </form>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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