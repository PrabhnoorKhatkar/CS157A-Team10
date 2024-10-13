<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Register</title>
</head>
<body>
	<form action="Register" method="post">
		<table>
			<h1>Welcome to Online Art Auction</h1>
			<h2>Register</h2>
			<tr>
				<td><input type="text" name="name" placeholder="Name"></td>
			</tr>
			<tr>
				<td><input type="text" name="displayName"
					placeholder="Display Name"></td>
			</tr>
			<tr>
				<td><input type="password" name="password"
					placeholder="Password"></td>
			</tr>
			<tr>
				<td><input type="text" name="emailAddress" placeholder="Email"></td>
			</tr>
			<tr>
				<td><input type="text" name="address" placeholder="Address"></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="anonymous" value="false">Register
					Anonymously</td>
			</tr>
			<tr>
				<td><input type="submit" value="register"></td>
			</tr>

			<tr>
				<td><a href="login.jsp">Already have an account? Sign in</td>
			</tr>
		</table>
	</form>
</body>
</html>