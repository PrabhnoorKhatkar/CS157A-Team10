<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="myapp/user-profile-style.css"
	type="text/css" />
<title>My Profile</title>
</head>
<body>

	<header class="profile-header">
		<div class="header-left">
			<h2>
				<a href="homepage.jsp" class="logo">ART AUCTION</a>
			</h2>
		</div>

		<div class="header-right">

			<a href="art-upload-form.jsp" class="upload-btn">ImageUpload</a>

			<button class="logout-btn">Log Out</button>

			<a href="user-profile.jsp" class="profile-btn"> <img
				src="myapp/temporary-pic.jpg" alt="profile pic" width="64"
				height="64">
			</a>
		</div>
	</header>

	<div class="profile-container">

		<img src="myapp/temporary-pic.jpg" alt="Profile Picture"
			class="profile-pic">

		<h2 class="username">Username</h2>

	</div>

	<div class="user-artwork">
		<h2>My Artwork</h2>
		<div class="art-grid">

			<div class="art-item">
				<a href="ArtworkPage?artworkId=${artwork.artID}"
					class="art-item-link">
					<h3>${artwork.title}Title1</h3>
					<p>Starting Bid: $${artwork.startingPrice}</p>
					<p>Description: ${artwork.description}</p>
				</a>
			</div>

			<div class="art-item">
				<a href="ArtworkPage?artworkId=${artwork.artID}"
					class="art-item-link">
					<h3>${artwork.title}Title2</h3>
					<p>Starting Bid: $${artwork.startingPrice}</p>
					<p>Description: ${artwork.description}</p>
				</a>
			</div>

			<div class="art-item">
				<a href="ArtworkPage?artworkId=${artwork.artID}"
					class="art-item-link">
					<h3>${artwork.title}Title3</h3>
					<p>Starting Bid: $${artwork.startingPrice}</p>
					<p>Description: ${artwork.description}</p>
				</a>
			</div>
		</div>
	</div>

	<div class="saved-artwork">
		<section class="search-results" id="gallery">
			<div class="container">
				<h2>Favorites</h2>
				<div class="art-grid">

					<c:choose>
						<c:when test="${not empty requestScope.artworkList}">
							<c:forEach var="artwork" items="${requestScope.artworkList}">
								<a href="ArtworkPage?id=${artwork.id}" class="art-item-link">
									<div class="art-item">

										<h3>${artwork.title}</h3>
										<p>Description: ${artwork.description}</p>
								</a>
				</div>
				</a>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<div>(no artworks)</div>
				</c:otherwise>
				</c:choose>


			</div>
	</div>
	</section>
	</div>

</body>
</html>