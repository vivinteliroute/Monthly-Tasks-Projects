<!doctype html>
<html>
<head>
<title>Airline Reservation</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>

<body> 
	<div id="container">
	 <%@include file="genric_templates/header.jsp"%>
		 

		<div id="body">
		
			<img class="header-image" src="images/front-banner.jpg" width = "100%" height = "100%" alt="Airline Reservations Banner" />

				<div class="user-form">

					<h2 style="color: #799AC0;">Book Your Travel Ticket Today</h2>

				<form method="post" class="searchform" action="AllAirlines.jsp">
					<br>
                    <input style="margin-right:10px;" type="radio" name="one-way" value="Round Trip" checked><span style="margin-right:120px;">Round Trip</span>                            
                    <input style="margin-right:10px;" type="radio" name="one-way" value="One Way Trip">One Way Trip
                    <br>
                    <br>
                    <table>	
                        	<tr>
                                <td class="user-form-table"> Source: </td>
                                <td class="user-form-table">
                                    <input type="text" name="source" /> </td>
                            </tr>
                            
                            <tr>
                                <td class="user-form-table"> Destination: </td>
                                <td class="user-form-table">
                                    <input type="text" name="destination" /> </td>
                            </tr>
                            
                             <tr>
                                <td class="user-form-table"> From: </td>
                                <td class="user-form-table">
                                    <input type="date" name="fromdate" size=10/> </td>
                            </tr>
                            
                            <tr>
                                <td class="user-form-table"> To: </td>
                                <td class="user-form-table">
                                    <input id="todate" type="date" name="todate" size=10/> </td>
                            </tr>
                            
                            <tr>
                                <td class="user-form-table"> Adult: </td>
                                <td class="user-form-table">
                                    <input type="number" name="adult" value="1"/> </td>
                            </tr>
                            
                              <tr>
                                <td class="user-form-table"> Children: </td>
                                <td class="user-form-table">
                                    <input type="number" name="children" value="0"/> </td>
                            </tr>
                            
                            <tr>
                                <td class="user-form-table"> Seat Preference: </td>
                                <td class="user-form-table">
                                    <select>
                                    	<option>Select Type</option>
                                    	<option>Economy Class</option>
                                    	<option>First Class</option>
                                    	<option>Business Class</option>
                                    </select>
                            </tr>
                            
                            </table>
                            <br>
                            <center>
                               	<input type="submit" value="SUBMIT" class="formbutton" />
                            </center>   
                            </form>

                </div>         

			 <%@include file="genric_templates/footer.jsp"%>
	</div>
	</div>
	<script type="text/javascript" src="javascript.js"></script>
</body>

</html>