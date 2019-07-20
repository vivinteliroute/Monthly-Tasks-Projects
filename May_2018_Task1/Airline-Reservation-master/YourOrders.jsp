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
 <%@include file="genric_templates/include.jsp"%>
 
 
 <section id="content">
<article>
 
<%

MongoClient mongo = new MongoClient("localhost", 27017);

DB db = mongo.getDB("csp_project");
		
DBCollection orderDetails_Tbl = db.getCollection("orderDetails");
BasicDBObject searchQuery = new BasicDBObject();
HttpSession reqhttpsession = request.getSession();
searchQuery.put("user", reqhttpsession.getAttribute("user"));		

DBCursor cursor = orderDetails_Tbl.find(searchQuery);	

if(cursor.count()!=0)
{  %>
			<table >
			<tr style = " border: 1px solid;text-align:center;">
			<th style = " border: 1px solid;text-align:center;">Confirmation Number</th>
			<th style = " border: 1px solid;text-align:center;">Flight</th>
			
			<th style = " border: 1px solid;text-align:center;">Quantity</th>
			
			<th style = " border: 1px solid;text-align:center;">Departure Date</th>
			<th style = " border: 1px solid;text-align:center;">Departure Time</th>
			<th style = " border: 1px solid;text-align:center;">Delete</th>
			</tr>
	
	
<%	while(cursor.hasNext()){	
		DBObject dbdata = cursor.next();
		/* Float productPrice = Float.parseFloat((dbdata.get("price").toString())) / Float.parseFloat(dbdata.get("quantity").toString()); */ %>
		<tr style = " border: 1px solid;">
		<td style = " border: 1px solid;"><%= dbdata.get("_id") %></td>	
		<td style = " border: 1px solid;"><%= dbdata.get("prodName")%></td>
		<td style =" border: 1px solid;"><%= dbdata.get("quantity")  %></td>
		<td style =" border: 1px solid;"><%= dbdata.get("fromdate")  %></td>
		<td style =" border: 1px solid;"><%= dbdata.get("depttime")  %></td>
		<td style = " border: 1px solid;">
		<form action="CancelOrder.jsp" method="post">
		<input type ="hidden" name = "confirmation" value = " <%= dbdata.get("_id") %>">
		<input type="hidden" value="<%= dbdata.get("deliveryDate")%>" name="deliverydate">
		<button>Cancel</button>
		</form>
		</form>
		</td>
		</tr>
	<% } %>
	</table>
<% }


else if (cursor.count() == 0){%>
	<h1>You have no orders</h1>	
<% } %>	
 
 </article>
    </section>
    
      
      <%@include file="genric_templates/footer.jsp"%> 
      
      </div>


</body>
</html>