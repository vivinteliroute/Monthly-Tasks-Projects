<!doctype html>
<html>
<head>

<title>Airline Reservation</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>
 
<div id="container">
	<%@include file="genric_templates/include.jsp"%>
  <%@include file="genric_templates/header.jsp"%>
<%
String user = request.getParameter("user");
String password = request.getParameter("password");


MongoClient dbconnect = new MongoClient("localhost", 27017);

DB db = dbconnect.getDB("local");

DBCollection uidlist = db.getCollection("UserLoginCredentials");

BasicDBObject newuser = new BasicDBObject();
newuser.append("user", user);
newuser.append("password", password);				

uidlist.insert(newuser);	
%>
<center>
	<h1> Your account has been created Successfully!</h1>
	<br><br>
	<form action="Login.jsp" method="post">
       <input type="submit" value="LOGIN Now" class="formbutton" />
    </form>
    </center>   

<img class="header-image" src="images/skyline.png" width = "100%" height = "100%" alt="Airline Skyline" />

<% dbconnect.close();

%>
	<div>
 		<%@include file="genric_templates/footer.jsp"%>
	</div>
	
</div>


</body>
</html>