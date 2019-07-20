<!doctype html>
<html>
<head>
<title>Airline Reservation</title>
 <link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>
 <%@include file="genric_templates/include.jsp"%>
 <%@include file="genric_templates/header.jsp"%>

<div id="container">
	 <%@include file="genric_templates/head_nav.jsp"%>
	 <div id="body">
	 <%@include file="genric_templates/sidebar.jsp"%>
	 <section id="content">	
	 
<%

int count = 0;

MongoClient mongo;

mongo = new MongoClient("localhost", 27017);


try{

	String searchField = "airline";
	
	String searchParameter = "";
	if (request.getParameter("American1") != null){
	searchParameter = "American1";
	}else if (request.getParameter("American2") != null){
	searchParameter = "American2";
	}else if (request.getParameter("BritishAirways1") != null){
	searchParameter = "BritishAirways1";
	}else if (request.getParameter("BritishAirways2") != null){
	searchParameter = "BritishAirways2";
	}else if (request.getParameter("Southwest1") != null){
	searchParameter = "Southwest1";
	}else if (request.getParameter("Southwest2") != null){
	searchParameter = "Southwest2";
	}
	
	DB db = mongo.getDB("csp_project");
	
	DBCollection myReviews = db.getCollection("myReviews");
	
	BasicDBObject searchQuery = new BasicDBObject();
	searchQuery.put(searchField, searchParameter);

	DBCursor cursor = myReviews.find(searchQuery);
	
				
	%>
	
    <br>
    <center><h1> Reviews For: <%=  searchParameter%></h1></center>
				
	<% 
	if(cursor.count() == 0){%>
		<center><h1>There are no reviews for this product</h1></center>
	<% }else{ %>
	
		<table class = "query-table">
		
	<%  String productName = "";
		String productCategory = "";
		String productPrice = "";
		String retailerName = "";
		String retailerZip = "";
		String retailerCity = "";
		String retailerState = "";
		String productOnsale = "";
		String manufacturerName = "";
		String manufacturerRebate = "";
		String userId = "";
		String userAge = "";
		String userGender = "";
		String userOccupation = "";
		String userName = "";
		String reviewRating = "";
		String reviewDate =  "";
		String reviewText = "";
			
		while (cursor.hasNext()) {
			BasicDBObject obj = (BasicDBObject) cursor.next();	 %>			
			
				<% count++;%>
			
			<h3>Review: <span><%= count%></span><h3>
		
			<tr>
			<td style="text-align:center;"> Flight Name: </td>
			<% productName = obj.getString("airline");%>
			<td style="text-align:center;"><%= productName%></td>
			</tr>
			
			<tr>
			<td style="text-align:center;"> User ID: </td>
			<% userId = obj.getString("userId");%>
			<td style="text-align:center;"><%= userId%></td>
			</tr>
			
			<tr>
			<td style="text-align:center;"> User Age: </td>
			<% userAge = obj.getString("userAge");%>
			<td style="text-align:center;"><%= userAge%></td>
			</tr>
			
			<tr>
			<td style="text-align:center;"> User Gender: </td>
			<% userGender = obj.getString("userGender");%>
			<td style="text-align:center;"><%= userGender%></td>
			</tr>
			
			<tr>
			<td style="text-align:center;"> User Occupation: </td>
			<% userOccupation = obj.getString("userOccupation");%>
			<td style="text-align:center;"><%= userOccupation%></td>
			</tr>
			
			<tr>
			<td style="text-align:center;"> User Name: </td>
			<% userName = obj.getString("userName");%>
			<td style="text-align:center;"><%= userName%></td>
			</tr>
			
			<tr>
			<td style="text-align:center;"> Review Rating: </td>
			<% reviewRating = obj.getString("reviewRating").toString();%>
			<td style="text-align:center;"><%= reviewRating%></td>
			</tr>
			
			<tr>
			<td style="text-align:center;"> Review Date: </td>
			<% reviewDate = obj.getString("reviewDate");%>
			<td style="text-align:center;"><%= reviewDate%></td>
			</tr>
			
			<tr>
			<td style="text-align:center;"> Review Text: </td>
			<% reviewText = obj.getString("reviewText");%>
			<td style="text-align:center;"><%= reviewText%></td>
			</tr>
			
		<% }
	}	%>
		</table>
		</section>
		</div>
			<div>
		  		<%@include file="genric_templates/footer.jsp"%>
		  	</div>
		  </div>
		
	
<% } catch (MongoException e) {
		e.printStackTrace();
} %>

</body>
</html>