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

	<form action="Payment" method="post" class="payment-form">

		<!-- Total Price -->

		<div class="artwork-preview-container">

			<img src="myapp/temporary-pic.jpg" alt="profile pic" width="auto" height="130">

			<div class="art-info">

				<h3>Art Title</h3>

				<p>$0.00</p>

			</div>
		</div>

		<div class="price-container">
			<p>
				Subtotal: <span>$0.00</span>
			</p>

			<p>
				Shipping: <span>$0.00</span>
			</p>

			<p>
				Total Price: <span>$0.00</span>
			</p>

		</div>

		<!-- Payment Method -->
		<h2>Payment Method</h2>

		<div class="payment-method-container">

			<label for="paymentOptions">Payment Options:</label> <select
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

		</div>


		<!-- Complete Payment -->
		<button type="submit" class="pay-btn">Complete Payment</button>

	</form>
	<script src="myapp/payment.js"></script>
</body>
</html>