<!doctype html>
<html>

<head>
	<title>British Airways</title>
	 <script type="text/javascript" src="javascript.js"></script>
	<link rel="stylesheet" href="styles.css" type="text/css" />
</head>


<body onload="init()">
<div id="container">
<%@include file="genric_templates/header.jsp"%>
    <%@include file="genric_templates/head_nav.jsp"%>
    <%@include file="genric_templates/include.jsp"%>
    
	<img class="header-image" src="images/british-airways.jpg" width = "100%" height = "100%" alt="American Airlines Banner" />
    <div id="body">		

	<section id="content">

	    <article>
	    <%
	    
	    HttpSession reqhttpssession = request.getSession();
	    
	   String source = (String)reqhttpssession.getAttribute("source");
	   
	    
	    
	    %>
	    
	<h1><%=source %></h1>
			<h2>British Airways</h2>
			
            <p>International travel made easier and your trust partner for your travel needs.</p>	
            
            <p>Click on a flight to purchase or write a review or check for reviews.</p>

		</article>
	
		<article class="expanded">

            <h2>Flights available in British Airways</h2>
			 
			<br>
			<img class="flight" src = "images/img-british.jpg" width = "200" height = "200" alt = "British_Airways_Logo">
			<br>
			<center>
					<p> 7.00am - 5.15pm (22hrs 45mins) </p>
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
			<img class="flight" src = "images/img-british.jpg" width = "200" height = "200" alt = "British_Airways_Logo">
			<br>
			<center>		
				<p> 5.00pm - 7.05am (26hrs 5mins) </p>
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
			 
		</article>
    </section>
        
    <%@include file="genric_templates/sidebar.jsp"%>
    
	   <%@include file="genric_templates/footer.jsp"%> 
</div>
</div>
</body>

</html>