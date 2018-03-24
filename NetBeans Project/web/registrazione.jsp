<%-- 
    Document   : registrazione
    Created on : 25-lug-2017, 18.20.26
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Registrazione</title>
   </head>
   <body>
      <%@ include file="menu.jsp" %>
      <div class="col-md-4 col-md-offset-4">
         <div class = "container-fluid">      
            <h1>Registrati</h1>
            <form action="Registrazione" method="POST" class="container-fluid"> 
               <div class="form-group">
                  <label for="idemail">Email: </label>
                  <input id="idemail" class="form-control" type="email" name="email" size="20" placeholder="Email"/>
               </div>
               <div class="form-group">
                  <label for="idfirstName">Nome: </label>
                  <input id="idfirstName" class="form-control" type="text" name="firstName" size="20" placeholder="Nome" />
               </div>
               <div class="form-group">
                  <label for="idlastName">Cognome: </label>
                  <input id="idlastName" class="form-control" type="text" name="lastName" size="20" placeholder="Cognome" />
               </div>
               <div class="form-group">
                  <label for="idpassword1">Password: </label>
                  <input id="idpassword1" class="form-control" type="password" name="password1" size="20" placeholder="Password"/>
               </div>
               <div class="form-group">
                  <label for="idpassword2">Riscrivi password: </label>
                  <input id="idpassword2" class="form-control" type="password" name="password2" size="20" placeholder="Riscrivi la password"/>
               </div>
               <br>
               <div>
                  <input type="submit" value="Invia" class="btn btn-default"/>
                  <input type="reset" value="Reset" class="btn btn-default"/>
               </div>
            </form>
            <br>
            <c:if test = "${successMessage != null}">
               <div class="alert alert-success">
                  <strong>${successMessage}</strong> 
               </div>
               <c:remove var="successMessage"/>
            </c:if>
            <c:if test = "${infoMessage != null}">
               <div class="alert alert-info">
                  <strong>${infoMessage}</strong> 
               </div>
               <c:remove var="infoMessage"/>
            </c:if>
            <c:if test = "${warningMessage != null}">
               <div class="alert alert-warning">
                  <strong>${warningMessage}</strong> 
               </div>
               <c:remove var="warningMessage"/>
            </c:if>
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
