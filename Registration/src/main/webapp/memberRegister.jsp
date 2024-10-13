<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Register </title>
</head>
<body>
	<form action="Register" method="post">
		<table>
			<tr>
				<td>Name</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>Display Name</td>
				<td><input type="text" name="displayName"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="emailAddress"></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
                <td>Register Anonymously</td>
                <td><input type="checkbox" name="anonymous" value="false"> Yes</td>
            </tr>
			<tr>
				<td>Submit</td>
				<td><input type="submit" value="register"></td>
			</tr>
		</table>
	</form>
</body>
</html>