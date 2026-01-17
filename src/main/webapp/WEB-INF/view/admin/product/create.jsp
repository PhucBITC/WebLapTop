<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Create Product - Phuc Viet IT</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">

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

        /* Form Container */
        .form-container {
            background: var(--card-glass);
            backdrop-filter: blur(15px);
            border: 1px solid var(--border-glass);
            border-radius: 24px;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.4);
            animation: fadeInUp 0.6s ease-out;
            margin-bottom: 50px;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
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

        .form-control, .form-select {
            background-color: var(--input-bg) !important;
            border: 1px solid var(--border-glass) !important;
            color: #fff !important;
            border-radius: 12px !important;
            padding: 12px 15px !important;
            transition: all 0.3s ease !important;
        }

        .form-control:focus, .form-select:focus {
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
            background: rgba(255,255,255,0.01);
            text-align: center;
            transition: 0.3s;
        }

        .image-preview-wrapper:hover {
            border-color: var(--accent-purple);
        }

        #avatarPreview {
            max-width: 100%;
            max-height: 250px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            display: none;
            margin: 0 auto;
        }

        /* Custom Button */
        .btn-submit {
            background: linear-gradient(135deg, var(--accent-purple) 0%, #a259ff 100%);
            border: none;
            color: #fff;
            font-weight: 700;
            padding: 14px 40px;
            border-radius: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 8px 20px rgba(124, 77, 255, 0.3);
            transition: 0.3s;
        }

        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 25px rgba(124, 77, 255, 0.4);
            filter: brightness(1.1);
        }
    </style>

    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
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
                        <li class="breadcrumb-item active">Thêm mới sản phẩm</li>
                    </ol>

                    <div class="row justify-content-center">
                        <div class="col-xl-11">
                            <div class="form-container">
                                <div class="d-flex align-items-center mb-4 border-bottom pb-3" style="border-color: var(--border-glass) !important;">
                                    <div class="icon-box me-3" style="background: rgba(124, 77, 255, 0.1); padding: 12px; border-radius: 12px;">
                                        <i class="fas fa-box-open text-purple fa-xl" style="color: var(--accent-purple);"></i>
                                    </div>
                                    <h3 class="m-0" style="font-weight: 800;">Thông tin sản phẩm mới</h3>
                                </div>

                                <form:form method="post" action="/admin/product/create" modelAttribute="newProduct" class="row g-4" enctype="multipart/form-data">
                                    
                                    <div class="col-lg-8">
                                        <div class="row g-3">
                                            <div class="col-md-8">
                                                <label class="form-label">Tên sản phẩm (Laptop Name)</label>
                                                <form:input type="text" class="form-control ${not empty formErrors.getFieldValue('name') ? 'is-invalid' : ''}" path="name" placeholder="Ví dụ: MacBook Pro M3 2024" />
                                                <form:errors path="name" cssClass="invalid-feedback" />
                                            </div>

                                            <div class="col-md-4">
                                                <label class="form-label">Giá thành (VNĐ)</label>
                                                <form:input type="number" class="form-control ${not empty formErrors.getFieldValue('price') ? 'is-invalid' : ''}" path="price" />
                                                <form:errors path="price" cssClass="invalid-feedback" />
                                            </div>

                                            <div class="col-12">
                                                <label class="form-label">Mô tả chi tiết</label>
                                                <form:textarea rows="4" class="form-control ${not empty formErrors.getFieldValue('shortDesc') ? 'is-invalid' : ''}" path="shortDesc" placeholder="Nhập cấu hình chi tiết (CPU, RAM, SSD...)" />
                                                <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                            </div>

                                            <div class="col-12">
                                                <label class="form-label">Mô tả ngắn gọn</label>
                                                <form:input type="text" class="form-control ${not empty formErrors.getFieldValue('detailDesc') ? 'is-invalid' : ''}" path="detailDesc" placeholder="Tóm tắt đặc điểm nổi bật" />
                                                <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                            </div>

                                            <div class="col-md-4">
                                                <label class="form-label">Số lượng trong kho</label>
                                                <form:input type="number" class="form-control ${not empty formErrors.getFieldValue('quantity') ? 'is-invalid' : ''}" path="quantity" />
                                                <form:errors path="quantity" cssClass="invalid-feedback" />
                                            </div>

                                            <div class="col-md-4">
                                                <label class="form-label">Hãng sản xuất</label>
                                                <form:select class="form-select" path="factory">
                                                    <form:option value="Apple(Macbook)">Apple (Macbook)</form:option>
                                                    <form:option value="Asus">Asus</form:option>
                                                    <form:option value="Lenovo">Lenovo</form:option>
                                                    <form:option value="Dell">Dell</form:option>
                                                    <form:option value="LG">LG</form:option>
                                                    <form:option value="Acer">Acer</form:option>
                                                </form:select>
                                            </div>

                                            <div class="col-md-4">
                                                <label class="form-label">Phân loại (Target)</label>
                                                <form:select class="form-select" path="target">
                                                    <form:option value="Gamming">Gaming</form:option>
                                                    <form:option value="Sinh viên - văn phòng">Sinh viên - Văn phòng</form:option>
                                                    <form:option value="Thiết kế đồ họa">Thiết kế đồ họa</form:option>
                                                    <form:option value="Mỏng nhẹ">Mỏng nhẹ</form:option>
                                                    <form:option value="Doanh nhân">Doanh nhân</form:option>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class="image-preview-wrapper h-100 d-flex flex-column justify-content-center">
                                            <label class="form-label d-block mb-3">Hình ảnh sản phẩm</label>
                                            <div class="mb-3">
                                                <img id="avatarPreview" src="#" alt="preview" />
                                                <div id="imgPlaceholder" class="py-5" style="color: var(--border-glass); font-size: 4rem;">
                                                    <i class="fas fa-cloud-upload-alt"></i>
                                                </div>
                                            </div>
                                            <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg, .jpeg" name="anhProduct" />
                                            <p class="small text-muted mt-3">Sử dụng ảnh chất lượng cao để hiển thị tốt nhất trên cửa hàng.</p>
                                        </div>
                                    </div>

                                    <div class="col-12 mt-5 text-end border-top pt-4 d-flex justify-content-around align-items-center" style="border-color: var(--border-glass) !important;">
                                        <a href="/admin/product" class="btn btn-outline-secondary me-3 px-4 py-2" style="border-radius: 12px; color: #fff;">Hủy bỏ</a>
                                        <button type="submit" class="btn btn-submit">Xác nhận thêm sản phẩm</button>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
</body>

</html>