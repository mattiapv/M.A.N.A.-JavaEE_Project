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
      <title>Gestione Ordini</title>
   </head>
   <body>
      <%@ include file="menu.jsp" %>
      <div class="col-md-8 col-md-offset-2">
         <c:choose>
            <c:when test= "${ordini.size()!=0}"> 
               <c:choose>
                  <c:when test= "${user.getRole() == 'amministratore'}"> <h2>Gestione Ordini </h2> </c:when>
                  <c:otherwise> <h2>I tuoi ordini </h2> </c:otherwise>
               </c:choose>
               <br>
               <c:forEach items="${ordini}" var="o">
                  <h3>Numero ordine: ${o.id} del ${o.date} <c:if test= "${user.getRole() == 'amministratore'}"> di ${o.buyerName} </c:if></h3>
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
                              <c:if test= "${user.getRole() == 'amministratore'}"> <th>Problema Segnalato</th> </c:if>

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
                                 <c:if test= "${user.getRole() == 'amministratore'}"> <td>${od.getProblemDescription()}</td></c:if>
                                 <c:choose>
                                       <c:when test= "${(user.getRole() == 'amministratore') and (od.orderStatusNumber == 9)}"><td><a href="GestioneAnomalia?nomeProdotto=${od.prodotto.name}&idProdotto=${od.prodotto.id}&idOrder=${o.id}" class="btn btn-danger" role="button">Gestisci Anomalia</a></td> </c:when>
                                       <c:when test= "${(user.getRole() == 'amministratore') and (od.orderStatusNumber != 9)}"><td><a href="GestioneAnomalia?nomeProdotto=${od.prodotto.name}&idProdotto=${od.prodotto.id}&idOrder=${o.id}" class="btn btn-danger disabled" role="button">Gestisci Anomalia</a></td> </c:when>
                                    <c:otherwise><td> <a href="InviaAnomalia?nomeProdotto=${od.prodotto.name}&idProdotto=${od.prodotto.id}&idOrder=${o.id}" class="btn btn-danger" role="button">Segnala Anomalia</a> </td></c:otherwise>
                                 </c:choose>
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
