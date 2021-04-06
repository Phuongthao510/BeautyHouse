<%-- 
    Document   : merch
    Created on : Oct 15, 2020, 9:40:45 PM
    Author     : Five Swag
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <!-- jQuery and JS bundle w/ Popper.js -->

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Shopping</title>
        <link rel="stylesheet" href="css/home-style.css">
        <link rel="stylesheet" href="css/merch-style.css">
        <script src="js/pagger.js" type="text/javascript"></script>
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
                    <li class="item"><a href="getMerch">All Products</a></li>
                    <li class="item"><a href="getMerch?name=Eye Makeup">Eye Makeup</a></li>
                    <li class="item"><a href="getMerch?name=Face Makeup">Face Makeup</a></li>
                    <li class="item"><a href="getMerch?name=LipStick">LipStick</a></li>
                    <li class="item"><a href="getMerch?name=Lotion">Lotion</a></li>
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

        <!-- breadcrumb part start-->
        <section class="product_list section_padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <c:set var="s" value="${param.search}"/>
                        <c:set var="a" value="${param.brand}"/>
                        <c:set var="p" value="${param.price}"/>
                        <form action="search" method="get">
                            <div class="product_sidebar">
                                <div class="single_sedebar">
                                    <input type="text" name="search" value="${s}" placeholder="Search keyword">
                                    <i class="ti-search"></i>
                                </div>
                                <div class="single_sedebar">
                                    <div class="select_option">
                                        <select name="brand" id="" class="select_option_list"><i
                                                class="right fas fa-caret-down"></i>
                                            <option value="all" class="select_option_dropdown">-Any Brand-</option>
                                            <c:forEach items="${requestScope.aList}" var = "a">
                                                <option value="${a.name}" class="select_option_dropdown" ${(a.name.equalsIgnoreCase(brand)) ? "selected" : ""}>${a.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="single_sedebar">
                                    <div class="select_option">
                                        <label for="priceFrom">Price From:</label>
                                        <input type="number" value="0" min="0" name="priceFrom" />
                                    </div>
                                </div>
                                <div class="single_sedebar">
                                    <div class="select_option">
                                        <label for="priceTo">Price To:</label>
                                        <input type="number" value="100" min="0" name="priceTo" />
                                    </div>
                                </div>
                                <div class="single_sedebar">
                                    <div class="search-button">
                                        <input type="submit" value="Search">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-9">
                        <div class="banner col-lg-12 col-md-12 col-sm-12">
                            ${requestScope.title}
                        </div>
                        <ul class="pagination"></ul>
                        <form id="f1">
                            <div class="product_list">
                                <div class="row">

                                    <c:forEach items="${requestScope.products}" var="product">
                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                            <div class="single_product_item">
                                                <img src="${product.image}" alt="#" class="img-fluid">
                                                <h3> <a href="#">${product.pname}</a> </h3>
                                                <p>$${product.price}</p>
                                                <c:if test="${product.stock==0}">

                                                    <input class="sold-out" type="button" value="SOLD OUT" style="color: white; background-color: red" onclick="soldOutNotice()">
                                                </c:if>
                                                <c:if test="${product.stock > 0}">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.visitor == null}">
                                                            <input class="add-to-cart" type="button" value="Add to Cart" onclick="notice()">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input class="add-to-cart" type="button" value="Add to Cart" onclick="location.href = 'addtocart?pid=${product.pid}&title=${requestScope.title}';">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                                <ul class="pagination"></ul>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <br/>
        <script src="js/pagger.js"></script>
        <c:choose>
            <c:when test="${requestScope.title eq 'All Products'}">
                <script> paggerBasic('pagination',${requestScope.pageIndex}, ${requestScope.totalPages}, 1);</script>
            </c:when>
            <c:otherwise>
                <script>pagger('pagination', 'name', '${requestScope.title}', ${requestScope.pageIndex}, ${requestScope.totalPages}, 1);</script>
            </c:otherwise>
        </c:choose>
        <%@include file="part/footer.html" %>
        <script>
            function soldOutNotice() {
                alert("This item has sold out :( please buy another one");
            }

            function notice() {
                alert("You have to login to start shopping :(")
            }
            function noticeLogin() {
                alert("You need to login first!")
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
