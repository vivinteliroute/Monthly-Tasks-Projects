<!doctype html>
<html>
<head>
<title>Airline Reservation</title>
</head>
<body>
 <%@include file="genric_templates/include.jsp"%>

<%

HttpSession reqhttpssession = request.getSession();

String depttime = request.getParameter("depttime");
reqhttpssession.setAttribute("depttime", depttime);

String prdname = request.getParameter("prdname");
reqhttpssession.setAttribute("prdname", prdname);


ArrayList<String> prdbuy = (ArrayList<String>)reqhttpssession.getAttribute("productsuccess");

String prdlist = request.getParameter("prdname");


if(prdbuy != null){
	prdbuy.add(prdlist);
}

else if (prdbuy == null){
	prdbuy = new ArrayList<String>();
	prdbuy.add(prdlist);					
}

reqhttpssession.setAttribute("productsuccess", prdbuy);


if(reqhttpssession.getAttribute("products") == null){			
	
	ArrayList<HashMap<String, String>> hashlist = new ArrayList<HashMap<String, String>>();
	
	HashMap<String, String> cost = new HashMap<String, String>();
	HashMap<String, String> quantity = new HashMap<String, String>();
	
	cost.put("American1", "350");
	cost.put("American2", "224");
	cost.put("BritishAirways1", "980");
	cost.put("BritishAirways2", "520");
	cost.put("Southwest1", "1320");
	cost.put("Southwest2", "1500");
		
	quantity.put("American1", "0");
	quantity.put("American2", "0");
	quantity.put("BritishAirways1", "0");
	quantity.put("BritishAirways2", "0");
	quantity.put("Southwest1", "0");
	quantity.put("Southwest2", "0");
	
	hashlist.add(cost);
	hashlist.add(quantity);

	reqhttpssession.setAttribute("products", hashlist);
			
}		
ArrayList<HashMap<String, String>> itemDetails = (ArrayList<HashMap<String, String>>)reqhttpssession.getAttribute("products");


HashMap<String, String> prdquantity = (HashMap<String, String>)itemDetails.get(1);

int prdnum = Integer.parseInt(prdquantity.get(request.getParameter("prdname")));
prdnum++;		
prdquantity.put(request.getParameter("prdname"), Integer.toString(prdnum));

RequestDispatcher nextpage = request.getRequestDispatcher("ShoppingCart.jsp");
nextpage.forward(request, response);


%>


</body>
</html>