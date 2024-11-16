<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="myapp/artwork-style.css">
<title>Artwork</title>
</head>
<body>

	<!-- Check if user is the owner -->
	<c:if test="${isOwner}">
		<h2>Edit Artwork Details ${artwork.title}</h2>
		<form action="UpdateArtwork" method="post">
			<input type="hidden" name="artworkID" value="${artwork.id}">
			
			<p>Owner: ${ownerDisplayName}</p>
			
			<label for="title">Title:</label>
			<input type="text" id="title" name="title" value="${artwork.title}" required><br>
			
			<label for="artist">Artist:</label>
			<input type="text" id="artist" name="artist" value="${artwork.artist}" required><br>
			
			<label for="description">Description:</label>
			<textarea id="description" name="description" required>${artwork.description}</textarea><br>
			
			<p>Starting Price: $${auction.startingPrice}</p>
			<p>Current Bid: $${auction.amount}</p>
			<p>Reserve: $${auction.reserve}</p>
	        
			<p>Auction Ends: ${auction.endTimestamp}</p>
			
			<button type="submit" class="btn save-btn">Save Changes</button>
		</form>
	</c:if>


	<!-- For non owner page-->
	<!-- Iterate over the artwork list and display each artwork -->
	<c:if test="${!isOwner}">
		<section class="artwork-details">
			<div class="container">
				<h2>Title: ${artwork.title}</h2>
				<p>Owner: <a href="UserProfile/${user.displayName}">${ownerDisplayName}</a></p>
				<p>Artist: ${artwork.artist}</p>
				<p>Description: ${artwork.description}</p>
				<p>Starting Bid: $${auction.startingPrice}</p>
				<p>Current Bid: $${auction.amount}</p>
				<p>Auction Ends: ${auction.endTimestamp}</p>

				<!-- save favorite artwork functionality -->
				<form action="SaveArtwork" method="post">

					<input type="hidden" name="artworkID" value="${artwork.id}">

					<input type="hidden" name="userID" value="${sessionScope.userID}">

					<button type="submit" class="save-btn">Save</button>

				</form>

				<div class="bid-section">
					<label for="bidAmount">Place Your Bid:</label>
					<input type="number" id="bidAmount" name="bidAmount" min="${auction.startingPrice}"
							placeholder="Enter bid amount" required>
					<button class="btn bid-btn">Place Bid</button>
				</div>

			</div>
		</section>
	</c:if>
	

	<!-- Check if user is the owner Remove Listing Button -->
	<c:if test="${isOwner}">
		<div class="owner-actions">
			<!-- Remove Listing -->
			<form action="RemoveArtwork" method="post" onsubmit="return confirm('Are you sure you want to remove this listing?');">
				<input type="hidden" name="artworkID" value="${artwork.id}">
				<button type="submit" class="btn remove-btn">Remove Listing</button>
			</form>
		</div>
	</c:if>
	
</body>

</html>