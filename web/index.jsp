<%-- 
    Document   : home
    Created on : Oct 15, 2020, 9:33:49 PM
    Author     : Five Swag
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>BEAUTYHOUSE</title>
        <link rel="stylesheet" href="css/home-style.css">
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
        <script>
            $(function () {
                $(".toggle").on("click", function () {
                    if ($(".item").hasClass("active")) {
                        $(".item").removeClass("active");
                    } else {
                        $(".item").addClass("active");
                    }
                });
            });
        </script>
    </head>
    <body>
        <header>
            <nav>
                <ul class="menu">
                    <li class="logo"><a href="index.jsp"><img src="img/logo.jpg" alt=""></a></li>
                    <li class="item"><a href="index.jsp">Home</a></li>
                    <li class="item"><a href="getMerch">Shopping</a></li>
                        <c:if test="${sessionScope.visitor==null}">
                        <li class="item button"><a href="login.jsp">Log In</a></li>
                        <li class="item button secondary"><a href="signup.jsp">Sign Up</a></li>
                        <li class="item cart"><a href="" onclick="noticeLogin()"><i class="fas fa-shopping-cart"></i></a></li>
                            </c:if>
                            <c:if test="${sessionScope.visitor!=null}">
                        <li class="item" id="user"><a href=""><i class="fas fa-user"></i> ${sessionScope.visitor.username}</a></li>
                        <li class="item button secondary"><a href="logout">Log Out</a></li>
                        <li class="item cart"><a href="cart.jsp"><i class="fas fa-shopping-cart"></i>(${requestScope.noOfItems})</a></li>
                        </c:if>
                    <li class="toggle"><span class="bars"></span></li>
                </ul>
            </nav>
        </header>
        <!-- HEADER -->
        <div class="wrapper">
            <div id="quote">
                <p>"A secret makes a woman woman"</p>
                <p>Vermouth</p>
            </div>

            <header class="text-center text-white d-flex">
                <div class="container my-auto">
                    <div class="row">
                        <div class="col-lg-12 my-auto">
                            <h1 class="text-uppercase faded" id="tek">
                                <strong>
                                    <p id="wt">WELCOME TO</p>
                                    <p id="highlight">BEAUTY HOUSE</p>
                                </strong>
                            </h1>
                            <hr>
                        </div>
                        <div class="col-lg-12 my-auto" id="sns">
                            <a href="https://www.facebook.com/Eun.Sunshine.hpt" target="blank"><i
                                    class="fab fa-facebook"></i></a>
                            <a href="https://www.instagram.com/eunkyo.smile510/?hl=en" target="blank"><i
                                    class="fab fa-instagram"></i></a>
                            <a href="https://www.youtube.com/channel/UC-gljeiuxAOpxiB1j32pKpQ" target="blank"><i
                                    class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                </div>


            </header>
        </div>
        <%@include file="part/footer.html" %>
        <script>
            function noticeLogin() {
                alert("You need to login first!")
            }
        </script>
    </body>
</html>
