<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<title>File Uploading Form</title>
	</head>

	<body>
		<h3>Profile picture upload:</h3>
		Select a file to upload:
		<br/>
		<form action="Upload/" method="POST" enctype="multipart/form-data">
			<input type="file" name="file" size="50"/> <br/> <input
				type="submit" value="Upload File"/>
		</form>
	</body>
</html>