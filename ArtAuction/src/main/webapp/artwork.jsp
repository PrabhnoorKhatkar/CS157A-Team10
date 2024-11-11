<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>

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
				<p>Description: ${artwork.description}</p>
				<button class="save-btn">Save</button>
				
			</div>
		</section>

		<%-- TODO populate rest
<section class="artwork-details">
	<div class="container">
		<h2>${artwork.title}Title</h2>
		<p>Artist: ${artwork.artistName}</p>
		<p>Starting Bid: $${artwork.startingPrice}</p>
		<p>Description: ${artwork.description}</p>
		<p>Auction Ends: ${artwork.auctionDeadline}</p>
		<button class="save-btn">Save</button>

		<div class="bid-section">
			<label for="bidAmount">Place Your Bid:</label>
			<input type="number" id="bidAmount" name="bidAmount" min="${artwork.startingPrice}"
				   placeholder="Enter bid amount" required>
			<button class="btn bid-btn">Place Bid</button>
		</div>
	</div>
</section>
--%>
	</body>
</html>