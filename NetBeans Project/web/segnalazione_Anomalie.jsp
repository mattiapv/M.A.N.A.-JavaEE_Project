<%-- 
    Document   : gestioneOrdini
    Created on : 24-ago-2017, 12.24.14
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Segnalazione anomalie</title>
   </head>
   <body>
      <%@ include file="menu.jsp" %>
      <div class="col-md-8 col-md-offset-2">
         <h2>Segnalazione anomalia per prodotto: ${nomeProdotto}</h2><br>
         <form method="POST" action="InviaAnomalia">
            <input type="radio" name="anomalia" value="Prodotto non ricevuto"> Prodotto non ricevuto<br><br>  
            <input type="radio" name="anomalia" value="Prodotto danneggiato"> Prodotto danneggiato<br><br>  
            <input type="hidden" name="orderStatus" value="9">
            <input type="hidden" name="idOrder" value="${idOrder}">
            <input type="hidden" name="idProdotto" value="${idProdotto}">
            <input type = "submit" value="Invia" class = "btn btn-default btn-lg"><br /> 
         </form> 
      </div>
   </body>
</html>