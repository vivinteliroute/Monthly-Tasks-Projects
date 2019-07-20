<!doctype html>
<html>

<head>
	<title>Southwest Airlines</title>
	 <script type="text/javascript" src="javascript.js"></script>
	<link rel="stylesheet" href="styles.css" type="text/css" />
</head>

<body onload="init()">
<div id="container">
<%@include file="genric_templates/header.jsp"%>
    <%@include file="genric_templates/head_nav.jsp"%>
    
	<img class="header-image" src="images/southwest-airlines.jpg" width = "100%" height = "100%" alt="Southwest Banner" />
    <div id="body">		

	<section id="content">

	    <article>

			<h2>Southwest Airlines</h2>
			
            <p>Southwest makes your journey quick and safe.</p>	
            
            <p>Click on a flight to purchase or write a review or check for reviews.</p>

		</article>
	
		<article class="expanded">

            <h2>Flights available in Southwest Airlines</h2>
			
			<br>
			<img class="flight" src = "images/img_southwest.jpeg" width = "200" height = "200" alt = "Southwest_Logo">
			<br>
			<center>
				<p> 10.00am - 12pm (2hrs) </p>
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
			<img class="flight" src = "images/img_southwest.jpeg" width = "200" height = "200" alt = "Southwest_Logo">
			<br>
			<center>
				<p> 7.00pm - 10.30pm (3hrs 30mins) </p>
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