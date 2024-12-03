<%@ tag description="Displays an artwork as a vertical card"%>
<%@ attribute name="artwork" required="true" type="ArtAuction.Artwork"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="mySlides fade">
	<header class ="header">
	<div class = "div-left">
		<a href="<c:url value="/ArtworkPage?id=${artwork.id}"/>"
		class="art-item-link"> <c:forEach var="artImage"
			items="${artwork.images}">
			<img src="<c:url value="/Uploads/${artImage.imageId}"/>" class="featured-img" width="600" height="900">
		</c:forEach>
		</a>
	</div>
	<div class = "div-right">
  		<h3 class ="f-h3">${artwork.title}</h3>
		<p class ="f-p">
			${artwork.description}
		</p>

		<p class ="info">By: ${artwork.artist}</p>
		<p class ="info">Result: ${artwork.auctionDetails.result}</p>
		<p class ="info">Amount: ${artwork.auctionDetails.amount}</p>

		<p class ="info"> 
			<c:set var="timestamp" value="${artwork.auctionDetails.endTimestamp}" />
			<c:out value="${timestamp}" />
		</p>
		
		<div id="countdown-${artwork.id}"></div>
	</div>
	</header>
	<script>
		var timestamp = "${artwork.auctionDetails.endTimestamp}";
		var artworkId = "${artwork.id}";
		if (timestamp && !isNaN(Date.parse(timestamp))) {
			countdown(timestamp, artworkId);
		}
	</script>
	<script src="myapp/javascript/countdown.js"></script>

</div>