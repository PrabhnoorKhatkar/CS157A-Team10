<%@ tag description="Displays an artwork as a vertical card"%>
<%@ attribute name="artwork" required="true" type="artauction.Artwork"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<a href="<c:url value="/App/ArtworkPage?id=${artwork.id}"/>" class="">
	<sl-card class="justify-between art-item animated-card" style="--border-radius: 20px">
<%--		<div class="glow"></div>--%>
		<div slot="header">
			<span class="font-semibold">
				${artwork.title}
			</span>
			<br>
			By: ${artwork.artist}
		</div>
		<span slot="image" class="w-full">
			<c:forEach var="artImage" items="${artwork.images}">
				<img src="<c:url value="/Uploads/${artImage.imageId}"/>" class="object-cover w-full h-40">
			</c:forEach>
		</span>


		<div class="art-details min-h-28 flex flex-col justify-between">
			<p>
				<c:choose>
					<c:when test="${fn:length(artwork.description) > 60}">
						${fn:substring(artwork.description, 0, 60)}...
					</c:when>
					<c:otherwise>
						${artwork.description}
					</c:otherwise>
				</c:choose>
			</p>
			<div>
				<span class="font-light">Status: </span><sl-badge variant="neutral" pill>${artwork.auctionDetails.result}</sl-badge>
			</div>
		</div>
		<div slot="footer" class="min-h-8 flex flex-row justify-between items-center">
			<div id="countdown-${artwork.id}"></div>
			<span class="font-bold">
				$${artwork.auctionDetails.amount}
			</span>
			<script src="<c:url value="/myapp/javascript/countdown.js"/>"></script>
			<script>
                var timestamp = "${artwork.auctionDetails.endTimestamp}";
                var artworkId = "${artwork.id}";
                if (timestamp && !isNaN(Date.parse(timestamp))) {
                    countdown(timestamp, artworkId);
                }
			</script>
		</div>
	</sl-card>
</a>
