<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Artwork Upload Form</title>
		<link rel="stylesheet" href="<c:url value="/myapp/css/art-upload-form-style.css"/>">
	</head>
	<body>
		<form action="<c:url value="/App/UploadArtwork"/>" method="post" class="upload-form" enctype="multipart/form-data">
			<h2>Upload Artwork for Auction</h2>

			<!-- TITLE -->
			<label for="title">Title:</label> <input type="text" id="title"
													 name="title" placeholder="Artwork title" required>

			<!-- ARTIST -->
			<label for="artist">Artist:</label> <input type="text" id="artist"
													   name="artist" placeholder="Artist name" required>

			<!-- DESCRIPTION -->
			<label for="description">Description:</label>
			<textarea id="description" name="description"
					  placeholder="Describe your artwork" required></textarea>

			<!-- Tags -->
			<label for="tags">Tags:</label>
			<textarea id="tags" name="tags"
					  placeholder="Tags: list them" ></textarea>

			<!-- IMAGE UPLOAD -->
			<label for="image">Upload Image:</label> <input type="file" id="image"
															name="image" accept="image/*" required>

			<!-- STARTING PRICE -->
			<label for="startingPrice">Starting Price ($):</label> <input
				type="number" name="startingPrice" id="startingPrice"
				placeholder="e.g., 500" min="0" required>

			<!-- RESERVE PRICE -->
			<label for="reservePrice">Reserve Price ($):</label> <input id="reservePrice"
																		type="number" name="reservePrice"
																		placeholder="e.g., 500" min="0" required>

			<!-- AUCTION DURATION IN HOURS -->
			<label for="duration">Auction Duration (days):</label> <input id="duration"
																		   type="number" name="duration"
																		   placeholder="Enter duration in days" min="1"
																		   required>

			<!-- SUBMIT BTN -->
			<button type="submit" class="upload-btn">Upload Artwork</button>
			<a href="<c:url value="/"/>" class="back-to-homepage">Back to Homepage</a>
		</form>
	</body>
</html>
