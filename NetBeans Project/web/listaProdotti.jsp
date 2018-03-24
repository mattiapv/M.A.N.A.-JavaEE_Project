<%-- 
    Document   : listaProdotti
    Created on : 13-ago-2017, 20.30.03
--%>

      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
                  <!DOCTYPE html>
                  <html>

                  <head>
                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1">
                        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
                        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
                        <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
                        <script src="https://maps.googleapis.com/maps/api/js?key=GOOGLEAPIKEY&sensor=false&libraries=places&language=en"></script>
                        <style>
                              .content-wrapper {
                                    max-width: 1400px;
                                    background: #fff;
                                    margin: 0 auto;
                                    margin-top: 10px;
                                    margin-bottom: 10px;
                                    border: 0px;
                                    border-radius: 0px;
                              }
                        </style>
                        <title>Lista Prodotti</title>
                  </head>

                  <body>
                        <%@ include file="menu.jsp" %>
                              <div class="container-fluid">
                                    <div class="row">
                                          <div class="col-md-12">
                                                <div class="content-wrapper">
                                                      <div class="alert alert-success">
                                                            <c:if test="${prodotti.size()>1}">
                                                                  <strong>Sono stati trovati
                                                                        <c:out value="${prodotti.size()}" /> prodotti</strong>
                                                            </c:if>
                                                            <c:if test="${prodotti.size()<2 and prodotti.size()!=0}">
                                                                  <strong>� stato trovato 1 prodotto </strong>
                                                            </c:if>
                                                      </div>
                                                      <form action="LoadProducts" method="Post">
                                                            <div class="row">
                                                                  <div class="col-md-3">
                                                                        <p>
                                                                              <label for="autocompleteMaps">Zona Geografica </label>
                                                                        </p>
                                                                        <input id="autocompleteMaps" placeholder="Tutto il mondo" type="text" name="address" class="form-control" />
                                                                        <script>
                                                                              var input = document.getElementById('autocompleteMaps');
                                                                              var autocomplete = new google.maps.places.Autocomplete(input);
                                                                        </script>
                                                                  </div>
                                                                  <div class="col-md-3">
                                                                        <p>
                                                                              <label for="prezzo">Prezzo</label>
                                                                        </p>
                                                                        <select class="form-control" name="price" id="prezzo">

                                                                              <%@ include file="data/prezzi.txt" %>

                                                                        </select>
                                                                  </div>
                                                                  <div class="col-md-3">
                                                                        <p>
                                                                              <label for="rate">Rate</label>
                                                                        </p>
                                                                        <select class="form-control" name="rate" id="rate">

                                                                              <%@ include file="data/rate.txt" %>

                                                                        </select>
                                                                  </div>
                                                                  <div class="col-md-3">
                                                                        <br>
                                                                        <div class="visible-xs visible-sm">
                                                                              <center>
                                                                                    <input type="submit" value="Filtro" class="btn btn-default btn-lg">
                                                                              </center>
                                                                        </div>
                                                                        <div class="hidden-xs hidden-sm">
                                                                              <input type="submit" value="Filtro" class="btn btn-default btn-lg">
                                                                        </div>
                                                                  </div>
                                                            </div>
                                                            <input type="hidden" name="nomeProdotto" value="${nomeProdotto}">
                                                            <input type="hidden" name="categoria" value="${categoria}">
                                                            <input type="hidden" name="address" value="${address}">
                                                            <input type="hidden" name="dalistaprodotti" value="true">
                                                      </form>

                                                      <c:set var="count" value="0" scope="page" />
                                                      <div class="container-fluid">
                                                            <hr>
                                                            <c:forEach items="${prodotti}" var="p">
                                                                  <br>
                                                                  <c:set var="count" value="${count + 1}" scope="page" />
                                                                  <center>
                                                                        <h4>
                                                                              <a href="LoadProduct?idProdotto=${p.id}">${count}. ${p.name}</a>
                                                                        </h4>
                                                                  </center>
                                                                  <br>
                                                                  <div class="row">
                                                                        <div class="col-sm-4">
                                                                              <center>
                                                                                    <c:if test="${p.getPhotos().size() !=0}">
                                                                                          <a href="LoadProduct?idProdotto=${p.id}">
                                                                                                <img border="0" alt="${p.name}"
                                                                                                      src="./data/img/${p.getPhotos().get(0).name}"
                                                                                                      class="img-responsive img-thumbnail"
                                                                                                      width="300">
                                                                                          </a>
                                                                                    </c:if>
                                                                                    <c:if test="${p.getPhotos().size() ==0}">
                                                                                          <a href="LoadProduct?idProdotto=${p.id}">
                                                                                                <img border="0" alt="${p.name}"
                                                                                                      src="./data/img/No_Image_Available.jpg"
                                                                                                      class="img-responsive img-thumbnail"
                                                                                                      width="300">
                                                                                          </a>
                                                                                    </c:if>
                                                                              </center>
                                                                              <br>
                                                                        </div>
                                                                        <div class="col-sm-4">
                                                                              <c:set var="star" value="0" scope="page" />
                                                                              <table class="table table-striped table-bordered table-responsive">
                                                                                    <tr>
                                                                                          <th scope="row">Descrizione: </th>
                                                                                          <td>
                                                                                                <p class="text-right">${p.description}</p>
                                                                                          </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                          <th scope="row">Prezzo: </th>
                                                                                          <td>
                                                                                                <p class="text-right">
                                                                                                      <fmt:formatNumber type="number"
                                                                                                            maxFractionDigits="2"
                                                                                                            pattern="0.00" value="${p.price}"></fmt:formatNumber>
                                                                                                      &#8364</p>
                                                                                          </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                          <th scope="row">Stelle: </th>
                                                                                          <td>
                                                                                                <p class="text-right">
                                                                                                      <c:forEach begin="1" end="${p.getAvg_rate()}">
                                                                                                            <i class="glyphicon glyphicon-star"></i>
                                                                                                            <c:set var="star"
                                                                                                                  value="${star + 1}"
                                                                                                            /></c:forEach>
                                                                                                      <c:forEach
                                                                                                            begin="1" end="${5-star}">
                                                                                                            <i class="glyphicon glyphicon-star-empty"></i>
                                                            </c:forEach>
                                                            </p>
                                                            </td>
                                                            </tr>
                                                            <tr>
                                                                  <th scope="row">Numero Recensioni: </th>
                                                                  <td>
                                                                        <p class="text-right">${p.getReviews().size()}</p>
                                                                  </td>
                                                            </tr>
                                                            <tr>
                                                                  <th scope="row">Negozio: </th>
                                                                  <td>
                                                                        <p class="text-right">
                                                                              <a href="LoadShop?idNegozio=${p.shop.id}">${p.shop.name}</a>
                                                                        </p>
                                                                  </td>
                                                            </tr>
                                                            <%--  <tr><th scope="row">Descrizione Negozio: </th> <td><p class="text-right"><c:out value="${p.shop.description}"/></p></td></tr>
                                             <tr><th scope="row">Punteggio Negozio: </th> <td><p class="text-right"><c:out value="${p.shop.rate}"/></p></td></tr>          --%>
                                                                  <tr>
                                                                        <th scope="row">Web Site Negozio: </th>
                                                                        <td>
                                                                              <p class="text-right">
                                                                                    <a href="${p.shop.web_Site_Url}">${p.shop.web_Site_Url}</a>
                                                                              </p>
                                                                        </td>
                                                                  </tr>
                                                                  </table>
                                                                  <br>
                                                                  </div>
                                                                  <div class="col-sm-4">
                                                                        <center>
                                                                              <a href="https://www.google.com/maps/place/${p.shop.name},+${p.shop.address}/">
                                                                                    <img src="https://maps.googleapis.com/maps/api/staticmap?center=${p.shop.name},+${p.shop.address}&zoom=17&scale=1&size=300x350&maptype=roadmap&key=GOOGLEAPIKEY&format=png&visual_refresh=true&markers=size:mid%7Ccolor:0x47a1fb%7Clabel:1%7C${p.shop.name},+${p.shop.address}"
                                                                                          alt="Google Map of ${p.shop.name}, ${p.shop.address}">
                                                                              </a>
                                                                        </center>
                                                                  </div>
                                                                  </div>
                                                                  <br>
                                                                  <br>
                                                                  <hr>
                                                                  </c:forEach>
                                                      </div>
                                                </div>
                                          </div>
                                    </div>
                              </div>
                  </body>

                  </html>