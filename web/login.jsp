<%-- 
    Document   : login
    Created on : Oct 15, 2020, 10:19:47 PM
    Author     : Five Swag
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="css/home-style.css">
        <link rel="stylesheet" href="css/merch-style.css">
        <link rel="stylesheet" href="css/login-style.css">
        <link rel="stylesheet" href="css/sign-up-style.css">
        <link href="https://fonts.googleapis.com/css?family=Doppio+One|Oxanium&display=swap" rel="stylesheet">

    </head>
    <body>
        <div class="hero">

            <c:if test="${requestScope.error!=null}">
                <div id="alert" class="alert">
                    <strong>${requestScope.error}</strong>
                </div>
            </c:if>
            <div class="form-box">
                <div class="button-box">
                    <div id="btn"></div>
                    <button type="button" class="toggle-btn" onclick="loginuser()">User</button>
                    <button type="button" class="toggle-btn" onclick="loginadmin()">Admin</button>
                </div>
                <div class="social-icons">
                    <img src="img/logo.jpg" alt="">
                </div>
                <form id="login-user" action="login" method="post" class="input-group">

                    <input type="text" name="username" value="" class="input-field" placeholder="Account" required>
                    <input type="password" name="password" value="" class="input-field" placeholder="Password" required>
                    <br/><br/><br/><br/>
                    <input type="submit" class="submit-btn" value="Login">
                    <li class="items" id="loginAd">
                        <a href="index.jsp">Cancel</a>
                    </li>
                </form>
                <form id="login-admin" action="loginAdmin" method = "post" class="input-group">
                    <input type="text" class="input-field" name="username" placeholder="Account" required>
                    <input type="password" class="input-field" name="password" placeholder="Password" required>
                    <br/><br/>
                    <input type="submit" class="submit-btn" id="loginAd" value="Login">
                    <li class="items" id="loginAd">
                        <a href="index.jsp">Cancel</a>
                    </li>
                </form>

            </div>

        </div>
        <script>
            var x = document.getElementById("login-user");
            var y = document.getElementById("login-admin");
            var z = document.getElementById("btn");

            function loginadmin() {
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
            function loginuser() {
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }
        </script>
    </body>
</html>
