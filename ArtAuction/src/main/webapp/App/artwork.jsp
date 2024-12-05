<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags/components" %>
<!DOCTYPE html>

<layout:base>
	<jsp:attribute name="head">
		<link rel="stylesheet" href="<c:url value='/myapp/css/artwork-style.css'/>">
		<title>Artwork</title>
	</jsp:attribute>
	<jsp:body>
		<ui:main-header/>
		<script src="<c:url value='myapp/javascript/countdown.js'/>"></script>
		<!-- Check if user is the owner and admin (no shill bidding)-->
		<jsp:useBean id="artwork" scope="request" type="artauction.Artwork"/>
		<jsp:useBean id="ownerDisplayName" scope="request" type="java.lang.String"/>
		<jsp:useBean id="isOwner" scope="request" type="java.lang.Boolean"/>
		<jsp:useBean id="auction" scope="request" type="artauction.Auction"/>
		<jsp:useBean id="highestBidder" scope="request" type="artauction.user.User"/>
		<jsp:useBean id="isHighest" scope="request" type="java.lang.Boolean"/>

			<div class="artwork-body">
				<div class="left">
					<c:forEach var="image" items="${artwork.images}">
						<img class="art" src="<c:url value="/Uploads/${image.imageId}"/>">
					</c:forEach>
					<br>
					<hr width="100%" size="2" class="left-line">
					<h2 class="title1"> Item Overview</h2>
					<p>Description:</p>
					<p> ${artwork.description} </p>
					<hr width="100%" size="2">
				</div>
				<div class="right">
					<h2 class="title1">
							${artwork.artist}
					</h2>
					<h2 class="title2"><em>${artwork.title}</em></h2>

					<c:if test="${not isOwner}">
						<section>
							<p class="bidding"><em> Starting Bid: </em> $${auction.startingPrice}</p>
							<p class="bidding"><em> Current Bid: </em> $${auction.amount}</p>
							<p class="bidding"><em> Highest Bidder: </em>${highestBidder.displayName}</p>
							<c:if test="${isHighest}">
								<p class="highest"> You are currently the highest bidder</p>
							</c:if>
							<c:if test="${auction.result == 'ACTIVE'}">
								<form action="<c:url value="/App/PlaceBid"/>" method="post" class="placebid">
									<input type="hidden" name="artworkID" value="${artwork.id}">

									<label for="bidAmount" class="bidding"> <em>Place Your Bid: </em></label>
									<input type="number" id="bidAmount" name="bidAmount"
										   min="${Math.max(auction.startingPrice, auction.amount + 1)}"  placeholder="Enter bid amount" required>

									<button type="submit" class="bid-btn">Place Bid</button>
								</form>
							</c:if>
							<c:if test="${auction.result != 'ACTIVE'}">
								<p class="closed">Bidding for this artwork is closed.</p>
							</c:if>
						</section>
					</c:if>
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


					<hr width="100%" size="2">
					<p><a href="<c:url value="/App/UserProfile?user=${ownerDisplayName}"/>" class="link">${ownerDisplayName}</a></p>


					<!-- save favorite artwork functionality -->
					<form action="<c:url value="/App/SaveArtwork"/>" method="post">
						<input type="hidden" name="artworkID" value="${artwork.id}">

						<c:choose>
							<c:when test="${checkSave}">
								<button type="submit" name="action" value="unsave"class="un-save-btn">
									<img src="../myapp/icons/heart-fill.svg" alt="heart-fill" height="30" width="auto" class = "heart">
								</button>
								<!-- <p>Saved to Favorites</p> -->
							</c:when>
							<c:when test="${!checkSave}">
								<button type="submit" name="action" value="save" class="save-btn">
									<img src="../myapp/icons/heart.svg" alt="heart" height="30" width="auto" class="heart">
								</button>
							</c:when>
						</c:choose>

					</form>

					<c:if test="${winningUser}">
						<p>You WON!!!</p>
						<!-- purchase artwork functionality -->
						<form action="<c:url value="/App/PurchaseArtwork"/>" method="post">

							<input type="hidden" name="artworkID" value="${artwork.id}">
							<input type="hidden" name="userID" value="${userID}">

							<button type="submit" name="action" value="Purchase" class="purchase-btn">Purchase</button>
						</form>
					</c:if>

					<c:if test="${isOwner || admin}">
						<form action="<c:url value="/App/EditArtwork"/>" method="get">
							<input type="hidden" name="id" value="${artwork.id}">
							<sl-button type="submit">
								Edit listing
							</sl-button>
						</form>
					</c:if>

					<!-- Display tags -->
					<c:if test="${! empty tags}">
						<div class="tags-section">
							<p><strong>Tags:</strong></p>
							<div class="tags-container">
								<c:forEach var="tag" items="${tags}">
									<span class="tag">${tag}</span>
								</c:forEach>
							</div>
						</div>
					</c:if>

				</div>
			</div>

	</jsp:body>
</layout:base>
