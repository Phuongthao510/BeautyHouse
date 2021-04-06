<%-- 
    Document   : signup
    Created on : Oct 15, 2020, 11:02:49 PM
    Author     : Five Swag
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link rel="stylesheet" href="css/sign-up-style.css">
    </head>
    <body>
        <form id="frm" name="signup" class="box" action="signup" method="post" onsubmit="return validateForm(event)">

            <c:if test="${requestScope.error!=null}">
                <div id="alert" class="alert">
                    <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                    <strong>${requestScope.error}</strong>
                </div>
            </c:if>
            <p id="message" style="color: whitesmoke;"></p>
            <h1>Sign Up</h1>
            <input type="text" name="username" value="${requestScope.user}" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="text" name="email" placeholder="Email">
            <input type="password" name="repassword" placeholder="Confirm Password" required>
            <input type="submit" name="" value="Sign Up">
            <a style="color: black; text-decoration: none" href="index.jsp">Cancel</a>
        </div>
    </form>

    <script>
        function validateForm(event)
        {
            var username = document.signup.username.value;
            var pass = document.signup.password.value;
            var repass = document.signup.repassword.value;
            var email = document.signup.email.value;
            var regexEmail = new RegExp("^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$");
            event.preventDefault(); // this will prevent the submit event.
            if (document.signup.username.value == "")
            {
                document.getElementById("message").innerHTML = 'Username cannot be left blank!';
                document.signup.username.focus();
                return false;
            } else if (email != "" && !regexEmail.test(email)) {
                document.getElementById("message").innerHTML = 'Invalid email address!';
                document.signup.email.focus();
                return false;
            } else if (document.signup.password.value == "")
            {
                document.getElementById("message").innerHTML = 'Password cannot be left blank!';
                document.signup.password.focus();
                return false;
            } else if (pass != repass) {
                document.getElementById("message").innerHTML = 'Password not match!';
                document.signup.repassword.focus();
                return false;
            } else {
                document.signup.submit();
            }
        }
    </script>
</body>
</html>
