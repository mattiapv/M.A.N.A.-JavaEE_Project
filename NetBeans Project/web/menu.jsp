<%-- 
    Document   : index
    Created on : 24-lug-2017, 10.58.28
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <title>Menu</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <style>
         /* Remove the navbar's default rounded borders and increase the bottom margin */ 
         .navbar {
            margin-bottom: 20px;
            border-radius: 0;
         }
         footer {
            background-color: #f2f2f2;
            padding: 25px;
         }
      </style>
   </head>
   <body>
      <nav class="navbar navbar-inverse">
         <div class="container-fluid">
            <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>                
               </button>
               <a class="navbar-brand" href="#">M.A.N.A.</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
               <ul class="nav navbar-nav">
                  <li class="active"><a href="index.jsp">Home</a></li>
                  <!--<li><a href="UsersListServlet">Utenti Registrati</a></li> -->
                  <!-- <li><a href="InvalidaSessione">Invalida Sessione</a></li>-->
                  <!-- <li><a href="./data/progetto.zip">Download Progetto</a></li> -->
               </ul>
               <ul class="nav navbar-nav navbar-right">
                  <form method="POST" action="LoadProducts" class="navbar-form navbar-left">
                     <div class="form-group">
                        <input type="text" class="form-control" placeholder="Cerca Prodotti" name="nomeProdotto">
                        <input type="hidden" name="categoria" value="Tutte le categorie">
                        <input type="hidden" name="price" value="0">
                        <input type="hidden" name="address" value="">
                        <input type="hidden" name="rate" value="0">
                     </div>
                     <button type="submit" class="btn btn-default">Cerca</button>
                  </form>
                  <li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span><c:if test="${empty previousItems}">Carrello: (0)</c:if><c:if test="${not empty previousItems}">Carrello: (${previousItems.size()})</c:if></a></li>
                     <c:choose>
                        <c:when test = "${user.getRole() == 'amministratore' }">
                        <li><a href="#">Notifiche <span class="badge">${user.num_notifies}</span></a></li>
                        <li class="dropdown">
                           <a class="dropdown-toggle" data-toggle="dropdown" href="#">${user.firstName} ${user.lastName} <span class="caret"></span></a>
                           <ul class="dropdown-menu">
                              <li><a href="pagina_personale.jsp"><span class="glyphicon glyphicon-user"></span> Profilo </a></li>
                              <li><a href="OrdersList"><span class="glyphicon glyphicon-folder-close"></span> Gestione Ordini</a></li>
                              <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                           </ul>
                        </li>
                     </c:when>
                     <c:when test = "${user.getRole() == 'registrato' }">
                        <li><a href="#">Notifiche <span class="badge">${user.num_notifies}</span></a></li>
                        <li class="dropdown">
                           <a class="dropdown-toggle" data-toggle="dropdown" href="#">${user.firstName} ${user.lastName} <span class="caret"></span></a>
                           <ul class="dropdown-menu">
                              <li><a href="pagina_personale.jsp"><span class="glyphicon glyphicon-user"></span> Profilo </a></li>
                              <li><a href="OrdersList"><span class="glyphicon glyphicon-folder-close"></span> I miei Ordini</a></li>
                              <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                           </ul>
                        </li>
                     </c:when>
                     <c:when test = "${user.getRole() == 'venditore' }">
                        <li><a href="#">Notifiche <span class="badge">${user.num_notifies}</span></a></li>
                        <li class="dropdown">
                           <a class="dropdown-toggle" data-toggle="dropdown" href="#">${user.firstName} ${user.lastName} <span class="caret"></span></a>
                           <ul class="dropdown-menu">
                              <li><a href="pagina_personale.jsp"><span class="glyphicon glyphicon-user"></span> Profilo </a></li>
                              <li><a href="OrdersList"><span class="glyphicon glyphicon-folder-close"></span> Gestione Ordini (Compratore)</a></li>
                              <li><a href="OrdersListSeller"><span class="glyphicon glyphicon-folder-close"></span> Gestione Ordini (Negozio)</a></li>
                              <li><a href="MyShops"><span class="glyphicon glyphicon-home"></span> I miei Negozi </a></li>
                              <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                           </ul>
                        </li>
                     </c:when>
                     <c:when test = "${user == null}">
                        <li><a href="registrazione.jsp"><span class="glyphicon glyphicon-user"></span> Registrazione</a></li>
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        </c:when>
                     </c:choose>
               </ul>
            </div>
      </nav>
      <div class="container-fluid">
         <c:if test = "${successMessage != null}">
            <div class="alert alert-success">
               <strong>${successMessage}</strong> 
            </div>
            <c:remove var="successMessage"/>
         </c:if>
         <c:if test = "${dangerMessage != null}">
            <div class="alert alert-danger">
               <strong>${dangerMessage}</strong> 
            </div>
            <c:remove var="dangerMessage"/>
         </c:if>
         <c:if test = "${infoMessage != null}">
            <div class="alert alert-info">
               <strong>${infoMessage}</strong> 
            </div>
            <c:remove var="infoMessage"/>
         </c:if>
      </div>
   </body>
</html>
