<%@ tag description="Displays an artwork as a vertical card"%>
<%@ attribute name="artwork" required="true" type="artauction.Artwork"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<div class="mySlides fade">
	<div class ="featured-card">
	<div class = "div-left">
		<a href="<c:url value="/App/ArtworkPage?id=${artwork.id}"/>">
			<c:forEach var="artImage" items="${artwork.images}">
			<img src="<c:url value="/Uploads/${artImage.imageId}"/>" class="featured-img" width="400" height="400">
		</c:forEach>
		</a>
	</div>
	<div class = "div-right">
		<h5>Featured Artwork</h5>
  		<h3 class ="f-h3">${artwork.title}</h3>
		<p class ="f-p">
			${artwork.description}
		</p>

		<p class ="info">By: ${artwork.artist}</p>
		<p class ="info">Status: ${artwork.auctionDetails.result}</p>
		<p class ="info">Amount: ${artwork.auctionDetails.amount}</p>

		<p class ="info"> 
			<c:set var="timestamp" value="${artwork.auctionDetails.endTimestamp}" />
		</p>
		
		<div id="countdown-${artwork.id}"></div>
	</div>
	</div>
	<script>
		var timestamp = "${artwork.auctionDetails.endTimestamp}";
		var artworkId = "${artwork.id}";
		if (timestamp && !isNaN(Date.parse(timestamp))) {
			countdown(timestamp, artworkId);
		}
	</script>
	<script src="<c:url value="/myapp/javascript/countdown.js"/>"></script>

</div>
