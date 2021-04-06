<%-- 
    Document   : cart
    Created on : Oct 15, 2020, 9:37:49 PM
    Author     : Five Swag
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Item"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="css/home-style.css">
        <link rel="stylesheet" href="css/merch-style.css">
        <link rel="stylesheet" href="css/cart-style.css">
        <link href="https://fonts.googleapis.com/css?family=Economica|Rancho|Special+Elite&display=swap" rel="stylesheet">
        <link
            href="https://fonts.googleapis.com/css?family=Alegreya+SC|Amatic+SC|Bahianita|Bubblegum+Sans|Fredericka+the+Great|Handlee|Love+Ya+Like+A+Sister|Luckiest+Guy|Nothing+You+Could+Do|Open+Sans+Condensed:300|Permanent+Marker|Shadows+Into+Light|Zilla+Slab&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dosis&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
              integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8=" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.visitor == null}">
                <h1>You cannot access this site!</h1>
            </c:when>
            <c:otherwise>
                <header>
                    <nav>
                        <ul class="menu">
                            <li class="logo"><a href="index.jsp"><img src="img/logo.jpg" alt=""></a></li>
                            <li class="item"><a href="index.jsp">Home</a></li>
                            <li class="item"><a href="getMerch">Shopping</a></li>

                            <li class="item" id="user"><a href=""><i class="fas fa-user"></i> ${sessionScope.visitor.username}</a></li>
                            <li class="item button secondary"><a href="logout">Log Out</a></li>
                                <c:choose>
                                    <c:when test="${sessionScope.cart != null}">
                                    <li class="item cart"><a href="cart.jsp"><i class="fas fa-shopping-cart"></i>(${sessionScope.itemList.size()})</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="item cart"><a href="cart.jsp"><i class="fas fa-shopping-cart"></i>(0)</a></li>
                                    </c:otherwise>
                                </c:choose>
                            <li class="toggle"><span class="bars"></span></li>
                        </ul>
                    </nav>
                </header>
                <!-- BANNEr -->
                <section class="breadcrumb_part">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="breadcrumb_iner">
                                    <h2>Cart</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- CART AREA -->

                <c:choose>
                    <c:when test="${sessionScope.cart == null}">
                        <div class="no-item">
                            <p>You don't have any items in your cart!</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${sessionScope.itemList.isEmpty()}">
                                <div class="no-item">
                                    <p>You don't have any items in your cart!</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <section class="cart_area section_padding">
                                    <div class="container">
                                        <div class="cart_inner">
                                            <form action="checkout?username=${sessionScope.visitor.username}" method="post">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">Product</th>
                                                                <th scope="col">Price</th>
                                                                <th scope="col">Quantity</th>
                                                                <th scope="col">Total</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${sessionScope.itemList}" var = "i">
                                                                <tr>
                                                                    <td>
                                                                        <div class="media">
                                                                            <div class="d-flex">
                                                                                <img src="${i.product.image}" alt="" />
                                                                            </div>
                                                                            <div class="media-body">
                                                                                <p>${i.product.pname}</p>
                                                                                <p class="stock">Available: <b>${i.product.stock}</b></p>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <h5>$${i.product.price}</h5>
                                                                    </td>
                                                                    <td>
                                                                        <div class="box">
                                                                            <input class="quantity" type="number" value="${i.quantity}" min="0" max="${i.product.stock}" readonly>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <h5 id="field">$${i.quantity*i.price}</h5>
                                                                    </td>
                                                                    <td class="remove"><a href="removeItem?id=${i.product.pid}"><i class="far fa-window-close"></i></a></td>
                                                                </tr>
                                                            </c:forEach>
                                                            <tr class="bottom_button">
                                                                <td>
                                                                    <a class="btn_1" href="getMerch">Continue shopping</a>
                                                                </td>
                                                                <td></td>
                                                                <td></td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td>
                                                                    <h2>Subtotal:</h2>
                                                                </td>
                                                                <td>
                                                                    <h5>$${sessionScope.total}</h5>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <p style="text-align: right; font-style: italic;">
                                                        transport fee free and Payment on delivery
                                                    </p>
                                                    <div class="checkout_btn_inner float-right" style="margin-bottom: 30px; margin-top: 20px;">
                                                        <input id="proceed" type="Submit" value="Payment">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                </section>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
                <%@include file="part/footer.html" %>
            </c:otherwise>
        </c:choose>
    </body>
</html>
