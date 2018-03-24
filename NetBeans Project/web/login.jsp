<%-- 
    Document   : login
    Created on : 24-lug-2017, 11.28.16
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <link rel="stylesheet" type="text/css" href="./css/style.css">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Login</title>
   </head>
   <body>
      <%@ include file="menu.jsp" %>
      <div class="col-md-4 col-md-offset-4">
         <div class = "container-fluid">
            <h1>Accedi</h1>
            <form action = "Login" method = POST class="container-fluid">
               <div class="form-group">
                  <label for="email">Email:</label>
                  <input type="email" class="form-control" id="email" placeholder="Email" name="email">
               </div>
               <div class="form-group">
                  <label for="pwd">Password:</label>
                  <input type="password" class="form-control" id="pwd" placeholder="Password" name="password">
               </div>
               <input type="submit" value="Login" class="btn btn-default"/>
               <input type="reset" value="Reset" class="btn btn-default"/>
            </form>
            <br>
            <c:if test = "${dangerMessage != null}">
               <div class="alert alert-danger">
                  <strong>${dangerMessage}</strong> 
               </div>
               <c:remove var="dangerMessage"/>
            </c:if>
         </div>
      </div>
   </body>
</html>
