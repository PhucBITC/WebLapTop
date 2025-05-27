<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Phuc Viet IT - Dự án laptopshop" />
                    <meta name="author" content="Phuc Viet IT" />
                    <title>Dashboard - Phuc Viet IT</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Manage Order</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Orders</li>
                                    </ol>
                                    <div>
                                        <h2>Table Order </h2>
                                    </div>
                                    <hr>

                                    <table class=" table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Total Price</th>
                                                <th>User</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="order" items="${orders}">
                                                <tr>
                                                    <th>${order.id}</th>
                                                    <td>
                                                        <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                                                    </td>
                                                    <td>${order.user.fullName}</td>
                                                    <td>${order.status}</td>
                                                    <td>
                                                        <a href="/admin/order/${order.id}"
                                                            class="btn btn-success">View</a>
                                                        <a href="/admin/order/update/${order.id}"
                                                            class="btn btn-warning  mx-2">Update</a>
                                                        <a href="/admin/order/delete/${order.id}"
                                                            class="btn btn-danger">Delete</a>
                                                    </td>
                                                </tr>

                                            </c:forEach>

                                        </tbody>
                                    </table>

                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="${1  eq currentOrder ?'disabled page-link' : 'page-link'}"
                                                href="/admin/order?page=${currentOrder -1 }" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <c:forEach begin="0" end="${totalOrder -1 }" varStatus="loop">
                                            <li class="page-item">
                                                <a class="${(loop.index + 1) eq currentOrder ? 'active page-link ' : 'page-link'}"
                                                    href="/admin/order?page=${loop.index + 1}">
                                                    ${loop.index + 1}
                                                    <!--Cộng 1 bởi vì chỉ số của mảng bắt đầu từ 0 cho nên cộng vào -->
                                                </a>
                                            </li>
                                        </c:forEach>

                                        <li class="page-item">
                                            <a class="${totalOrder eq currentOrder ?'disabled page-link' : 'page-link'}"
                                                href="/admin/order?page=${currentOrder + 1 }" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>

                </body>

                </html>