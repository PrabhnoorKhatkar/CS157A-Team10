<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="myapp/css/register-style.css" type="text/css"/>
		<title>Account Register</title>
	</head>
	<body>
		<div class="container">
			<div class="text">
				<form action="Register" method="post">
					<table>
						<h1>Welcome to Online Art Auction</h1>
						<h2>Register</h2>
						<tr>
							<td><input type="text" name="name" placeholder="Name" required></td>
						</tr>
						<tr>
							<td><input type="text" name="displayName" placeholder="Display Name" required></td>
						</tr>
						<tr>
							<td><input type="password" name="password" placeholder="Password" required></td>
						</tr>
						<tr>
							<td><input type="email" name="emailAddress" placeholder="Email" required></td>
						</tr>
						<tr>
							<td><input type="text" name="address" placeholder="Address" required></td>
						</tr>
						<tr>
							<td>
								<label>
									<input type="checkbox" name="anonymous" value="false">
									Register Anonymously
								</label>
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" value="register">
								<c:if test="${not empty requestScope.errorMessage}" >
									<jsp:useBean id="errorMessage" scope="request" type="java.lang.String"/>
									<div class="error">
										<c:out value="${errorMessage}"/>
									</div>
								</c:if>
								<c:if test="${not empty requestScope.successMessage}" >
									<jsp:useBean id="successMessage" scope="request" type="java.lang.String"/>
									<div class="success">
										<c:out value="${successMessage}"/>
									</div>
								</c:if>
							</td>
						</tr>
						<tr>
							<td><a href="login.jsp">Already have an account? Sign in</a></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="image">
				<img src="https://t4.ftcdn.net/jpg/04/14/88/81/360_F_414888151_TFfbswegz6dmezIuOvU6zWYcCuFW9JwS.jpg">
			</div>
		</div>
	</body>
</html>