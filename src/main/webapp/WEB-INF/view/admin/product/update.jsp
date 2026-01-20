<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="utf-8" />
                        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                        <title>Update Product - Phuc Viet IT</title>
                        <link href="/css/styles.css" rel="stylesheet" />
                        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                            crossorigin="anonymous"></script>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap"
                            rel="stylesheet">
                        <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />


                        <style>
                            :root {
                                --bg-dark: #0f111a;
                                --card-glass: rgba(255, 255, 255, 0.03);
                                --accent-purple: #7c4dff;
                                --border-glass: rgba(255, 255, 255, 0.1);
                                --text-muted: #94a3b8;
                                --input-bg: rgba(255, 255, 255, 0.05);
                            }

                            body {
                                font-family: 'Inter', sans-serif !important;
                                background-color: var(--bg-dark) !important;
                                color: #fff;
                            }

                            #layoutSidenav_content {
                                background-image: radial-gradient(circle at top right, rgba(124, 77, 255, 0.05), transparent);
                            }

                            /* Form Container Style */
                            .update-form-container {
                                background: var(--card-glass);
                                backdrop-filter: blur(15px);
                                border: 1px solid var(--border-glass);
                                border-radius: 24px;
                                padding: 40px;
                                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
                                animation: fadeInUp 0.6s ease-out;
                                margin-bottom: 50px;
                            }

                            @keyframes fadeInUp {
                                from {
                                    opacity: 0;
                                    transform: translateY(30px);
                                }

                                to {
                                    opacity: 1;
                                    transform: translateY(0);
                                }
                            }

                            /* Input Styling */
                            .form-label {
                                font-weight: 600;
                                font-size: 0.85rem;
                                color: var(--text-muted);
                                margin-bottom: 8px;
                                text-transform: uppercase;
                                letter-spacing: 0.5px;
                            }

                            .form-control,
                            .form-select {
                                background-color: var(--input-bg) !important;
                                border: 1px solid var(--border-glass) !important;
                                color: #fff !important;
                                border-radius: 12px !important;
                                padding: 12px 15px !important;
                                transition: all 0.3s ease !important;
                            }

                            .form-control:focus,
                            .form-select:focus {
                                background-color: rgba(255, 255, 255, 0.08) !important;
                                border-color: var(--accent-purple) !important;
                                box-shadow: 0 0 0 4px rgba(124, 77, 255, 0.15) !important;
                            }

                            .invalid-feedback {
                                font-size: 0.8rem;
                                color: #ff6b6b;
                                margin-top: 5px;
                            }

                            /* Image Preview Box */
                            .image-preview-wrapper {
                                border: 2px dashed var(--border-glass);
                                border-radius: 20px;
                                padding: 20px;
                                background: rgba(255, 255, 255, 0.01);
                                text-align: center;
                                transition: 0.3s;
                                height: 100%;
                                display: flex;
                                flex-direction: column;
                                justify-content: center;
                            }

                            #avatarPreview {
                                max-width: 100%;
                                max-height: 280px;
                                border-radius: 15px;
                                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
                                margin: 0 auto 15px;
                                border: 2px solid var(--accent-purple);
                            }

                            /* Buttons */
                            .btn-update-now {
                                background: linear-gradient(135deg, #ffca28 0%, #ff8f00 100%);
                                border: none;
                                color: #000;
                                font-weight: 700;
                                padding: 14px 40px;
                                border-radius: 12px;
                                text-transform: uppercase;
                                letter-spacing: 1px;
                                transition: 0.3s;
                                box-shadow: 0 8px 20px rgba(255, 143, 0, 0.2);
                            }

                            .btn-update-now:hover {
                                transform: translateY(-3px);
                                box-shadow: 0 12px 25px rgba(255, 143, 0, 0.3);
                                filter: brightness(1.1);
                            }
                        </style>

                        <script>
                            $(document).ready(() => {
                                const avatarFile = $("#avatarFile");
                                const orgImage = "${newProduct.image}";
                                if (orgImage) {
                                    const urlImage = "/images/product/" + orgImage;
                                    $("#avatarPreview").attr("src", urlImage).show();
                                }

                                avatarFile.change(function (e) {
                                    if (e.target.files && e.target.files[0]) {
                                        const imgURL = URL.createObjectURL(e.target.files[0]);
                                        $("#avatarPreview").attr("src", imgURL).fadeIn();
                                    }
                                });
                            });
                        </script>
                    </head>

                    <body class="sb-nav-fixed">
                        <jsp:include page="../layout/header.jsp" />
                        <div id="layoutSidenav">
                            <jsp:include page="../layout/sidebar.jsp" />
                            <div id="layoutSidenav_content">
                                <main>
                                    <div class="container-fluid px-4">
                                        <h1 class="mt-4">Quản lý sản phẩm</h1>
                                        <ol class="breadcrumb mb-4">
                                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                            <li class="breadcrumb-item"><a href="/admin/product">Sản phẩm</a></li>
                                            <li class="breadcrumb-item active">Cập nhật ${newProduct.id}</li>
                                        </ol>

                                        <div class="row justify-content-center">
                                            <div class="col-xl-11">
                                                <div class="update-form-container">
                                                    <div class="d-flex align-items-center mb-4 border-bottom pb-3"
                                                        style="border-color: var(--border-glass) !important;">
                                                        <div class="icon-box me-3"
                                                            style="background: rgba(255, 202, 40, 0.1); padding: 12px; border-radius: 12px;">
                                                            <i class="fas fa-edit text-warning fa-xl"></i>
                                                        </div>
                                                        <h3 class="m-0" style="font-weight: 800;">Chỉnh sửa thông tin
                                                            sản
                                                            phẩm</h3>
                                                    </div>

                                                    <form:form method="post" action="/admin/product/update"
                                                        modelAttribute="newProduct" class="row g-4"
                                                        enctype="multipart/form-data">
                                                        <form:input type="hidden" path="id" />
                                                        <form:input type="hidden" path="image" />

                                                        <div class="col-lg-7">
                                                            <div class="row g-3">
                                                                <div class="col-md-8">
                                                                    <label class="form-label">Tên sản phẩm</label>
                                                                    <spring:bind path="name">
                                                                        <form:input type="text"
                                                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                            path="name" />
                                                                        <form:errors path="name"
                                                                            cssClass="invalid-feedback" />
                                                                    </spring:bind>
                                                                </div>

                                                                <div class="col-md-4">
                                                                    <label class="form-label">Giá sản phẩm</label>
                                                                    <div class="input-group has-validation">
                                                                        <spring:bind path="price">
                                                                            <form:input type="text" id="priceInput"
                                                                                class="form-control price-field ${status.error ? 'is-invalid' : ''}"
                                                                                path="price" placeholder="0" />
                                                                            <span
                                                                                class="input-group-text currency-addon">VNĐ</span>
                                                                            <form:errors path="price"
                                                                                cssClass="invalid-feedback" />
                                                                        </spring:bind>
                                                                    </div>
                                                                </div>

                                                                <div class="col-12">
                                                                    <label class="form-label">Mô tả chi tiết</label>
                                                                    <spring:bind path="detailDesc">
                                                                        <form:textarea rows="5"
                                                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                            path="detailDesc" />
                                                                        <form:errors path="detailDesc"
                                                                            cssClass="invalid-feedback" />
                                                                    </spring:bind>
                                                                </div>

                                                                <div class="col-12">
                                                                    <label class="form-label">Mô tả phần cứng</label>
                                                                    <spring:bind path="shortDesc">
                                                                        <form:input type="text"
                                                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                            path="shortDesc" />
                                                                        <form:errors path="shortDesc"
                                                                            cssClass="invalid-feedback" />
                                                                    </spring:bind>
                                                                </div>

                                                                <div class="col-md-4">
                                                                    <label class="form-label">Số lượng kho</label>
                                                                    <spring:bind path="quantity">
                                                                        <form:input type="number"
                                                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                            path="quantity" />
                                                                        <form:errors path="quantity"
                                                                            cssClass="invalid-feedback" />
                                                                    </spring:bind>
                                                                </div>

                                                                <div class="col-md-4">
                                                                    <label class="form-label">Hãng</label>
                                                                    <form:select class="form-select" path="factory">
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="APPLE">Apple (MacBook)
                                                                        </form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="ASUS">Asus</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="LENOVO">Lenovo</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="DELL">Dell</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="LG">LG</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="ACER">Acer</form:option>
                                                                    </form:select>
                                                                </div>

                                                                <div class="col-md-4">
                                                                    <label class="form-label">Phân khúc</label>
                                                                    <form:select class="form-select" path="target">
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="GAMING">Gaming</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="SINHVIEN-VANPHONG">Sinh viên -
                                                                            Văn phòng</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="THIET-KE-DO-HOA">Thiết kế đồ họa
                                                                        </form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="MONG-NHE">Mỏng nhẹ</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="DOANH-NHAN">Doanh nhân
                                                                        </form:option>
                                                                    </form:select>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-5">
                                                            <div class="image-preview-wrapper">
                                                                <label class="form-label mb-3">Hình ảnh hiển thị</label>
                                                                <img id="avatarPreview" src="#" alt="product preview"
                                                                    style="display: none;" />
                                                                <div class="mt-2">
                                                                    <input class="form-control" type="file"
                                                                        id="avatarFile" accept=".png, .jpg, .jpeg"
                                                                        name="phucvietFile" />
                                                                    <p class="small text-muted mt-3">Chọn tệp mới nếu
                                                                        bạn
                                                                        muốn thay đổi hình ảnh hiện tại.</p>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-12 mt-5 text-end border-top pt-4"
                                                            style="border-color: var(--border-glass) !important;">
                                                            <a href="/admin/product"
                                                                class="btn btn-outline-secondary me-3 px-4 py-2"
                                                                style="border-radius: 12px; color: #fff; border-color: var(--border-glass);">Hủy
                                                                bỏ</a>
                                                            <button type="submit" class="btn btn-update-now">Lưu thay
                                                                đổi</button>
                                                        </div>
                                                    </form:form>
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
                        <script>
                            $(document).ready(function () {
                                const priceInput = $('#priceInput');

                                // 1. Hàm chuyển đổi số (xử lý cả số khoa học E+)
                                function formatMoney(value) {
                                    if (!value) return "";
                                    // Chuyển từ E+ sang số thuần túy string
                                    let num = Number(value).toLocaleString('fullwide', { useGrouping: false });
                                    // Thêm dấu phẩy phân cách phần nghìn
                                    return num.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                }

                                // 2. Định dạng ngay khi vừa load trang (Xử lý lỗi 2.5E7)
                                let initialValue = priceInput.val();
                                if (initialValue) {
                                    priceInput.val(formatMoney(initialValue));
                                }

                                // 3. Sự kiện gõ phím: Tự thêm dấu phẩy khi người dùng nhập
                                priceInput.on('input', function () {
                                    let val = $(this).val().replace(/,/g, ''); // Xóa dấu phẩy cũ
                                    if (!isNaN(val) && val.length > 0) {
                                        $(this).val(formatMoney(val));
                                    }
                                });

                                // 4. QUAN TRỌNG: Trước khi lưu (submit), phải xóa dấu phẩy để Backend nhận kiểu Double/Long
                                $('form').on('submit', function () {
                                    let rawVal = priceInput.val().replace(/,/g, '');
                                    priceInput.val(rawVal);
                                });
                            });
                        </script>
                    </body>

                    </html>