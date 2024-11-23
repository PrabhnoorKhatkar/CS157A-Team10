<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Order Confirmation</title>
		<link rel="stylesheet" href="myapp/css/art-upload-form-style.css">
	</head>
	<body>
			<h2>Order Confirmation</h2>

            <p>Hey ${name}</p>
            <p>Your order of </p>
                
                <p>${artwork.title} has been placed.</p>

                <p>${email}</p>
                <p>$${totalPaid}</p>

                <p>Order Number: ${orderNumber}</p>



              <p> has been confirmed</p>




			<!-- RETURN BTN -->
			<button type="submit" class="upload-btn">Return Homepage</button>
			<a href="homepage.jsp" class="back-to-homepage">Back to Homepage</a>

	</body>
</html>