<!doctype html>
<html>
<head>
<title>Airline Reservation</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>
 <div id="container">
  <%@include file="genric_templates/header.jsp"%>
 <%@include file="genric_templates/head_nav.jsp"%>
 <%@include file="genric_templates/include.jsp"%>
 <%@include file="genric_templates/sidebar.jsp"%> 
 <br>
 <section id="content">

<%
HttpSession reqhttpssession = request.getSession();
BasicDBObject datastore = new BasicDBObject();

MongoClient dbconnect = new MongoClient("localhost", 27017);

DB db = dbconnect.getDB("csp_project");

String source = (String)reqhttpssession.getAttribute("source");
String destination = (String)reqhttpssession.getAttribute("destination");
String fromdate = (String)reqhttpssession.getAttribute("fromdate");
String todate = (String)reqhttpssession.getAttribute("todate");
String adult = (String)reqhttpssession.getAttribute("adult");
String children = (String)reqhttpssession.getAttribute("children");
String trip = (String)reqhttpssession.getAttribute("trip");
String user = (String)reqhttpssession.getAttribute("user");
String depttime = (String)reqhttpssession.getAttribute("depttime");
String arrtime = (String)reqhttpssession.getAttribute("fromdate");
String prdname = (String)reqhttpssession.getAttribute("prdname");

int adult_count = Integer.parseInt((String)reqhttpssession.getAttribute("adult"));
int children_count = Integer.parseInt((String)reqhttpssession.getAttribute("children"));



int total = adult_count+children_count;


DBCollection orderDetails_Tbl = db.getCollection("orderDetails");


HashMap<String, String> confirmnum = new HashMap<String,String>();

BasicDBObject dataset = new BasicDBObject();
		
	datastore.append("source", source);
	datastore.append("destination", destination);
	datastore.append("fromdate", fromdate);
	datastore.append("todate", todate);
	datastore.append("adult", adult);
	datastore.append("children", children);
	datastore.append("trip", trip);
	datastore.append("user", user);
	datastore.append("depttime", depttime);
	datastore.append("arrtime", arrtime);
	datastore.append("prdname", prdname);
	datastore.append("quantity", total);
	
	
	orderDetails_Tbl.insert(datastore);
	datastore.clear();					
	
	dataset.put("user", reqhttpssession.getAttribute("user"));
	DBCursor datafind = orderDetails_Tbl.find(dataset);
	
	DBObject currentDBObject = datafind.next();
	confirmnum.put(source,currentDBObject.get("_id").toString()); 
	
	

 %>
				
<div class="user-form">
<h3 >Ticket Successfully Placed</h3>
<h3>Confirmation no:  <%
for (Map.Entry<String, String> strdata : confirmnum.entrySet()) {%> 
	  <%=strdata.getValue()%>   
	<%} 

%></h3>

</div>
    </section>    
      <%@include file="genric_templates/footer.jsp"%> 
      
      </div>

</body>
</html>