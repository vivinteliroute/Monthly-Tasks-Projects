<!DOCTYPE html>
<html>
<head>
<title>Airline Reservation</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>

<div id="container">
   <%@include file="genric_templates/header.jsp"%>
   
	<div class="user-form">
		<h1>Create Account</h1>

		<form action="SuccessSignUp.jsp" method="post">
			<input class="login-form" type="text" name="user" value ="" placeholder="username">
			<br><br> 
		 	<input class="login-form" type="password" name="password" value = "" placeholder="password">
		 	<br><br>
		<button class="login">Create Account</button>
		<br>
		<br>
		</form>
		<form action="Login.jsp" method="post">
			<button class="cancel-btn">Cancel and Go Back</button>
		</form>
	</div>
	<div>
	 <%@include file="genric_templates/footer.jsp"%>
	</div>
</div>

	


</body>
</html>