<%@ tag description="Displays an artwork as a vertical card"%>
<%@ attribute name="artwork" required="true" type="artauction.Artwork"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="art-item animated-card">
	<a href="<c:url value="/ArtworkPage?id=${artwork.id}"/>"
		class="art-item-link"> <c:forEach var="artImage"
			items="${artwork.images}">
			<img src="<c:url value="/Uploads/${artImage.imageId}"/>">
		</c:forEach>
		<h3>${artwork.title}</h3>
		<p>
			Description:
			<c:choose>
				<c:when test="${fn:length(artwork.description) > 45}">
					${fn:substring(artwork.description, 0, 45)}...
				</c:when>
				<c:otherwise>
					${artwork.description}
				</c:otherwise>
			</c:choose>
		</p>

		<p>By: ${artwork.artist}</p>
		<p>Status: ${artwork.auctionDetails.result}</p>
		<p>Amount: ${artwork.auctionDetails.amount}</p>

		<p>
			<c:set var="timestamp" value="${artwork.auctionDetails.endTimestamp}" />
		</p>

		<div id="countdown-${artwork.id}"></div>
		<div class="glow"></div>
	</a>

	
	<script src="myapp/javascript/countdown.js"></script>
	<script>
		var timestamp = "${artwork.auctionDetails.endTimestamp}";
		var artworkId = "${artwork.id}";
		if (timestamp && !isNaN(Date.parse(timestamp))) {
			countdown(timestamp, artworkId);
		}
	</script>


</div>
