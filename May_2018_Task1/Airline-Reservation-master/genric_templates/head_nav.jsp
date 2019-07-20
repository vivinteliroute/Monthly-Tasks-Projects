    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <nav>
    	<ul>
				<li class="start "><a href="MainItems.jsp">Home</a></li>
				<li class=""><a href="American.jsp">American Airlines</a></li>
				<li class=""><a href="BritishAirways.jsp">British Airways</a></li>
				<li class=""><a href="Southwest.jsp">Southwest Airlines</a></li>
				<li class=""><a href="WriteReview.jsp">Write Review</a></li>
		</ul>
    </nav>
    	-- <form name="autofillform" action="autocomplete">
			<table border="0" cellpadding="5">
				<tbody>
					<tr>
						<td><strong>Search:</strong></td>
						<td><input type="text" size="40" id="complete-field"
							onkeyup="doCompletion()"></td>
					</tr>
					<tr>
						<td id="auto-row" colspan="2">
							<table id="complete-table" class="popupBox" />
						</td>
					</tr>
				</tbody>
			</table>
		</form> 
    <div>
		<form style = "float:left"class="submit-button" method="post" action="YourOrders.jsp">
			<input class="history" type="submit" name="ViewOrders"
				value="Your Orders">
		</form>
		
		<div style="float:right;padding-top:3px;">
		<form action = "index.jsp"  method = "post">
			<h3 style="color:black;display:inline-block; padding-right:3px;"><i class="fa fa-sign-out"></i></h3>
			<button name="Cart" value="Cart" class="cart-btn">Logout</button>
		</form>
		</div>
		<div style="float:right;padding-top:3px;">
		<form class="display:inline-block" action = "ShoppingCart.jsp"  method = "post">
			<h3 style="color:black;display:inline-block;padding-right:3px;"><i class="fa fa-shopping-cart"></i></h3>
			<button name="Cart" value="Cart" class="cart-btn">Cart</button>
		</form>
		</div>
	</div>
	<br>
	<br>