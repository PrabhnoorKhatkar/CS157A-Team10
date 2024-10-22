<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="myapp/login-style.css" type="text/css"/>
<script src="myapp/main.js"></script>
<title>Login</title>
</head>
<body>
	<form action="Login" method="post" style = "background-color: rgba(0, 0, 0, 0.6);">
		<h1 style = "color: white;">Welcome to Online Art Auction</h1>
		<h2 style = "color: white;">Login</h2>
		<table>
			

			<tr>
				<td><input type="text" name="email" placeholder="email address"></td>
			</tr>

			<tr>
				<td><input type="password" name="password" placeholder="password"></td>
			</tr>

			<tr>
				<td><input type="submit" value="Login"></td>
			</tr>

			<tr>
				<td><a style = "color: #b5b5b5;" href="memberRegister.jsp">Sign up</a></td>
			</tr>

			<!-- display error for log in unsuccessfully-->
			
			<!-- display register successful message -->
			
			<%
				String errorMessage = (String) request.getAttribute("errorMessage");
				String successMessage = (String) request.getSession().getAttribute("successMessage");
				
				if (errorMessage != null) {
			%>
				<div class="error"><%= errorMessage %></div>
			<%
				}
				if (successMessage != null) {
			%>
				<div class="success"><%= successMessage %></div>
			<%
				request.getSession().removeAttribute("successMessage");
				}
			%>
		</table>
	</form>
</body>
</html>