<!doctype html>
<html>
<head>
<title>American Airlines</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>

<div id="container">
<%@include file="genric_templates/header.jsp"%>
<div class="user-form">
<form action = "LoginCheck.jsp" method = "post">
<h2>Wish to Login with the existing Customer ID?</h2>
<br>
<input class="login-form" type = "text" name = "name" placeholder=" Custermer ID">
<input type = "hidden" name = "saleman" value = "SalesMan">
<br>
<br>
<button class="login">Submit</button>
</form>
<br>
<form action="index.jsp" method="post">
	<button class="cancel-btn">Cancel and Go Back</button>
</form>
</div>
<img class="header-image" src="images/skyline.png" width = "100%" height = "100%" alt="Airline Skyline" />
<div>
<%@include file="genric_templates/footer.jsp"%>
</div>
</div>



</body>
</html>