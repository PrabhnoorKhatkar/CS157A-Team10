<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="myapp/register-style.css" type="text/css"/>
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
							<td><input type="text" name="name" placeholder="Name"></td>
						</tr>
						<tr>
							<td><input type="text" name="displayName" placeholder="Display Name"></td>
						</tr>
						<tr>
							<td><input type="password" name="password" placeholder="Password"></td>
						</tr>
						<tr>
							<td><input type="text" name="emailAddress" placeholder="Email"></td>
						</tr>
						<tr>
							<td><input type="text" name="address" placeholder="Address"></td>
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
								<%
									String errorMessage = (String) request.getAttribute("errorMessage");
									String successMessage = (String) request.getSession().getAttribute("successMessage");

									if (errorMessage != null) {
								%>
								<div class="error"><%= errorMessage %>
								</div>
								<%
									}
									if (successMessage != null) {
								%>
								<div class="success"><%= successMessage %>
								</div>
								<%
										request.getSession().removeAttribute("successMessage");
									}
								%>
							</td>
						</tr>
						<tr>
							<td><a href="login.jsp">Already have an account? Sign in</td>
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