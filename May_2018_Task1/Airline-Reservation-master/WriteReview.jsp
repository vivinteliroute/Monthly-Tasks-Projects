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
		
        <div id="body">

            <section id="content">

                    <h2 style="text-align:center;"> Write Review</h2>

                    <form method="post" class="searchform" action="SubmitReview.jsp">

                        <table>

                            <tr>
                                <td> Airline: </td>
                                <td>
                                    <select name="airline">
                                        <option value="American1" selected>American Airlines 1</option>
                                         <option value="American2" >American Airlines 2</option>
                                        <option value="BritishAirways1">British Airways 1</option>
                                        <option value="BritishAirways2">British Airways 2</option>
                                        <option value="Southwest1">Southwest Airlines 1</option>
                                        <option value="Southwest2">Southwest Airlines 2</option>
                                </td>
                            </tr>

                            <tr>
                                <td> User ID: </td>
                                <td>
                                    <input type="text" name="userID" class="s" /> </td>
                            </tr>

                            <tr>
                                <td> User Age: </td>
                                <td>
                                    <input type="number" name="userAge" class="s" /> </td>
                            </tr>

                            <tr>
                                <td> User Gender: </td>
                                <td>
                                    <input type="radio" name="userGender" value="Male" /> Male
                                    <input type="radio" name="userGender" value="Female" /> Female</td>
                            </tr>

                            <tr>
                                <td> User Occupation: </td>
                                <td>
                                    <input type="text" name="userOccupation" class="s" /> </td>
                            </tr>


                            <tr>
                                <td> Review Rating: </td>
                                <td>
                                    <select name="reviewRating">
                                        <option value="1" selected>1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                </td>
                            </tr>

                            <tr>
                                <td> Review Date: </td>
                                <td>
                                    <input type="date" name="reviewDate" size=10/> </td>
                            </tr>

                            <tr>
                                <td> Review Text: </td>
                                <td>
                                    <textarea name="reviewText" rows="4" cols="50"> </textarea>
                                </td>
                            </tr>
                        </table>
                        <center>    
                            <input type="submit" value="Submit Review" class="formbutton" /> </td>
                    	</center>
                    </form>

            </section>

			 <%@include file="genric_templates/sidebar.jsp"%>
            <%@include file="genric_templates/footer.jsp"%>
    </div>


</body>

</html>
