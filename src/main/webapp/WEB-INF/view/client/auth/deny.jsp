<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Login - Laptopshop</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>
            <style>
                .hienThi {
                    position: relative;
                    background-image: url(https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif);
                    background-size: 100%;
                    width: 100%;
                    height: 500px;
                    background-position: center;
                    background-repeat: no-repeat;
                    margin: 0 auto;
                }



                .error {
                    color: red;
                }

                .thongBao {
                    color: red;
                    font-size: 20px;

                }

                .thongBao a {
                    color: green;
                    cursor: pointer;
                }

                .page404 {
                    padding: 30px;

                }

                .error {
                    text-align: center;
                    position: absolute;
                    color: black;
                    font-weight: 500;
                    font-size: 70px;
                    left: 50%;
                    top: -39px;
                    /* right: 50%; */
                    transform: translateX(-50%);
                }

                .description {
                    text-align: center;
                }

                .btn a {
                    color: white;
                }
            </style>

            <body>

                <div class="page404">

                    <div class="hienThi">
                        <div class="error">404</div>
                    </div>

                    <div class="description">
                        <p class="mota">Look like you're lost <br> the page you are looking for not avaible!</p>
                        <button class="btn btn-success"> <a href="/" style="text-decoration: none;">Go to Home
                            </a></button>
                    </div>

                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>