<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Artwork Upload Form</title>
		<link rel="stylesheet" href="myapp/art-upload-form-style.css">
	</head>
	<body>
		<form action="UploadArtwork" method="post" class="upload-form"
			  >
			<h2>Upload Artwork for Auction</h2>

			<!-- TITLE -->
			<label for="title">Title:</label> <input type="text"
													 name="title" placeholder="Artwork title" required>
													 
			<!-- TITLE -->
			<label for="artist">Artist:</label> <input type="text" 
													 name="artist" placeholder="Artist name" required>

			<!-- DESCRIPTION -->
			<label for="description">Description:</label>
			<textarea id="description" name="description"
					  placeholder="Describe your artwork" required></textarea>

			<!-- IMAGE UPLOAD -->
			<label for="image">Upload Image:</label> <input type="file" 
															name="image" accept="image/*" required>

			<!-- STARTING PRICE -->
			<label for="startingPrice">Starting Price ($):</label> <input
				type="number"  name="startingPrice"
				placeholder="e.g., 500" min="0" required>
				
			<!-- RESERVE PRICE -->
			<label for="reservePrice">Reserve Price ($):</label> <input
				type="number"  name="reservePrice"
				placeholder="e.g., 500" min="0" >

			<!-- AUCTION DURATION IN HOURS -->
			<label for="duration">Auction Duration (hours):</label> <input
				type="number"  name="duration"
				placeholder="Enter duration in hours" min="1" required>

			<!-- SUBMIT BTN -->
			<button type="submit" class="upload-btn">Upload Artwork</button>
			<a href="homepage.jsp" class="back-to-homepage">Back to Homepage</a>
		</form>
	</body>
</html>