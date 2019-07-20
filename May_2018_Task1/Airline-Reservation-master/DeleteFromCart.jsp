<!doctype html>
<html>
<head>
<title>Airline Reservation</title>
</head>
<body>
 <%@include file="genric_templates/include.jsp"%>

<%

HttpSession reqhttpsession = request.getSession();
ArrayList<String> prdlist = (ArrayList<String>)reqhttpsession.getAttribute("productsuccess");

String prddelete = request.getParameter("prdname");
int prdid = prdlist.indexOf(prddelete);

prdlist.remove(prdid);

RequestDispatcher nextpage = request.getRequestDispatcher("ShoppingCart.jsp");
nextpage.forward(request, response);

%>


</body>
</html>