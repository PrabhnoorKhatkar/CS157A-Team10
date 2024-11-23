<%@ tag description="Displays an artwork as a vertical card"%>
<%@ attribute name="artwork" required="true" type="ArtAuction.Artwork"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="art-item">
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
		<p>Result: ${artwork.auctionDetails.result}</p>
		<p>Amount: ${artwork.auctionDetails.amount}</p>

		<p>
			<c:set var="timestamp" value="${artwork.auctionDetails.endTimestamp}" />
			<c:out value="${timestamp}" />
		</p>
		
		<div id="countdown-${artwork.id}"></div>
	</a>

	<script>
		function countdown(inputDate, artworkId) {
			console.log("Countdown function loaded for artwork:", artworkId);
			var countDownDate = new Date(inputDate).getTime();

			var x = setInterval(function() {
				var now = new Date().getTime();
				var distance = countDownDate - now;

				var days = Math.floor(distance / (1000 * 60 * 60 * 24));
				var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
				var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
				var seconds = Math.floor((distance % (1000 * 60)) / 1000);

				var countdownElement = document.getElementById("countdown-" + artworkId);
				if (countdownElement) {
					countdownElement.innerHTML = days + "d " + hours + "h " + minutes + "m " + seconds + "s ";
				}

				if (distance < 0) {
					clearInterval(x);
					if (countdownElement) {
						countdownElement.innerHTML = "ENDED";
					}
				}
			}, 1000);
		}

		var timestamp = "${timestamp}";
		var artworkId = "${artwork.id}";
		if (timestamp && !isNaN(Date.parse(timestamp))) {
			countdown(timestamp, artworkId);
		}
	</script>


</div>
