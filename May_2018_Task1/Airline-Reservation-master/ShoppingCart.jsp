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
 <%@include file="genric_templates/include.jsp"%>

<section id="content">
<%

HttpSession reqhttpsession = request.getSession();

ArrayList<String> cartlist = (ArrayList<String>)reqhttpsession.getAttribute("productsuccess");

if(cartlist != null){

HashSet<String> hs = new HashSet<String>();
hs.addAll(cartlist);
cartlist.clear();
cartlist.addAll(hs);  

%>
<br>
 <h2 style="text-align:center;">  </h2>
 		<br>
		<table >
		<tr style = " border: 1px solid;text-align:center;">
		<th style = " border: 1px solid;text-align:center;">Flight</th>			
		<th style = " border: 1px solid;text-align:center;">Price</th>
		<th style = " border: 1px solid;text-align:center;">Quantity</th>
		<th style = " border: 1px solid;text-align:center;">Total Price</th>
		<th style = " border: 1px solid;text-align:center;">Delete Order</th>
		</tr>

<% 
ArrayList<HashMap<String, String>> itemDetails = (ArrayList<HashMap<String, String>>)reqhttpsession.getAttribute("products");

HashMap<String,String> cost;
HashMap<String,String> quantity;

cost = itemDetails.get(0);
quantity = itemDetails.get(1);

int adult = Integer.parseInt((String)reqhttpsession.getAttribute("adult"));
int children = Integer.parseInt((String)reqhttpsession.getAttribute("children"));



int total = adult+children;

for(String item : cartlist){
	item = item.trim();	
	%>
	<tr>				
	<td style = " border: 1px solid ;text-align:center;"><%= item %></td>
	<td style =" border: 1px solid ;text-align:center;"><%= cost.get(item)%></td>
	<td style = " border: 1px solid ;text-align:center;">
	<form action="UpdateQuantity.jsp" method="post">
	<input style=" width:20%" type = "text" name = "quantity" value =" <%= total  %> "> 
	<button style=" margin-left:10%; padding:5px;" class="blue-btn"> Update </button>
	<input type ="hidden" name = "prdname" value = " <%= item %>">   			
	</form>
	</td>
	<td style = " border: 1px solid ;text-align:center;"><%= Float.toString((Float.parseFloat(cost.get(item)) * total))%></td>		
	<td style = " border: 1px solid ;text-align:center;">
	<form action="DeleteFromCart.jsp" method="post">
	<input type ="hidden" name = "prdname" value = "<%=  item %>">
	<button style="padding:5px;"class="blue-btn">Delete</button>
	</form>
	</td>
	</tr>
<% }  %>
</table>
<br>
<br>
<form action="CheckOut.jsp" method="post">
<center>
<button class="check-out">Check Out</button>
</center>
</form>
<br>
<% }

else{%>
	<br>
	<br>
	<div class="user-form">
		<h1>No items in the cart</h1>
		<br>
		<form action="MainItems.jsp" method="post">
			<button style="padding:10px;" class="blue-btn">Purchase Ticket</button>
		</form>
	</div>
<% }

%>
    </section>
    <div>
	 <%@include file="genric_templates/footer.jsp"%> 
    </div>
    </div>

</body>
</html>