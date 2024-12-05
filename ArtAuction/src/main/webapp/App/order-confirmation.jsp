<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value="/myapp/css/order-confirmation-style.css"/>">
	<title>Order Confirmation</title>
	</head>
	<body>
		<div class="order-confirmation">
			<div class="order-info">
				<h2>Order Confirmation</h2>
			
				<p>Hey ${name} your order of ${artwork.title} has been placed.</p>
			
				<p>Email: ${email}</p>
				
				<p>Delivery Address: ${address1}, ${address2}, ${city}, ${state }</p>
			
				<p>Total Paid: $${totalPaid}</p>
			
				<p>Order Number: ${orderNumber} has been confirmed</p>
			</div>
		
		
			<div class="back-homepage">
				<a href="<c:url value="/"/>" class="back-to-homepage">Back to Homepage</a>
			</div>
		</div>
	</body>
</html>