<!doctype html>
<html>

<head>
	<title>American Airlines</title>
	 <script type="text/javascript" src="javascript.js"></script>
	<link rel="stylesheet" href="styles.css" type="text/css" />
</head>

<body onload="init()">
<div id="container">
<%@include file="genric_templates/header.jsp"%>
    <%@include file="genric_templates/head_nav.jsp"%>
    
	<img class="header-image" src="images/american_airlines.jpg" width = "100%" height = "100%" alt="American Airlines Banner" />
    <div id="body">		

	<section id="content">

	    <article>

			<h2>American Airlines</h2>
			
            <p>International and Domestic travel at your convenience and less price.</p>	
            
            <p>Click on a flight to purchase or write a review or check for reviews.</p>

		</article>
	
		<article class="expanded">

            <h2>Flights available in American Airlines</h2>
			
			<br>
			<img class="flight" src = "images/img_american.jpg" width = "200" height = "200" alt = "American_Airlines_Logo">
			<br>
			<center>
				<p> 9.00am - 8.15pm (11hrs) </p>
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
			<img class="flight" src = "images/img_american.jpg" width = "200" height = "200" alt = "American_Airlines_Logo">
			<br>
			<center>
				<p> 5.00pm - 7.55pm (2hrs 55mins) </p>
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
			
			
		</article>
    </section>
        
    <%@include file="genric_templates/sidebar.jsp"%>
    
	   <%@include file="genric_templates/footer.jsp"%> 
</div>
</div>
</body>

</html>