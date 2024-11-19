<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/myapp/artwork-style.css"/>">
<title>Artwork</title>
</head>
<body>

	<header class="profile-header">
		<div class="header-left">
			<h2>
				<a href="<c:url value="/"/>" class="logo">ART AUCTION</a>
			</h2>
		</div>

		<div class="header-right">

			<a href="<c:url value="/art-upload-form.jsp"/>" class="upload-btn">Artwork Upload</a>

			<form action="Logout" method="post">
				<button type="submit" class="logout-btn">Log Out</button>
			</form>

			<a href="<c:url value="/UserProfile"/>" class="profile-btn"> <img
					src="<c:url value="/myapp/temporary-pic.jpg"/>" alt="profile pic" width="64"
					height="64">
			</a>
		</div>
	</header>


	<!-- Check if user is the owner -->
	<jsp:useBean id="artwork" scope="request" type="ArtAuction.Artwork"/>
	<jsp:useBean id="ownerDisplayName" scope="request" type="java.lang.String"/>
	<jsp:useBean id="isOwner" scope="request" type="java.lang.Boolean"/>
	<jsp:useBean id="auction" scope="request" type="ArtAuction.Auction"/>
	<jsp:useBean id="highestBidder" scope="request" type="ArtAuction.User"/>
	<c:if test="${isOwner}">
		<header class="artwork-header">
			<div class="left">
				<c:forEach var="image" items="${artwork.images}">
					<img class="art" src="<c:url value="/Uploads/${image.imageId}"/>">
				</c:forEach>
			</div>
			<div class=right>
				<h2>Edit Artwork Details: ${artwork.title}</h2>
				<form action="EditArtwork" method="post">
					<input type="hidden" name="artworkID" value="${artwork.id}">

					<p>Owner: ${ownerDisplayName}</p>

					<label for="title">Title:</label> <input type="text" id="title"
						name="title" value="${artwork.title}" required><br> <label
						for="artist">Artist:</label> <input type="text" id="artist"
						name="artist" value="${artwork.artist}" required><br>

					<label for="description">Description:</label>
					<textarea id="description" name="description" required>${artwork.description}</textarea>
					<br>

					<p>Starting Price: $${auction.startingPrice}</p>
					<p>Current Bid: $${auction.amount}</p>
					<p>Highest Bidder: ${highestBidder.displayName}</p>
					<p>Reserve: $${auction.reserve}</p>

					<p>Auction Ends: ${auction.endTimestamp}</p>

					<button type="submit" class="btn save-btn">Save Changes</button>
				</form>
			</div>
			<div class="owner-actions">
				<!-- Remove Listing -->
				<form action="RemoveArtwork" method="post"
					onsubmit="return confirm('Are you sure you want to remove this listing?');">
					<input type="hidden" name="artworkID" value="${artwork.id}">
					<button type="submit" class="btn remove-btn">Remove
						Listing</button>
				</form>
			</div>
		</header>
	</c:if>

	<!-- For non owner page-->
	<!-- Iterate over the artwork list and display each artwork -->
	<c:if test="${!isOwner}">
		<section class="artwork-details">
			<div class="container">
				<h2>Title: ${artwork.title}</h2>
				<c:forEach var="image" items="${artwork.images}">
					<img class="art" src="<c:url value="/Uploads/${image.imageId}"/>">
				</c:forEach>
				<p>
					Owner: <a href="<c:url value="UserProfile?user=${ownerDisplayName}"/>">${ownerDisplayName}</a>
				</p>
				<p>Artist: ${artwork.artist}</p>
				<p>Description: ${artwork.description}</p>
				<p>Starting Bid: $${auction.startingPrice}</p>
				<p>Current Bid: $${auction.amount}</p>
				<p>Highest Bidder: ${highestBidder.displayName}</p>
				<p>Auction Ends: ${auction.endTimestamp}</p>

				<!-- Countdown Timer -->
				<div class="countdown-timer">
					<p>
						Auction Ends In: <span id="countdown"></span>
					</p>
				</div>

				<!-- save favorite artwork functionality -->
				<form action="SaveArtwork" method="post">
					<input type="hidden" name="artworkID" value="${artwork.id}">

					<c:choose>
						<c:when test="${checkSave}">
							<button type="submit" name="action" value="unsave"
								class="un-save-btn">Saved</button>
							<p>Saved to Favorites</p>
						</c:when>
						<c:when test="${!checkSave}">
							<button type="submit" name="action" value="save" class="save-btn">Save</button>
						</c:when>
					</c:choose>

				</form>

				<div class="bid-section">
					<c:if test="${auction.result == 'ACTIVE'}">
						<form action="PlaceBid" method="post">
							<input type="hidden" name="artworkID" value="${artwork.id}">

							<label for="bidAmount">Place Your Bid:</label> <input
								type="number" id="bidAmount" name="bidAmount"
								min="${auction.startingPrice}" placeholder="Enter bid amount"
								required>

							<button type="submit" class="btn bid-btn">Place Bid</button>
						</form>
					</c:if>
					<c:if test="${auction.result != 'ACTIVE'}">
						<p>Bidding for this artwork is closed.</p>
					</c:if>
				</div>

			</div>
		</section>
	</c:if>

</body>

</html>