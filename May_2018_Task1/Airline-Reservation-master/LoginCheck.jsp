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
MongoClient dbconnect = new MongoClient("localhost", 27017);

DB db = dbconnect.getDB("local");
String salesMan = null;

DBCollection uidlist = db.getCollection("UserLoginCredentials");

String user = request.getParameter("user");
String password = request.getParameter("password");

BasicDBObject dbdata = new BasicDBObject();
dbdata.put("user", user);
dbdata.put("password", password);	

if(password == null){
	dbdata.clear();
	user = request.getParameter("name");
	dbdata.put("user", user);
}

DBCursor dbdatafind = uidlist.find(dbdata);		

if (dbdatafind.count() == 0){	%>		
	<center><h1 style="color:red;">Invalid Credentials</h1></center>
	<h1 style = "text-align:center">Create Account ?  
	<a  style ="text-align:center" href="NewUser.jsp" >Click Here</a></h1>
	<a href="Login.jsp" style ="margin-left:43%;font-size:40px ">Try Again</a>
<%
}
else{
	HttpSession reqhttpsession = request.getSession();
	reqhttpsession.setAttribute("user", user);										
				
	RequestDispatcher nextpage = request.getRequestDispatcher("MainItems.jsp");
	nextpage.forward(request, response);
}		
		
dbconnect.close();

%>
	<img class="header-image" src="images/skyline.png" width = "100%" height = "100%" alt="Airline Skyline" />
	<div>
 		<%@include file="genric_templates/footer.jsp"%>
	</div>
	
</div>

</body>
</html>