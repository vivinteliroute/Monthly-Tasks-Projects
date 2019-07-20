<!doctype html>
<html>
<head>
<title>Airline Reservation</title>
<link rel="stylesheet" href="styles.css" type="text/css" /></head>
<body>

<div id="container">
    <%@include file="genric_templates/header.jsp"%>
	<div class="user-form">   
	<h2>Already have an account!</h2><h2>Wish to Login?</h2>
	<br>
	<form action="LoginCheck.jsp" method="post"">
		<input class="login-form" type="text" name="user" placeholder="Username">
		<br>
		<br>
		<input class="login-form" type="password" name="password" placeholder="Password">
		<br>
		<br>
		<button class="login">Login</button>	
	</form>
	<br>
	<br>
	<br>
	<h2>Want to create a new account?</h2>
	<form action="NewUser.jsp" method="post">
		<button class="signup">Create Account</button>
	</form>
	</div>
	<br>
	<br>
	<div>
		<%@include file="genric_templates/footer.jsp"%>
	</div>
</div>	
</body>
</html>