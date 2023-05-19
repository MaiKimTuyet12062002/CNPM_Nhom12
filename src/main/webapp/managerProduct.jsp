<%@ page import="Entity.products" %>
<%@ page import="java.util.List" %>
<%@ page import="Entity.category" %><%--
  Created by IntelliJ IDEA.
  User: Kim_Tuyet
  Date: 5/20/2023
  Time: 1:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý sản phẩm</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="build/css/manager.css" rel="stylesheet" type="text/css"/>
</head>
<style>
    img {
        width: 200px;
        height: 120px;
    }
</style>
<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Quản lý Sản phẩm</h2>
                </div>
                <div class="col-sm-6">
                    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i>
                        <span>Thêm sản phẩm mới</span></a>
                    <a href="#" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i>
                        <span>Xóa sản phẩm</span></a>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>
                    <span class="custom-checkbox">
                        <input type="checkbox" id="selectAll">
                        <label for="selectAll"></label>
                    </span>
                </th>
                <th>Mã sản phẩm</th>
                <th>Mã loại</th>
                <th>Tên sản phẩm</th>
                <th>Hình ảnh</th>
                <th>Giá</th>
                <th>Tùy chỉnh</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<products> listP = (List<products>) request.getAttribute("listP");
                for (products pr : listP) {
            %>
            <tr>
                <td>
                        <span class="custom-checkbox">
                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                            <label for="checkbox1"></label>
                        </span>
                </td>
                <td class="product-ma-<%=pr.getIdProduct()%>"><%=pr.getIdProduct()%>
                </td>
                <td class="product-loai-<%=pr.getIdProduct()%>"><%=pr.getIdCat()%>
                </td>
                <td class="product-ten-<%=pr.getIdProduct()%>"><%=pr.getNameProduct()%>
                </td>
                <td class="product-img-<%=pr.getIdProduct()%>">
                    <img src="<%=pr.getImage()%>">
                </td>
                <td class="product-gia-<%=pr.getIdProduct()%>"><%=pr.getPrice()%>
                </td>
                <td>
                    <a href="#" class="edit" data-toggle="modal">
                        <button value="<%=pr.getIdProduct()%>" style="display: none"></button>
                        <i class="material-icons" data-toggle="tooltip" title="Sửa">&#xE254;</i></a>
                    <a href="#" class="delete"
                       data-toggle="modal">
                        <i class="material-icons" data-toggle="tooltip" title="Xóa">&#xE872;</i></a>
                </td>
            </tr>
            <% }%>
            </tbody>
        </table>
        <div class="clearfix">
            <ul class="pagination">
                <li class="page-item active"><a href="#" class="page-link">1</a></li>
            </ul>
        </div>
    </div>
    <a href="/manager">
        <button type="button" class="btn btn-primary">Trở về</button>
    </a>
</div>
<!-- Add Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="addControl" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Thêm sản phẩm</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Mã sản phẩm</label>
                        <input name="id" type="text" class="form-control form-control-id" required>
                    </div>
                    <div class="form-group">
                        <label>Tên sản phẩm</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Hình ảnh</label>
                        <input name="image" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Giá</label>
                        <input name="price" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Mô tả</label>
                        <textarea name="description" class="form-control" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Loại</label>
                        <select name="category" class="form-select" aria-label="Default select example">
                            <%
                                List<category> listC = (List<category>) request.getAttribute("listC");
                                for (category cat : listC) {
                            %>
                            <option value="<%=cat.getIdCat()%>"><%=cat.getNameCat()%>
                            </option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                    <input type="submit" class="btn btn-success" value="Thêm">
                </div>
            </form>
        </div>
    </div>
</div>
<script src="build/js/manager.js" type="text/javascript"></script>
</body>
</html>
