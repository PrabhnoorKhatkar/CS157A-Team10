<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="myapp/artwork-style.css">
<script src="myapp/main.js"></script>
<title>Artwork</title>
</head>
<body>

	<!-- TODO Iterate over the artwork list and display each artwork -->

	<section class="artwork-details">
		<div class="container">
			<h2>${artwork.title}</h2>
			<p>Artist: ${artwork.artistName}</p>
			<p>Starting Bid: $${artwork.startingPrice}</p>
			<p>Description: ${artwork.description}</p>
			<p>Auction Ends: ${artwork.auctionDeadline}</p>
			<button>Save</button>

			<label for="bidAmount">Place Your Bid:</label>
            <input type="number" min="${artwork.startingPrice}" placeholder="Enter bid amount" required>
            <button>Place Bid</button>
		</div>
	</section>


</body>
</html>