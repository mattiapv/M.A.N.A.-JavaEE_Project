<%-- 
    Document   : autocompletamento
    Created on : 6-ago-2017, 20.49.52
--%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>Autocompletamento</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=GOOGLEAPIKEY&sensor=false&libraries=places&language=en"></script>
        <script>
            $(function () {
                var availableTags = [<%@include file = "data\prodotti.txt" %>];

                $("#autocompleteProducts").autocomplete({
                    source: availableTags
                });
            });
        </script>
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <form method="POST" action="LoadProducts">
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="autocompleteProducts">Cerca prodotti</label>
                                    <input id="autocompleteProducts" name="nomeProdotto" class="form-control" placeholder="Tutti">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for=categoria>Categoria</label>
                                    <select class="form-control" name="categoria" id="categoria">
                                        <%@ include file="data/categoria.txt" %>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="autocompleteMaps">Zona Geografica </label>
                                    <input id="autocompleteMaps" placeholder="Tutto il mondo" type="text" name="address" class="form-control" />
                                    <script>
                                        var input = document.getElementById('autocompleteMaps');
                                        var autocomplete = new google.maps.places.Autocomplete(input);
                                    </script>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="prezzo">Prezzo</label>
                                    <select class="form-control" name="price" id="prezzo">

                                        <%@ include file="data/prezzi.txt" %>

                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="rate">Rate</label>
                                    <select class="form-control" name="rate" id="rate">

                                        <%@ include file="data/rate.txt" %>

                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <br>
                                <div class="visible-xs visible-sm">
                                    <center>
                                        <input type="submit" value="Vai" class="btn btn-default btn-lg">
                                    </center>
                                </div>
                                <div class="hidden-xs hidden-sm">
                                    <div class="form-group">
                                        <input type="submit" value="Vai" class="btn btn-default btn-lg">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>

    </html>