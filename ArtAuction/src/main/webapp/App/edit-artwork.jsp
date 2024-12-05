<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>

<layout:base>
	<jsp:attribute name="head">
		<link rel="stylesheet" href="<c:url value='/myapp/css/edit-artwork-style.css'/>">
		<title>Edit Artwork</title>
	</jsp:attribute>
	<jsp:body>
		<script src="<c:url value='myapp/javascript/countdown.js'/>"></script>
		<jsp:useBean id="artwork" scope="request" type="artauction.Artwork"/>
		<jsp:useBean id="ownerDisplayName" scope="request" type="java.lang.String"/>
		<jsp:useBean id="isOwner" scope="request" type="java.lang.Boolean"/>
		<jsp:useBean id="auction" scope="request" type="artauction.Auction"/>
		<jsp:useBean id="highestBidder" scope="request" type="artauction.user.User"/>
		<form action="<c:url value="/App/EditArtwork"/>" method="post" class="artwork-body">
			<div class="left">
				<c:forEach var="image" items="${artwork.images}">
					<img class="art" src="<c:url value="/Uploads/${image.imageId}"/>">
				</c:forEach>
				<br>
				<hr width="100%" size="2" class="left-line">
				<h2 class="title1"> Item Overview</h2>

				<div class="edit-description">
					<label for="description">Description:</label>
					<textarea id="description" name="description" required>${artwork.description}</textarea>
				</div>

				<hr width="100%" size="2">
			</div>
			<div class="right">
				<div class="edit-artwork">

					<input type="hidden" name="artworkID" value="${artwork.id}">
					<h2 class="title0">Edit Artwork Details </h2>
					<label for="artist"> <em>Artist: </em></label> <br>
					<input type="text" id="artist" name="artist" value="${artwork.artist}" required>
					<br>
					<label for="title"> <em> Title: </em></label> <br>
					<input type="text" id="title" name="title" value="${artwork.title}" required>
					<br>
					<section class="edit-section">
						<p class="bidding"><em> Starting Price: $${auction.startingPrice} </em></p>
						<p class="bidding"><em> Current Bid: $${auction.amount} </em></p>
						<p class="bidding"><em> Highest Bidder: ${highestBidder.displayName} </em></p>
						<p class="bidding"><em> Reserve: $${auction.reserve} </em></p>
					</section>
					<p>Auction Ends: ${auction.endTimestamp}</p>

					<!-- Countdown Timer -->
					<div class="countdown-timer">
						<p>
							Auction Ends In: <span id="countdown-${artwork.id}"></span>
						</p>
					</div>

					<script>
                        var timestamp = "${auction.endTimestamp}";
                        var artworkId = "${artwork.id}";
                        if (timestamp && !isNaN(Date.parse(timestamp))) {
                            countdown(timestamp, artworkId);
                        }
					</script>

					<hr>

					<p>Owner: ${ownerDisplayName}</p>

					<button type="submit" class="save-changes-btn">Save Changes</button>
					<button type="submit" class="remove-btn" formaction="<c:url value="/App/RemoveArtwork"/>"
							onsubmit="return confirm('Are you sure you want to remove this listing?');"
					>Remove Listing
					</button>
				</div>

				<!-- Remove Listing -->

				<!-- Display tags -->
				<jsp:useBean id="tags" scope="request" type="java.util.List<java.lang.String>"/>
				<c:if test="${! empty tags}">
					<div class="tags-section">
						<p><strong>Tags:</strong></p>
						<div class="tags-container">
							<c:forEach var="tag" items="${tags}">
								<span class="tag">${tag},</span>
							</c:forEach>
						</div>
					</div>
				</c:if>
			</div>
		</form>
	</jsp:body>
</layout:base>
