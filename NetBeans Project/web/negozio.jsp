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
                <title>${shop.name}</title>
            </head>

            <body>
                <%@ include file="menu.jsp" %>

                    <div class="container-fluid">
                        <div class="content-wrapper">
                            <div class="item-container">
                                <div class="container">
                                    <div class="col-md-12">
                                        <br>
                                        <h2 align="center">${currentShop.name}</h2>
                                        <br>
                                        <h4>Descrizione</h4>
                                        <div> ${currentShop.description}</div>
                                        <hr>
                                        <h4>Link</h4>
                                        <div>
                                            <a href="${currentShop.web_Site_Url}">${currentShop.web_Site_Url}</a>
                                        </div>
                                        <hr>
                                        <h4>Indirizzo</h4>
                                        <div> ${currentShop.address}</div>
                                        <br>
                                        <div>
                                            <a href="https://www.google.com/maps/place/${currentShop.name},+${currentShop.address}/">
                                                <img src="https://maps.googleapis.com/maps/api/staticmap?center=${currentShop.name},+${currentShop.address}&zoom=17&scale=1&size=900x350&maptype=roadmap&key=GOOGLEAPIKEY&format=png&visual_refresh=true&markers=size:mid%7Ccolor:0x47a1fb%7Clabel:1%7C${currentShop.name},+${currentShop.address}"
                                                    alt="Google Map of ${currentShop.name}, ${currentShop.address}">
                                            </a>
                                        </div>
                                        <hr>
                                        <h4>Valutazione</h4>
                                        <c:set var="star" value="0" scope="page" />
                                        <div>
                                            <c:forEach begin="1" end="${currentShop.rate}">
                                                <i class="glyphicon glyphicon-star"></i>
                                                <c:set var="star" value="${star + 1}" /></c:forEach>
                                            <c:forEach begin="1" end="${5-star}">
                                                <i class="glyphicon glyphicon-star-empty"></i>
                                            </c:forEach>
                                        </div>
                                        <hr>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </body>

            </html>