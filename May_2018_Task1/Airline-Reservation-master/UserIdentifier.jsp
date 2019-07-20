<!doctype html>
<html>
<head>
<title>Airline Reservation</title>
</head>
<body>

    <%@include file="genric_templates/include.jsp"%>

<%

HttpSession reqhttpssession = request.getSession();
String userdeci = request.getParameter("userdeci");
reqhttpssession.setAttribute("uid", userdeci);

HashMap<String, String> cost = new HashMap<String, String>();
cost.put("American1", "350");
cost.put("American2", "224");
cost.put("BritishAirways1", "980");
cost.put("BritishAirways2", "520");
cost.put("Southwest1", "1320");
cost.put("Southwest2", "1500");
HashMap<String, String> quantity = new HashMap<String, String>();
quantity.put("American1", "0");
quantity.put("American2", "0");
quantity.put("BritishAirways1", "0");
quantity.put("BritishAirways2", "0");
quantity.put("Southwest1", "0");
quantity.put("Southwest2", "0");

ArrayList<HashMap<String, String>> dlist = new ArrayList<HashMap<String, String>>();

dlist.add(cost);
dlist.add(quantity);

reqhttpssession.setAttribute("products", dlist);

if (userdeci.equals("Customer")) {
	RequestDispatcher rd = request
			.getRequestDispatcher("Login.jsp");
	rd.forward(request, response);

} else if(userdeci.equals("Agent"))
{									
	RequestDispatcher rd = request.getRequestDispatcher("Agent.jsp");
	rd.forward(request, response);
}


%>
<%@include file="genric_templates/footer.jsp"%>

</body>
</html>