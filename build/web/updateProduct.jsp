<%-- 
    Document   : updateProduct
    Created on : Oct 15, 2020, 10:40:49 PM
    Author     : Five Swag
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <link rel="stylesheet" href="css/admin.css">
        <link rel="stylesheet" href="css/update-product-style.css">
        <link href="https://fonts.googleapis.com/css?family=Anton&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.admin == null}">
                <div id="alert" class="alert">
                    <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                    <strong>Sorry!</strong> You don't have permission to view this site 😢😢.
                </div>
            </c:when>
            <c:otherwise>
                <div class="wrapper">
                    <div class="sidebar">
                        <h4>BeautyHouse</h4>
                        <ul>
                            <li><a href="newProduct.jsp">Add Product</a></li>
                            <li><a href="viewStock">View Stocks</a></li>
                            <li><a href="viewOrder.jsp">View Orders</a></li>
                        </ul>
                        <div class="social_media">
                            <a href="logoutAdmin">Log-out</a>
                        </div>
                    </div>
                    <c:set var="p" value="${requestScope.product}"/>
                    <div class="main_content">
                        <div class="header">Update Product ID: ${p.pid}</div>

                        <div class="info">

                            <div class="container">
                                <div class="edit-form">
                                    <form action="edit" method="post">
                                        <h4>Product ID</h4>
                                        <input class="field" type="text" name="id" value="${p.pid}" readonly>
                                        <h4>Product Name</h4>
                                        <input class="field" type="text" name="name" value="${p.pname}">
                                        <c:set var="typeList" value="${typedb.getAllTypes()}"/>
                                        <h4>Product Type</h4>
                                        <select class="drop-down" name="type">
                                            <c:forEach items="${typeList}" var="pt">
                                                <c:set var="id" value="${pt.typeid}"/>
                                                <c:if test="${id == p.typeid}">
                                                    <option value="${id}" selected >${pt.tname}</option>
                                                </c:if>
                                                <c:if test="${id != p.typeid}">
                                                    <option value="${id}">${pt.tname}</option>
                                                </c:if>
                                            </c:forEach>

                                        </select>
                                        <c:set var="aList" value="${requestScope.adb.getAllBrands()}"/>
                                        <h4>Brand</h4>
                                        <select class="drop-down" name="brand">
                                            <c:forEach items="${aList}" var="a">
                                                <c:set var="aid" value="${a.id}"/>
                                                <c:if test="${aid == p.brandid}">
                                                    <option value="${a.id}" selected>${a.name}</option>
                                                </c:if>
                                                <c:if test="${aid != p.brandid}">
                                                    <option value="${a.id}">${a.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                        <h4>Image</h4>
                                        <input class="field" type="text" name="image" value="${p.image}">
                                        <h4>Price</h4>
                                        <input class="field" type="number" name="price" value="${p.price}">
                                        <h4>Stock</h4>
                                        <input class="field" type="number" name="stock" value="${p.stock}"><br>
                                        <div class="up-btn">
                                            <input class="update" type="submit" value="Update">
                                            <input class="cancel" type="button" value="Cancel" onclick="location.href = 'viewStock'">
                                        </div>

                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

    </body>
</html>
