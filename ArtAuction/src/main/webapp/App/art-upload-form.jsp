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
			<sl-input label="Title:" name="title" placeholder="Artwork title" required></sl-input>

			<!-- ARTIST -->
			<sl-input label="Artist:" type="text" id="artist" name="artist" placeholder="Artist name" required></sl-input>

			<!-- DESCRIPTION -->
			<sl-textarea label="Description:" id="description" name="description" placeholder="Describe your artwork" required></sl-textarea>

			<!-- Tags -->
			<sl-textarea id="tags" name="tags" label="Tags:"
					  placeholder="Tags: list them" ></sl-textarea>

			<!-- IMAGE UPLOAD -->
			<label for="image">Upload Image:</label> <input type="file" id="image"
															name="image" accept="image/*" required>

			<!-- STARTING PRICE -->
			<sl-input
				label="Starting Price ($):"
				type="number" name="startingPrice" id="startingPrice"
				placeholder="e.g., 500" min="0" required></sl-input>

			<!-- RESERVE PRICE -->
			<sl-input id="reservePrice" label="Reserve Price ($):" type="number" name="reservePrice" placeholder="e.g., 500" min="0" required>

			<!-- AUCTION DURATION IN HOURS -->
			<sl-input id="duration" label="Auction Duration (days):" type="number" name="duration" placeholder="Enter duration in days" min="1" required></sl-input>

			<!-- SUBMIT BTN -->
			<sl-button type="submit">Upload Artwork</sl-button>
			<a href="<c:url value="/"/>" class="back-to-homepage">Back to Homepage</a>
		</form>
	</body>
</html>
