<%-- 
    Document   : pagina_prodotto
    Created on : 10-ago-2017, 16.16.34
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
   <head>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-override.css">
      <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <link rel="stylesheet" type="text/css" href="./css/pagina_prodotto.css">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>${currentProduct.name}</title>
   </head>
   <body>
      <%@ include file="menu.jsp" %>

      <div class="container-fluid">
         <div class="content-wrapper">	
            <div class="item-container">	
               <div class="container">	
                  <div class="col-md-12">
                     <center>
                        <c:if test = "${currentProduct.getPhotos().size() !=0}">
                           <c:forEach items = "${currentProduct.getPhotos()}" var = "ph" >
                              <img src="./data/img/${ph.name}" class="img-responsive img-thumbnail" width="350">
                           </c:forEach>
                        </c:if>
                        <c:if test = "${currentProduct.getPhotos().size() ==0}">
                           <img src="./data/img/No_Image_Available.jpg" class="img-responsive img-thumbnail" width="350">
                        </c:if>
                     </center>
                  </div>
                  <div class="col-md-12">
                     <br>
                     <h2 align="center">${currentProduct.name}</h2>
                     <br>
                     <h4>Descrizione</h4>
                     <div> ${currentProduct.description}</div>
                     <hr>
                     <h4>Prezzo</h4>
                     <div class="product-price"><fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="0.00" value = "${currentProduct.price}"></fmt:formatNumber> &#8364</div>
                        <hr>
                        <h4>Valutazione</h4>
                     <c:set var="count1" value="0" scope="page" />
                     <div class="product-rating"><c:forEach begin="1" end="${currentProduct.getAvg_rate()}"><i class="fa fa-star gold"></i><c:set var="count1" value="${count1 + 1}" scope="page"/></c:forEach><c:forEach begin="1" end="${5-count1}"><i class="fa fa-star-o"></i></c:forEach></div>
                        <hr>
                        <div class="btn-group cart">
                           <a href="AddCart" class="btn btn-success" role="button"> Aggiungi al carrello <i class="fa fa-shopping-cart"></i></a>
                        </div>
                     </div>
                  </div> 
               </div>
               <div class="container-fluid">		
                  <div class="col-md-12 product-info">
                     <ul id="myTab" class="nav nav-tabs nav_tabs">
                        <li class="active"><a href="#service-one" data-toggle="tab">Negozio</a></li>
                           <li><a href="#service-two" data-toggle="tab">Recensioni (<c:out value="${currentProduct.getReviews().size()}"/>)</a></li>
                     <li><a href="#service-three" data-toggle="tab">Foto dagli Utenti</a></li>
                  </ul>
                  <div id="myTabContent" class="tab-content">
                     <div class="tab-pane fade in active" id="service-one">
                        <section class="container product-info">
                           Il prodotto si trova: <a href="LoadShop?idNegozio=${currentProduct.shop.id}">${currentProduct.shop.name}</a>
                           <br>
                           <br>
                           <br>
                        </section>
                     </div>
                     <div class="tab-pane fade" id="service-two">
                        <br>
                        <c:if test = "${currentProduct.getReviews().size()!=0}">
                           <c:set var="count" value="0" scope="page" />
                           <c:forEach items="${currentProduct.getReviews()}" var="r">
                              <c:set var="count" value="${count + 1}" scope="page"/>
                              <c:if test = "${count % 2==0}">
                                 <!-- Left-aligned media object -->
                                 <div class="media">
                                    <div class="media-left">
                                       <img src="./data/img/img_avatar1.png" class="media-object" style="width:60px">
                                    </div>
                                    <div class="media-body">
                                       <h4 class="media-heading">Recensione del ${r.date} inserita da ${r.name_Author}</h4><br>
                                       <p><c:out value="${r.description}"/></p>
                                    </div>
                                 </div>
                                 <hr>
                              </c:if>
                              <c:if test = "${count % 2==1}">
                                 <!-- Right-aligned media object -->
                                 <div class="media">
                                    <div class="media-body">
                                       <h4 class="media-heading">Recensione del ${r.date} inserita da ${r.name_Author}</h4><br>
                                       <p><c:out value="${r.description}"/></p>
                                    </div>
                                    <div class="media-right">
                                       <img src="./data/img/img_avatar1.png" class="media-object" style="width:60px">
                                    </div>
                                 </div>
                                 <hr>
                              </c:if>
                           </c:forEach>
                        </c:if>
                     </div>
                     <div class="tab-pane fade" id="service-three">
                        <c:if test = "${user != null}">
                        <h4>Foto Upload:</h4>
                        Seleziona una foto da caricare: <br />
                        <form action = "UploadServlet" method = "post" enctype = "multipart/form-data">
                           <input type = "file" name = "file" />
                           <br />
                           <input type = "submit" value = "Upload File" />
                           <hr>
                        </form>
                        </c:if>
                        <c:if test = "${currentProduct.getUsersPhotos().size() !=0}">
                           <c:forEach items = "${currentProduct.getUsersPhotos()}" var = "uph" >
                              <center><h4>Foto dagli utenti</h4></center>
                              Foto inserita da: <strong>${uph.nameOwner}</strong><br>
                              <br>
                              <img src="./data/img/userImg/${uph.name}" class="img-responsive img-thumbnail" width="350">
                              <br>
                              <hr>
                           </c:forEach>
                        </c:if>
                        <c:if test = "${currentProduct.getUsersPhotos().size() ==0}">
                           Nessuna foto inserita dagli utenti
                            <br>

                        </c:if>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </body>
</html>
