<%-- 
    Document   : viewStock
    Created on : Oct 15, 2020, 9:44:49 PM
    Author     : Five Swag
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stocks</title>
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
                        <div class="header">View Stock</div>

                        <div class="info">
                            <div>
                                <!--                                <table class="table table-sm" id="sumTable">
                                                                    <thead>
                                                                        <tr>
                                
                                <%--<c:forEach items="${requestScope.typeList}" var = "t">--%>
                                    <th scope="col">$//{t.tname}</th>
                                <%--</c:forEach>--%>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>

                                <%--<c:forEach items="${requestScope.typeList}" var = "t">--%>
                                    <td>$//{requestScope.pdb.getProductStock(t.typeid)}</td>
                                <%--</c:forEach>--%>

                            </tr>
                        </tbody>
                    </table>-->
                                <div class="sumup">
                                    <h3>Total Product: ${requestScope.listAll.size()}</h3>
                                </div>
                            </div>
                            <form action="viewStock" method="post" id="f1" >
<!--                        <div class="product-type"#product-type >
                            <div>
                            <select name="productType" onchange="f1.submit()">
                            <option value="all">--All--</option>
                                
                            <%--<c:forEach items="${requestScope.typeList}" var = "t">--%>
                                    <option value="$//{t.tname}" >$//{t.tname}</option>
                                <%--</c:forEach>--%>
                            </select>
                        </div>
                    </div>-->
                                <div class="product-info">
                                    <ul class="pagination"></ul>
                                    <table class="table">

                                        <thead class="thead-dark">
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Product Name</th>
                                                <th scope="col">Type</th>
                                                <th scope="col">Brand</th>
                                                <th scope="col">image</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Stock</th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.pList}" var = "p">
                                                <tr>
                                                    <td>${p.pid}</td>
                                                    <td>${p.pname}</td>
                                                    <td>${p.typeid}</td>
                                                    <td>${p.brandid}</td>
                                                    <td><img class="zoom" src="${p.image}"></td>
                                                    <td>$${p.price}</td>
                                                    <td>${p.stock}</td>
                                                    <td><input type="button" class="edit-btn" onclick="location.href = 'edit?pid=${p.pid}'" value="Edit"></td>
                                                    <td><input type="button" class="remove-btn" onclick="location.href = 'remove?pid=${p.pid}'" value="Remove"></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <ul class="pagination"></ul>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

        <script src="js/pagger.js"></script>
        <c:choose>
            <c:when test="${requestScope.typeN eq 'all'||requestScope.typeN==null}">
                <script> paggerBasic('pagination',${requestScope.pageIndex}, ${requestScope.totalPages}, 1);</script>
            </c:when>
            <c:otherwise>
                <script>pagger('pagination', 'productType', '${requestScope.typeN}', ${requestScope.pageIndex}, ${requestScope.totalPages}, 1);</script>
            </c:otherwise>
        </c:choose>
    </body>
</html>
