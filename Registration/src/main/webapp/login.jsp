<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="myapp/login-style.css">
<script src="myapp/main.js"></script>
<title>Login</title>
</head>
<body style = "background-image: url('https://magazine.artland.com/wp-content/uploads/2022/07/van-gogh-starry-night-min.jpg'); 
background-repeat: no-repeat;
background-attachment: fixed;
background-size: cover;">
	<form action="Login" method="post" style = "background-color: rgba(0, 0, 0, 0.8);">
		<h1 style = "color: #b5b5b5;">Welcome to Online Art Auction</h1>
		<h2 style = "color: #b5b5b5;">Login</h2>
		<table>
			

			<tr>
				<td><input type="text" name="email" placeholder="email address"></td>
			</tr>

			<tr>
				<td><input type="password" name="password"
					placeholder="password"></td>
			</tr>

			<tr>
				<td><input type="submit" value="Login"></td>
			</tr>

			<tr>
				<td><a style = "color: #b5b5b5;" href="memberRegister.jsp">Sign up</a></td>
			</tr>

			<!-- java code to display error on jsp page -->
			<%
			String errorMessage = (String) request.getAttribute("errorMessage");
			if (errorMessage != null) {
			%>
			<div type="error"><%=errorMessage%></div>
			<%
			}
			%>
		</table>
	</form>
</body>
</html>