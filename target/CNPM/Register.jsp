<%--
  Created by IntelliJ IDEA.
  User: M S I
  Date: 16/05/2023
  Time: 9:39 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Register</title>
    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Site Metas -->
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="images/favicon.png" type="">



    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

    <!--owl slider stylesheet -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <!-- nice select  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
    <!-- font awesome style -->
    <link href="css/font-awesome.min.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="css/responsive.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/stylesheet.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="JQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen">
    <script src="Bootstrap/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/custom.js" type="text/javascript"></script>
</head>
<body>

<%--<jsp:include page="Layout/Header.jsp" />--%>
<!-- header section strats -->
<header class="header_section" style="background-color: #0c0c0c">

    <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="/index">
            <span >
              Đăng ký tài khoản
            </span>
            </a>



        </nav>
    </div>
</header>
<!-- end header section -->
<div id="account-register" class="container">
    <ul class="breadcrumb">
        <li><a href="/index"><i class="fa fa-home"></i></a></li>
        <li><a href="/Register">Đăng ký</a></li>
    </ul>
    <div class="row">
<%--        <jsp:include page="Layout/MenuBarAccount.jsp" />--%>
        <div id="content" class="col-sm-9">
            <h1>Đăng ký tài khoản</h1>
            <p>Nếu bạn đã có tài khoản với chúng tôi, vui lòng đăng nhập tại trang <a
                    href="/login">đăng nhập</a>.</p>
            <!-- Form nhập thông tin đăng ký tài khoản, sử dụng required để bắt người dùng nhập đủ thông tin, không được bỏ trống -->
            <form action="/Register" method="post" class="form-horizontal" name="form1" onsubmit="return validation()">
                <fieldset id="account">
                    <legend>Thông Tin Cá Nhân Của Bạn</legend>
                    <div class="form-group required" style="display:  none ;">
                        <label class="col-sm-2 control-label">Customer Group</label>
                        <div class="col-sm-10">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="customer_group_id" value="1" checked="checked" />
                                    Default</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-firstname">Họ</label>
                        <div class="col-sm-10">
                            <input type="text" name="firstname" value="" placeholder="Họ" id="input-firstname"
                                   class="form-control" required />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-lastname">Tên</label>
                        <div class="col-sm-10">
                            <input type="text" name="lastname" value="" placeholder="Tên" id="input-lastname"
                                   class="form-control" required />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email">E-Mail</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" value="" placeholder="E-Mail" id="input-email"
                                   class="form-control" required />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-telephone">Điện thoại</label>
                        <div class="col-sm-10">
                            <input type="tel" name="telephone" value="" placeholder="Điện thoại"
                                   id="input-telephone" class="form-control" required />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label">Giới tính</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="male" value="1" checked="checked"/>
                                Nam</label>
                            <label class="radio-inline">
                                <input type="radio" name="male" value="0"/>
                                Nữ</label>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Mật Khẩu Của Bạn</legend>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-password">Mật khẩu</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" value="" placeholder="Mật khẩu"
                                   id="input-password" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-confirm">Xác nhận mật khẩu</label>
                        <div class="col-sm-10">
                            <input type="password" name="confirm" value="" placeholder="Xác nhận mật khẩu"
                                   id="input-confirm" class="form-control" />
                        </div>
                    </div>
                </fieldset>
                <div class="buttons">
                    <div class="pull-right">Tôi đã đọc và đồng ý với <a
                            href="privacypolicy.html"
                    ><b>Chính sách quyền riêng tư</b></a>
                        <input type="checkbox" name="agree" value="1" required />
                        &nbsp;
                        <input type="submit" name="summit" value="Tiếp Tục" class="btn btn-primary" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%--<jsp:include page="Layout/Footer.jsp" />--%>
<!-- footer section -->
<footer class="footer_section">
    <div class="container">
        <div class="row">
            <div class="col-md-4 footer-col">
                <div class="footer_contact">
                    <h4>
                        Liên hệ
                    </h4>
                    <div class="contact_link_box">
                        <a href="">
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                            <span>
                  Vị trí
                </span>
                        </a>
                        <a href="">
                            <i class="fa fa-phone" aria-hidden="true"></i>
                            <span>
                  0769854321
                </span>
                        </a>
                        <a href="">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <span>
                  nhom12@gmail.com
                </span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 footer-col">
                <div class="footer_detail">
                    <a href="" class="footer-logo">
                        Fast Food
                    </a>
                    <p>
                        Cần thiết, làm cho nó trở thành trình tạo thực sự đầu tiên trên Internet.
                        Nó sử dụng một từ điển hơn 200 từ Latinh, kết hợp với
                    </p>
                    <div class="footer_social">
                        <a href="">
                            <i class="fa fa-facebook" aria-hidden="true"></i>
                        </a>
                        <a href="">
                            <i class="fa fa-twitter" aria-hidden="true"></i>
                        </a>
                        <a href="">
                            <i class="fa fa-linkedin" aria-hidden="true"></i>
                        </a>
                        <a href="">
                            <i class="fa fa-instagram" aria-hidden="true"></i>
                        </a>
                        <a href="">
                            <i class="fa fa-pinterest" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 footer-col">
                <h4>
                    Giờ mở cửa
                </h4>
                <p>
                    Mỗi ngày
                </p>
                <p>
                    10:00 Am - 10:00 Pm
                </p>
            </div>
        </div>
    </div>
</footer>
<!-- footer section -->
<% String mess = (String)request.getAttribute("mess");
    if(mess!=null){ %>
<script>
    alert("<%=mess%>");
</script>
<% } %>

<script>
    // Hàm bắt buộc mật khẩu phải từ 6 ký tự trở lên
    function validation(){
        var pass = document.form1.password.value;

        var pass2 = document.getElementById("input-password")

        if(pass.length < 6){

            alert("Mật khẩu phải có từ 6 ký tự trở lên")
            pass2.style.border = "1px solid red";

            return false;

        }else{

            pass2.style.border = "1px solid black";

            return true;

        }
    }


</script>
</body>
</html>
