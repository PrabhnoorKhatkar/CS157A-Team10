<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="myapp/artwork-style.css">
<title>Artwork</title>
</head>
<body>

	<!-- TODO Iterate over the artwork list and display each artwork -->

	<section class="artwork-details">
		<div class="container">
			<h2>Title: ${artwork.title}</h2>
			<p>Artist: ${artwork.artist}</p>
			<p>Description: ${artwork.description}</p>

			<p>Starting Bid: $${auction.startingPrice}</p>

			<p>Current Bid: $${auction.amount}</p>
			
			<p>Auction Ends: ${auction.endTimestamp}</p>

			<!-- save favorite artwork functionality -->
			<form action="SaveArtwork" method="post">

				<input type="hidden" name="artworkId" value="${artworkID}">

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
</body>
</html>