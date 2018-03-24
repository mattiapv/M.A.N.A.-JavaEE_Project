<%-- 
    Document   : checkout
    Created on : 12-ago-2017, 15.06.29
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
   <html>
      <head>
         <title>Dettagli Pagamento</title>
         <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
         <link rel="stylesheet" type="text/css" href="./css/checkout.css">
      <body>
         <%@ include file="menu.jsp" %>
         <div class="container">
            <div class="centered title"><h1>Dettagli Pagamento</h1>
               <br>
               <img src="./data/img/creditCards.png">
            </div>
         </div>
         <hr class="featurette-divider"></hr>
         <div class="container">
            <div class="row">
               <div class="col-sm-6">
                  <div class="tab-content">
                     <div id="stripe" class="tab-pane fade in active">
                        <form action="Checkout" method="Post">
                           <br>
                           <div class='form-row'>
                              <div class='form-group required'>
                                 <label class='control-label'>Intestatario Carta</label>
                                 <input class='form-control' placeholder="Nome Cognome"  type='text'name="name">
                              </div>

                           </div>
                           <div class='form-row'>
                              <div class='form-group card required'>
                                 <label class='control-label'>Numero Carta</label>
                                 <input autocomplete='off'placeholder="XXXX-XXXX-XXXX-XXXX-XXXX" class='form-control card-number'  type='text'name="cardNumber">
                              </div>
                           </div>
                           <div class='form-row'>
                              <div class='form-group cvc required'>
                                 <label class='control-label'>CVC</label>
                                 <input autocomplete='off' placeholder="CVC" class='form-control card-cvc'  type='text'name="CVC">
                              </div>
                              <div class='form-row'>
                                 <div class='form-group card required'>
                                    <label class='control-label'>Indirizzo di fatturazione</label>
                                    <input autocomplete='off' class='form-control' type='text' name="address">
                                 </div>
                              </div>
                              <div class='form-group expiration required'>
                                 <label class='control-label'>Mese di scadenza</label>
                                 <select class="form-control" name="expiryMonth" id="expiry-month">
                                    <option>Mese</option>
                                    <option value="1">Gennnaio (01)</option>
                                    <option value="2">Febbraio (02)</option>
                                    <option value="3">Marzo (03)</option>
                                    <option value="4">Aprile (04)</option>
                                    <option value="5">Maggio (05)</option>
                                    <option value="6">Giugno (06)</option>
                                    <option value="7">Luglio (07)</option>
                                    <option value="8">Agosto (08)</option>
                                    <option value="9">Settembre (09)</option>
                                    <option value="10">Ottobre (10)</option>
                                    <option value="11">Novembre (11)</option>
                                    <option value="12">Dicembre (12)</option>
                                 </select>

                              </div>
                              <div class='form-group expiration required'>
                                 <label class='control-label'>Anno di scadenza</label>
                                 <select class="form-control" name="expiryYear">
                                    <option value="Anno">Anno</option>
                                    <option value="17">2017</option>
                                    <option value="18">2018</option>
                                    <option value="19">2019</option>
                                    <option value="20">2020</option>
                                    <option value="21">2021</option>
                                    <option value="22">2022</option>
                                    <option value="23">2023</option>
                                    <option value="24">2023</option>
                                 </select>
                              </div>
                           </div>


                           <div class='form-row'>
                              <div class='form-group'>
                                 <label class='control-label'></label>

                                 <button class='form-control btn btn-primary' type='submit'> Paga </button>



                              </div>
                           </div>    
                        </form> 
                     </div>

                     <div id="paypal" class="tab-pane fade">
                        <form action="?" id="paypalForm" method="POST">
                           
                           <center><img src="./data/img/shopicon.jpg" alt="negozio"></center>
                           <br><br><br>
                           <button class='form-control btn btn-primary submit-button' type='submit'> Ritiro in Negozio </button>
                        </form>
                     </div>
                  </div>



               </div>   

               <div class="col-sm-6">
                  <label class='control-label'></label><!-- spacing -->
                  <br>
                  <br>
                  <div class="btn-group-vertical btn-block">
                     <a class="btn btn-default" style="text-align: left;" data-toggle="tab" href="#stripe">Carta di credito</a>
                     <a class="btn btn-default" style="text-align: left;" data-toggle="tab" href="#paypal">Ritiro in negozio</a>
                  </div>

                  <br><br><br>

                  <div class="jumbotron jumbotron-flat">
                     <div class="center"><h2><i>Totale: </i></h2></div>
                     <div class="paymentAmt"><fmt:formatNumber type = "number" maxFractionDigits = "2" pattern="0.00" value = "${total}" ></fmt:formatNumber> &#8364</div>



                  </div>



                  <br><br><br>
               </div>



            </div>



         </div>
      </div>


   </form>

</body>
</html>

