<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="myapp/main.js"></script>
<title>Login</title>
</head>
<body>
	<form action="Login" method="post">
		<table>
			<h1>Welcome to Online Art Auction</h1>
			<h2>Login</h2>

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
				<td><a href="memberRegister.jsp">Sign up</td>
			</tr>

			<!-- java code to display error on jsp page -->
			<%
			String errorMessage = (String) request.getAttribute("errorMessage");
			if (errorMessage != null) {
			%>
			<div class="error"><%=errorMessage%></div>
			<%
			}
			%>
		</table>
	</form>
</body>
</html>