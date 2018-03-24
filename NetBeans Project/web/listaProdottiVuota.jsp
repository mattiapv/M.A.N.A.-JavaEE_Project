<%-- 
    Document   : listaProdottiVuota
    Created on : 23-ago-2017, 13.59.56
--%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            </div>
                        </div>
                    </div>
                </div>
        </body>

        </html>