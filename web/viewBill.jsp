<%-- 
    Document   : viewBill
    Created on : Oct 15, 2020, 10:29:40 PM
    Author     : Five Swag
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase Succeed</title>
        <link rel="stylesheet" href="css/home-style.css">
        <link rel="stylesheet" href="css/merch-style.css">
        <link rel="stylesheet" href="css/viewBill-style.css">
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
        <c:if test="${sessionScope.visitor != null}">
            <header>
                <nav>
                    <ul class="menu">
                        <li class="logo"><a href="index.jsp"><img src="img/logo.jpg" alt=""></a></li>
                        <li class="item"><a href="index.jsp">Home</a></li>
                        <li class="item"><a href="getMerch">Shopping</a></li>
                        </li>
                        <li class="item" id="user"><a href=""><i class="fas fa-user"></i> ${sessionScope.visitor.username}</a></li>
                        <li class="item button secondary"><a href="logout">Log Out</a></li>
                            <c:choose>
                                <c:when test="${requestScope.obj!=null}">
                                <li class="item cart"><a href="cart.jsp"><i class="fas fa-shopping-cart"></i>(${requestScope.noOfItems})</a></li>
                                </c:when>
                                <c:otherwise>
                                <li class="item cart"><a href="cart.jsp"><i class="fas fa-shopping-cart"></i>(0)</a></li>
                                </c:otherwise>
                            </c:choose>
                        <li class="toggle"><span class="bars"></span></li>
                    </ul>
                </nav>
            </header>
            <section class="breadcrumb_part">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumb_iner" style="font-size: 50px; letter-spacing: 10px;">
                                <h2>Order successful</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <h3>Thanks, ${sessionScope.visitor.username} 😍😍</h3>
            <div class="backtohome">
                <input type="button" value="Back to Homepage" onclick="location.href = 'index.jsp';">
            </div>

            <%@include file="part/footer.html" %>
        </c:if>
    </body>
</html>
