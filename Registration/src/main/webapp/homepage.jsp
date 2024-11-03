<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="myapp/homepage-style.css" type="text/css" />
<script src="myapp/main.js"></script>
<title>Homepage</title>
</head>
<body>

	<header class="header">
		<div class="header-left">
			<h2>
				<a href="homepage.jsp" class="logo">ART AUCTION</a>
			</h2>
		</div>
		<div class="header-right">
			<!-- login is shown when first visit. change to logout + profile + upload when user is logged in  -->
			<c:choose>
				<c:when test="${not empty sessionScope.email}">

					<a href="art-upload-form.jsp" class="upload-btn">Upload</a>

					<form action="Logout" method="post">
						<button type="submit" class="logout-btn">Log Out</button>
					</form>

					<a href="user-profile.jsp" class="profile-btn"> <img
						src="myapp/temporary-pic.jpg" alt="profile picture" width="64"
						height="64">
					</a>
				</c:when>
				<c:otherwise>
					<a href="login.jsp" class="login-btn">Log In</a>
				</c:otherwise>
			</c:choose>

		</div>
	</header>

	<div class="search-form-container">
		<form action="SearchArtwork" method="post">
			<input type="text" class="search-box" placeholder="Search..."
				name="searchText">
			<button type="submit" class="search-button">Search</button>
		</form>
	</div>

	<section class="featured-artwork" id="gallery">
		<h2>Featured Artwork</h2>
		<div class="container">
			<div class="art-grid">
				<div class="art-item">
					<img src="myapp/temporary-pic.jpg" alt="Artwork 1">
					<h3>The Eternal Dream</h3>
					<p>Artist: Jane Doe</p>
					<p>Starting Bid: $5,000</p>
					<button type="submit" class="save-btn">Save</button>
				</div>
				<div class="art-item">
					<img src="myapp/temporary-pic.jpg" alt="Artwork 2">
					<h3>Colors of the Wind</h3>
					<p>Artist: John Smith</p>
					<p>Starting Bid: $8,000</p>
					<button type="submit" class="save-btn">Save</button>
				</div>
				<div class="art-item">
					<img src="myapp/temporary-pic.jpg" alt="Artwork 3">
					<h3>Whispers in Time</h3>
					<p>Artist: Alice Brown</p>
					<p>Starting Bid: $12,000</p>
					<button type="submit" class="save-btn">Save</button>
				</div>
			</div>
		</div>
	</section>

	<section class="search-results" id="gallery">
		<h2>Search Results</h2>
		<h2>Show Results</h2>

		<div class="container">
			<div class="art-grid">

				<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

				<!-- Iterate over the artwork list and display each artwork -->
				<c:forEach var="artwork" items="${artworkList}">
					<a href="ArtworkPage?id=${artwork.artID}" class="art-item-link">
						<div class="art-item">
							<h3>${artwork.title}</h3>
							<p>Starting Bid: $${artwork.startingPrice}</p>
							<p>Description: ${artwork.description}</p>
							<button type="submit" class="save-btn">Save</button>
						</div>
					</a>
				</c:forEach>

			</div>
		</div>
	</section>


</body>
</html>