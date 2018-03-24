<%-- 
    Document   : gestioneOrdini
    Created on : 24-ago-2017, 12.24.14
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
   <head>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Gestione Ordini Venditore</title>
   </head>
   <body>
      <%@ include file="menu.jsp" %>
      <div class="col-md-8 col-md-offset-2">
         <c:choose>
            <c:when test= "${ordiniVenditore.size()!=0}"> 
               <h2>Gestione ordini venditore </h2>
               <br>
               <c:forEach items="${ordiniVenditore}" var="o">
                  <h3>Numero ordine: ${o.id} del ${o.date}  di ${o.buyerName} </h3>
                  <div class="table-responsive"> 
                     <table class="table table-bordered">
                        <thead>
                           <tr>
                              <th>Prodotto</th>
                              <th>Prezzo</th>
                              <th>Quantità</th>
                              <th>Totale</th>
                              <th>Negozio</th>
                              <th>Stato Ordine</th>
                              <th>Problema Segnalato</th>

                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach items="${o.getOrderDetails()}" var="od">
                              <tr>
                                 <td>${od.prodotto.name}<br></td>
                                 <td><fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="0.00" value = "${od.prodotto.price}"></fmt:formatNumber> &#8364</td>
                                 <td>${od.prodotto.quantity}</td>
                                 <td><fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="0.00" value = "${od.prodotto.price*od.prodotto.quantity}"></fmt:formatNumber> &#8364</td>
                                 <td>${od.prodotto.shop.name}</td>
                                 <td>${od.getOrderStatus()}</td>
                                 <td>${od.getProblemDescription()}</td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </c:forEach>
            </c:when>
            <c:otherwise> <h2>Nessun Ordine </h2> </c:otherwise>
         </c:choose>
      </div>
   </body>
</html>
