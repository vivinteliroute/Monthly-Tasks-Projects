<!doctype html>
<html>

<head>
	<title>Airline Reservation</title>
	 <script type="text/javascript" src="javascript.js"></script>
	<link rel="stylesheet" href="styles.css" type="text/css" />
	
</head>

<body onload="init()"> 
<%@include file="genric_templates/include.jsp"%>
<%

HttpSession reqhttpssession = request.getSession();

String source = request.getParameter("source");
String destination = request.getParameter("destination");
String fromdate = request.getParameter("fromdate");
String todate = request.getParameter("todate");
String adult = request.getParameter("adult");
String children = request.getParameter("children");
String trip = request.getParameter("trip");

reqhttpssession.setAttribute("source", source);
reqhttpssession.setAttribute("destination", destination);
reqhttpssession.setAttribute("fromdate", fromdate);
reqhttpssession.setAttribute("todate", todate);
reqhttpssession.setAttribute("adult", adult);
reqhttpssession.setAttribute("children", children);
reqhttpssession.setAttribute("trip", trip);

%>
<div id="container">
<%@include file="genric_templates/header.jsp"%>
    <%@include file="genric_templates/head_nav.jsp"%>
   
    
	<img class="header-image" src="images/banner.jpg" width = "100%" height = "100%" alt="Southwest Banner" />
    <div id="body">		

	<section id="content">

	    <article>

			<h2>Available Airlines</h2>
			
            <p>Following are the flights available for your ticket purchase.</p>	
            
            <p>Click on a flight to purchase or write a review or check for reviews.</p>
            

		</article>
	
		<article class="expanded">

            <center><h2> <%=source %> - <%=destination %></h2></center>
			<br>
			<h4>American Airlines</h4>
			<img class="flight" src = "images/img_american.jpg" width = "200" height = "200" alt = "American_Airlines_Logo">
			<br>
			<center>
				<p> 9.00 - 12.00  </p>
			</center>
			<div style="text-align:center;">
				<form class = "submit-button" method = "post" action = "ProductPurchase.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "American1" value = "Book">
					<input type = "hidden" name = "prdname" value = "American1"> 
					<input type = "hidden" name = "depttime" value = "9.00">
					<input type = "hidden" name = "arrtime" value = "12.00">
				</form>
				<form class = "submit-button" method = "post" action = "ViewReviews.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "American1" value = "View Reviews">
				</form>
				<form class = "submit-button" method = "post" action = "WriteReview.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "American1" value = "Write Review">
				</form>
			</div>	
			<br>
			<hr>
			<br>
			<h4>American Airlines</h4>
			<img class="flight" src = "images/img_american.jpg" width = "200" height = "200" alt = "American_Airlines_Logo">
			<br>
			<center>
				<p> 5.00 - 19.55  </p>
			</center>
			<div style="text-align:center;">
				<form class = "submit-button" method = "post" action = "ProductPurchase.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "American2" value = "Book">
					 <input type = "hidden" name = "prdname" value = "American2"> 
					 <input type = "hidden" name = "depttime" value = "5.00">
					 <input type = "hidden" name = "arrtime" value = "19.55">
					 
				</form>
				<form class = "submit-button" method = "post" action = "ViewReviews.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "American2" value = "View Reviews">
				</form>
				<form class = "submit-button" method = "post" action = "WriteReview.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = American2 value = "Write Review">
				</form>
			</div>
			<br>
			<hr>
			<br>
			<h4>British Airways</h4>
			<img class="flight" src = "images/img-british.jpg" width = "200" height = "200" alt = "British_Airways_Logo">
			<br>
			<center>		
					<p> 7.00 - 17.15  </p>
			</center>
			<div style="text-align:center;">
				<form class = "submit-button" method = "post" action = "ProductPurchase.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "BritishAirways1" value = "Book">
					 <input type = "hidden" name = "prdname" value = "BritishAirways1"> 
					 <input type = "hidden" name = "depttime" value = "7.00">
					 <input type = "hidden" name = "arrtime" value = "17.15">
				</form>
				<form class = "submit-button" method = "post" action = "ViewReviews.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "BritishAirways1" value = "View Reviews">
				</form>
				<form class = "submit-button" method = "post" action = "WriteReview.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "BritishAirways1" value = "Write Review">
				</form>
			</div>
			<br>
			<hr>
			<br>
			<h4>British Airways</h4>
			<img class="flight" src = "images/img-british.jpg" width = "200" height = "200" alt = "British_Airways_Logo">
			<br>
			<center>		
				<p> 17.00 - 7.05  </p>
			</center>
			<div style="text-align:center;">
				<form class = "submit-button" method = "post" action = "ProductPurchase.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "BritishAirways2" value = "Book">
					 <input type = "hidden" name = "prdname" value = "BritishAirways2">
					 <input type = "hidden" name = "depttime" value = "17.00">
					 <input type = "hidden" name = "arrtime" value = "7.05">
				</form>
				<form class = "submit-button" method = "post" action = "ViewReviews.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "BritishAirways2" value = "View Reviews">
				</form>
				<form class = "submit-button" method = "post" action = "WriteReview.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = BritishAirways2 value = "Write Review">
				</form>
			</div>
			<br>
			<hr>
			<br>
			<h4>Southwest Airlines</h4>
			<img class="flight" src = "images/img_southwest.jpeg" width = "200" height = "200" alt = "Southwest_Logo">
			<br>
			<center>		
				<p> 10.00 - 12.00  </p>
			</center>
			<div style="text-align:center;">
				<form class = "submit-button" method = "post" action = "ProductPurchase.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "Southwest1" value = "Book">
					<input type = "hidden" name = "prdname" value = "Southwest1"> 
					<input type = "hidden" name = "depttime" value = "10.00">
					<input type = "hidden" name = "arrtime" value = "12.00">
				</form>
				<form class = "submit-button" method = "post" action = "ViewReviews.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "Southwest1" value = "View Reviews">
				</form>
				<form class = "submit-button" method = "post" action = "WriteReview.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "Southwest1" value = "Write Review">
				</form>
			</div>
			<br>
			<hr>
			<br>
			<h4>Southwest Airlines</h4>
			<img class="flight" src = "images/img_southwest.jpeg" width = "200" height = "200" alt = "Southwest_Logo">
			<br>
			<center>		
				<p> 7.00 - 22.30 </p>
			</center>
			<div style="text-align:center;">
				<form class = "submit-button" method = "post" action = "ProductPurchase.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "Southwest2" value = "Book">
					<input type = "hidden" name = "prdname" value = "Southwest2">
					<input type = "hidden" name = "depttime" value = "7.00"> 
					<input type = "hidden" name = "arrtime" value = "22.30"> 
				</form>
				<form class = "submit-button" method = "post" action = "ViewReviews.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "Southwest2" value = "View Reviews">
				</form>
				<form class = "submit-button" method = "post" action = "WriteReview.jsp">
					<input class = "blue-btn submit-button" type = "submit" name = "Southwest2" value = "Write Review">
				</form>
			</div>
			
		</article>
    </section>
        
    <%@include file="genric_templates/sidebar.jsp"%>
    
	   <%@include file="genric_templates/footer.jsp"%> 
</div>
</div>
</body>

</html>