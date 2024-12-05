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
		<c:if test="${isOwner && sessionScope.admin}">
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

						<!-- Remove Listing -->
						<button type="submit" class="remove-btn" formaction="<c:url value="/App/RemoveArtwork"/>"
								onsubmit="return confirm('Are you sure you want to remove this listing?');">
							Remove Listing
						</button>
					</div>

					<!-- Display tags -->
						<%-- <jsp:useBean id="tags" scope="request" type="java.util.List<java.lang.String>"/> --%>
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
			</form>
		</c:if>

		<c:if test="${isOwner && !sessionScope.admin}">
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

						<!-- Remove Listing -->
						<button type="submit" class="remove-btn" formaction="<c:url value="/App/RemoveArtwork"/>"
								onsubmit="return confirm('Are you sure you want to remove this listing?');">
							Remove Listing
						</button>
					</div>

					<!-- Display tags -->
						<%-- <jsp:useBean id="tags" scope="request" type="java.util.List<java.lang.String>"/> --%>
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
			</form>
		</c:if>

		<!-- Check if user is admin and not owner (allowed bidding) -->
		<c:if test="${sessionScope.admin && !isOwner}">
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
					<p><a href="<c:url value="/App/UserProfile?user=${ownerDisplayName}"/>"
						  class="link">${ownerDisplayName}</a></p>


					<!-- save favorite artwork functionality -->
					<div>
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
						<br>
						<a href="<c:url value="EditArtwork?id=${artwork.id }"/>" class="edit-button">Edit Artwork</a>
					</div>
					<hr width="100%" size="2">
					<c:if test="${winningUser}">
						<p>You WON!!!</p>
						<!-- purchase artwork functionality -->
						<form action="<c:url value="/App/PurchaseArtwork"/>" method="post">

							<input type="hidden" name="artworkID" value="${artwork.id}">
							<input type="hidden" name="userID" value="${userID}">

							<button type="submit" name="action" value="Purchase" class="purchase-btn">Purchase</button>
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

							<script>
                                var timestamp = "${auction.endTimestamp}";
                                var artworkId = "${artwork.id}";
                                if (timestamp && !isNaN(Date.parse(timestamp))) {
                                    countdown(timestamp, artworkId);
                                }
							</script>

						</div>
					</c:if>

				</div>
			</div>
		</c:if>

		<!-- For non owner page-->
		<!-- Iterate over the artwork list and display each artwork -->
		<c:if test="${!isOwner && !sessionScope.admin}">
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
					<p><a href="<c:url value="/App/UserProfile?user=${ownerDisplayName}"/>"
						  class="link">${ownerDisplayName}</a></p>


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
		</c:if>

	</jsp:body>
</layout:base>
