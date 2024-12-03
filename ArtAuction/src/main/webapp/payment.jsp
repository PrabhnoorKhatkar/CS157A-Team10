<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="myapp/css/payment-style.css" type="text/css" />
<title>Payment</title>
</head>
<body>

	<h1>Payment</h1>

	<form action="PaymentProcess" method="post" class="payment-form">

		<input type="hidden" name="artworkID" value="${artwork.id}">
		<input type="hidden" name="totalPrice" value="${totalPrice}">

		<!-- Total Price -->

		<div class="artwork-preview-container">

			<!-- TODO GET IMAGE PATH WORKING -->
			<c:forEach var="artImage" items="${artwork.images}">
				<img src="<c:url value="/Uploads/${artImage.imageId}"/>">
			</c:forEach>
	

			<div class="art-info">

				<h3>Title ${artwork.title} </h3>

				<p>$${auction.amount}</p>

			</div>
		</div>

		<div class="price-container">
			<p>
				Subtotal: <span>$${subTotal}</span>
			</p>

			<p>
				Shipping: <span>$${shipping}</span>
			</p>

			<p>
				Auction Fees (10%): <span>$${fees}</span>
			</p>

			<p>
				Total Price: <span>$${totalPrice}</span>
			</p>

		</div>

		<!-- Payment Method -->
		<h2>Payment Method</h2>

		<div class="payment-method-container">

			<label for="paymentMethod">Payment Options:</label> <select
				id="paymentMethod" name="paymentMethod" required>

				<option value="credit">Credit/Debit Card</option>

				<option value="bank" disabled>Bank Transfer</option>

				<option value="paypal" disabled>PayPal</option>

			</select> 
			
			<label for="name">NAME ON CARD:</label> 
			
			<input type="text" id="name" name="name" placeholder="Enter name on card" required> 
				
				<label for="cardNumber">Card Number:</label> 
				
				<input type="text" id="cardNumber" name="cardNumber" placeholder="Enter your card number" maxlength="16" required>

		</div>

		<div class="expiration-date-container">

			<label>Expiration Date:</label>

			<div class="expiration-container">

				<!-- Month Dropdown -->
				<select id="cardMonth" name="cardMonth" required>
					<option value="" disabled selected>Month</option>
				</select>

				<!-- Year Dropdown -->
				<select id="cardYear" name="cardYear" required>
					<option value="" disabled selected>Year</option>
				</select>

			</div>

		</div>
		
		<div class="billing">
			<input type="checkbox" id="billingAddress" name="billingAddress" value="billingAddress">
			<label for="address">Billing address is the same as shipping address</label>
		</div>

		<!-- Delivery Information -->
		<h2>Delivery Information</h2>

		<div class="delivery-info-container">

			<label for="email">Email:</label> 
			<input type="email" id="email" name="email" placeholder="Enter your email" required>

	        <label for="address1">Address Line 1:</label>
	        <input type="text" id="address1" name="address1" placeholder="123 Main St" required>
	        
	        <label for="address2">Address Line 2 (Optional):</label>
	        <input type="text" id="address2" name="address2" placeholder="Apartment, Suite, etc.">
	
	        <label for="city">City:</label>
	        <input type="text" id="city" name="city" placeholder="Enter city" required>
	        
	        <label for="state">State:</label>
	        <input type="text" id="state" name="state" placeholder="Enter state" required>
	
	        <label for="zip">Zip Code:</label>
	        <input type="text" id="zip" name="zip" placeholder="Enter zip code" required>
	
	        <label for="country">Country:</label>
	        <select id="country" name="country" required>
	            <option value="US">United States</option>
	        </select>
		</div>


		<!-- Complete Payment -->
		<button type="submit" class="pay-btn">Complete Payment</button>

	</form>
	<script src="myapp/javascript/payment.js"></script>
</body>
</html>