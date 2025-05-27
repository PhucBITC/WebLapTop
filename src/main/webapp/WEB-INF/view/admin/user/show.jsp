<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <link rel="shortcut icon"
                    href="https://scontent.fvii2-1.fna.fbcdn.net/v/t39.30808-1/472887672_1291617711979705_8677463667970824266_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=100&ccb=1-7&_nc_sid=1d2534&_nc_eui2=AeHzANQV2hXKrSe8jo_EDErYFw-dHzGY06EXD50fMZjToetuDxBevnZ1sk8DwA-aw0O_7GemKXSsvnM-aSV5Ztv3&_nc_ohc=dEH9dVS4OPMQ7kNvgH90yBO&_nc_oc=AdicXhIxA7-HBdaWSRffgNUvv0flmYk2WWetE99aIzlW-4Ny9SIIeQR1JjUQYI2MMRA&_nc_zt=24&_nc_ht=scontent.fvii2-1.fna&_nc_gid=AhcZLw2zib7dFTkqzj4ZB5m&oh=00_AYBfWd9g8HWKNRERjqNOHwukPaWMmCgteVa2G9NdzbWq8Q&oe=67A42C25"
                    type="image/x-icon">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">user</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Table Users</h3>
                                                <a href="/admin/user/create" class="btn btn-primary">Create a user </a>
                                            </div>

                                            <hr>

                                            <table class="table table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Email</th>
                                                        <th scope="col">FullName</th>
                                                        <th scope="col">Role</th>
                                                        <th scope="col">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="user" items="${user1}">
                                                        <tr>
                                                            <th>${user.id}</th>
                                                            <td>${user.email}</td>
                                                            <td>${user.fullName}</td>
                                                            <td>${user.role.name}</td>
                                                            <td>
                                                                <a href="/admin/user/${user.id}"
                                                                    class="btn btn-success">View</a>
                                                                <a href="/admin/user/update/${user.id}"
                                                                    class="btn btn-warning mx-2">Update</a>
                                                                <a href="/admin/user/delete/${user.id}"
                                                                    class="btn btn-danger">Delete</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item">
                                                        <a class="page-link" href="#" aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>
                                                    <c:forEach begin="0" end="${totalUser - 1}" varStatus="loop">
                                                        <li class="page-item">
                                                            <a class="${(loop.index + 1)  eq currentUser ?'active page-link' : 'page-link'}"
                                                                href="/admin/user?page=${loop.index + 1}">
                                                                ${loop.index + 1}
                                                            </a>
                                                        </li>


                                                    </c:forEach>

                                                    <li class="page-item">
                                                        <a class="page-link" href="#" aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
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
                <script src="/js/scripts.js"></script>
            </body>

            </html>