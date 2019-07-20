<!doctype html>
<html>
<head>
<title>Airline Reservation </title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>
<div id="container">
    <%@include file="genric_templates/header.jsp"%>
    
	<div id="body">		
	<div class="user-form">
		<h2>Welcome!</h2><h2> How would you wish to Login?</h2>
		<form action="UserIdentifier.jsp" method="post">
			<div style="display:inline;">
				<input class="role-btn" type="submit" name = "userdeci" value = "Customer">
			</div>
			<div style="display:inline;">
				<input class="role-btn" type="submit" name = "userdeci" value = "Agent">
			</div>
		</form> 
	</div>
	<img class="header-image" src="images/skyline.png" width = "100%" height = "100%" alt="Airline Skyline" />
    
	 <%@include file="genric_templates/footer.jsp"%>
	</div> 
</div> 
</body>
</html>