<!doctype html>
<html>
<head>
<title>Airline Reservation</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>

 <%@include file="genric_templates/include.jsp"%>
 
 
 <div id="container">
			  <%@include file="genric_templates/header.jsp"%> 
			 <%@include file="genric_templates/head_nav.jsp"%>
			<div id="body">
			<section id="content">

<% 

MongoClient mongo;

mongo = new MongoClient("localhost", 27017);

String pageHeading = "Submit Review";
String pageContent =" ";
String myPage = " ";
String tableData = " ";

int count = 0;

response.setContentType("text/html");

try {
	
	String airline = request.getParameter("airline");
	
	String userID = request.getParameter("userID");
	int userAge = Integer.parseInt(request.getParameter("userAge"));
	String userGender = request.getParameter("userGender");
	String userOccupation = request.getParameter("userOccupation");
	
	int reviewRating = Integer.parseInt(request.getParameter("reviewRating"));
	String reviewDate = request.getParameter("reviewDate");
	String reviewText = request.getParameter("reviewText");
	
	DB db = mongo.getDB("csp_project");
	
	DBCollection myReviews = db.getCollection("myReviews");

	BasicDBObject doc = new BasicDBObject("title", "MongoDB")
			.append("airline", airline)
			.append("userID", userID)
			.append("userAge", userAge)
			.append("userGender", userGender)
			.append("userOccupation", userOccupation)
			.append("reviewRating", reviewRating)
			.append("reviewDate", reviewDate)
			.append("reviewText", reviewText);

	myReviews.insert(doc);

 	%>
 			<br>
 			<br>
			<div class="user-form">
				<h2 style="color:#DE2D3A;font-weight:700;">Review Submitted</h2>
				<form action="MainItems.jsp" method="post">
					<button style="padding:10px;" class="blue-btn">Book Another Ticket?</button>
				</form>
			</div>
			</section>
			 <%@include file="genric_templates/sidebar.jsp"%>
            <%@include file="genric_templates/footer.jsp"%>
			</div>

	

 <% } catch (MongoException e) {
	e.printStackTrace();
}

%>

</div>

</body>
</html>