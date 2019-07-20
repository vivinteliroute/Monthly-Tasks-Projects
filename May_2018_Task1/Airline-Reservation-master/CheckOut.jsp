<!doctype html>
<html>
<head>
<title>Airline Reservation</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>

<div id="container">
 <%@include file="genric_templates/header.jsp"%>
 <%@include file="genric_templates/head_nav.jsp"%>
 <%@include file="genric_templates/sidebar.jsp"%>
 <br>   
	<section id="content">
<%@include file="genric_templates/include.jsp"%>
							
<form class="user-form" method="get" action="Final.jsp">
<h1>Place Order</h1>
<fieldset>
<legend>  Personal information </legend>
<table style="border:0;">
<tr>
<td> First name: </td>
<td> <input type="text" name="firstName"> </td>
</tr>				
<tr>
<td> Last name: </td>
<td> <input type="text" name="lastName"> </td>
</tr>	
<tr>
<td> Card Number: </td>
<td> <input type="number" name="cardnumber"> </td>
</tr>
<tr>
<td> CVV: </td>
<td> <input type="number" name="cvv"> </td>
</tr>
<tr>
<td> Address: </td>
<td> <input type="text" name="address"> </td>
</tr>
<tr>
<td> Phone: </td>
<td> <input type="text" name="phoneNumber"> </td>
</tr>
</table>
<br>
<center>
<input style="padding:8px;" class="blue-btn" type="submit" value="Place Order">			
</center>
</fieldset>		
</form>	
   </section>
    
  <%@include file="genric_templates/footer.jsp"%> 

</div>


</body>
</html>