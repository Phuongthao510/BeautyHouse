<%-- 
    Document   : newProduct
    Created on : Oct 15, 2020, 10:50:16 PM
    Author     : Five Swag
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new product</title>
        <link rel="stylesheet" href="css/admin.css">
        <link rel="stylesheet" href="css/new-product-style.css">
        <link href="https://fonts.googleapis.com/css?family=Anton&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
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
                    <div class="main_content">
                        <div class="header">Add new Product</div>

                        <div class="info">
                            <c:if test="${requestScope.error!=null}">
                                <div id="alert" class="alert">
                                    <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                    <strong>${requestScope.error}</strong>
                                </div>
                            </c:if>
                            <div class="add-product">
                                <form action="addproduct" method="post">
                                    Product ID 
                                    <input id="id" type="text" name="id" required> &nbsp;
                                    Product Name
                                    <input id="name" class="text-field" type="text" name="name" required> <br>
                                    <c:set var="typedb" value="<%=new dal.ProductTypeDAO()%>"/>
                                    <c:set var="typeList" value="${typedb.getAllTypes()}"/>
                                    Type
                                    <select class="drop-down" name="type" required>
                                        <option value="none">--choose Type--</option>
                                        <c:forEach items="${typeList}" var="pt">
                                            <option value="${pt.typeid}">${pt.tname}</option>
                                        </c:forEach>
                                    </select> &nbsp;
                                    <c:set var="adb" value="<%=new dal.BrandDAO()%>"/>
                                    <c:set var="aList" value="${adb.getAllBrands()}"/>
                                    Brand 
                                    <select class="drop-down" name="brand" required>
                                        <option value="none">--choose Brand--</option>
                                        <c:forEach items="${aList}" var="a">
                                            <option value="${a.id}" >${a.name}</option>
                                        </c:forEach>
                                    </select> <br>
                                    Image
                                    <input id="image" class="text-field" type="text" name="image" required> &nbsp;
                                    Price 
                                    <input id="price" class="text-field" type="number" min="0" name="price" required> &nbsp;
                                    Stock 
                                    <input id="stock" class="text-field" type="number" min="0" name="stock" required><br>
                                    <div class="button-outer">
                                        <input  class="submit" type="submit" value="Add">
                                        <input class="cancel" type="button" value="Cancel" onclick="location.href = 'viewStock';">
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </body>
</html>
