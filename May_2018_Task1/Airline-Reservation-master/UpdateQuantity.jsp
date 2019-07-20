<!doctype html>
<html>
<head>
<title>Airline Reservation</title>
</head>
<body>

 <%@include file="genric_templates/include.jsp"%>

<%

 HttpSession reqhttpsession = request.getSession();	 

ArrayList<HashMap<String, String>> products = (ArrayList<HashMap<String, String>>)reqhttpsession.getAttribute("products");

String prdname = request.getParameter("prdname").trim();
String prdquantity = request.getParameter("quantity");

HashMap<String,String> quantity = products.get(1);

quantity.remove(prdname);
quantity.put(prdname, prdquantity);

products.set(1, quantity);

RequestDispatcher rd = request.getRequestDispatcher("ShoppingCart.jsp");
rd.forward(request, response);
%>

</body>
</html>