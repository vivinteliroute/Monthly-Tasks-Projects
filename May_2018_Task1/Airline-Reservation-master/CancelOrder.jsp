<!doctype html>
<html>
<head>
<title>Game Speed</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>
 <div id="container">
  <%@include file="genric_templates/header.jsp"%>
 <%@include file="genric_templates/head_nav.jsp"%>
 <%@include file="genric_templates/include.jsp"%>
 
  <section id="content">
<article>

<%

String confirmation = request.getParameter("confirmation").trim();

MongoClient dbconnect = new MongoClient("localhost", 27017);

DB db = dbconnect.getDB("csp_project");


	
	BasicDBObject ordercancel = new BasicDBObject();
	ordercancel.put("_id", new ObjectId(confirmation));

	DBCollection orderDetails_Tbl = db.getCollection("orderDetails");
	orderDetails_Tbl.remove(ordercancel);		

	RequestDispatcher nextpage = request.getRequestDispatcher("YourOrders.jsp");
	nextpage.forward(request, response);
	
%>

 </article>
    </section>
    
     <%@include file="genric_templates/sidebar.jsp"%>     
      <%@include file="genric_templates/footer.jsp"%> 

</div>
</body>
</html>