<%-- 
    Document   : viewOrder
    Created on : Oct 15, 2020, 9:50:39 PM
    Author     : Five Swag
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders</title>
        <link rel="stylesheet" href="css/admin.css">
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
                    <div class="main_content">
                        <div class="header">Control Order</div>

                        <div class="info">
                            <div class="product-info">
                                <ul class="pagination"></ul>
                                <table class="table">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Product Name</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Total Quantity</th>
                                            <th scope="col">Total Money</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="odb" value="<%= new dal.OrderDAO()%>"/>
                                        <c:set var="oList" value="${odb.getAllOrders()}"/>
                                        <c:forEach items="${oList}" var="o" >
                                            <tr>
                                                <td>${o.pid}</td>
                                                <td>${o.pname}</td>
                                                <td><img class="zoom" src="${o.image}"></td>
                                                <td>${o.quantity}</td>
                                                <td>${o.totalMoney}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <ul class="pagination"></ul>
                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
        <script src="js/pagger.js"></script>
        <script> paggerBasic('pagination',${requestScope.pageIndex}, ${requestScope.totalPages}, 1);</script>
    </body>
</html>
