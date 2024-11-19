<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="myapp/homepage-style.css" type="text/css" />
<script src="myapp/main.js"></script>
<title>Homepage</title>
</head>
<body>
	<!--<p>homepage</p> -->

	<header class="header">
		<div class="header-left">
			<h2>
				<a href="${pageContext.request.contextPath}/" class="logo">ART AUCTION</a>
			</h2>
		</div>
		<div class="header-mid">
			<form action="SearchArtwork" method="post">
				<input type="text" class="search-box" placeholder="Search..."
					name="searchText">
				<button type="submit" class="search-button">Search</button>
			</form>
		</div>
		<div class="header-right">

			<!-- login is shown when first visit. change to logout + profile + upload when user is logged in  -->
			<c:choose>
				<c:when test="${not empty sessionScope.email}">
					<a href="art-upload-form.jsp" class="upload-btn">Artwork Upload</a>
					<form action="Logout" method="post">
						<button type="submit" class="logout-btn">Log Out</button>
					</form>
					<a href="UserProfile" class="profile-btn"> <img
						src="myapp/temporary-pic.jpg" alt="profile picture" width="64"
						height="64">
					</a>
				</c:when>
				<c:otherwise>
					<a href="login.jsp" class="login-btn">Log In</a>
					<a href="register.jsp" class="signup-btn">Sign Up</a>
				</c:otherwise>
			</c:choose>

		</div>
	</header>
	<header>
		<section class="featured-artwork" id="gallery">
			<h2>Featured Artwork</h2>
			<div class="container">
				<div class="art-grid">
					<div class="art-item">
						<img src="myapp/temporary-pic.jpg" alt="Artwork 1">
						<h3>The Eternal Dream</h3>
						<p>Artist: Jane Doe</p>
						<p>Starting Bid: $5,000</p>
					</div>
					<div class="art-item">
						<img src="myapp/temporary-pic.jpg" alt="Artwork 2">
						<h3>Colors of the Wind</h3>
						<p>Artist: John Smith</p>
						<p>Starting Bid: $8,000</p>
					</div>
					<div class="art-item">
						<img src="myapp/temporary-pic.jpg" alt="Artwork 3">
						<h3>Whispers in Time</h3>
						<p>Artist: Alice Brown</p>
						<p>Starting Bid: $12,000</p>
					</div>
				</div>
			</div>
		</section>
	</header>
	<header>
		<section class="search-results" id="gallery">
			<div class="container">
				<h2>Search Results</h2>
				<div class="art-grid">

					<!-- Iterate over the artwork list and display each artwork -->
					<c:choose>
						<c:when test="${not empty requestScope.artworkList}">
							<c:forEach var="artwork" items="${requestScope.artworkList}">
								<div class="art-item">
									<a href="ArtworkPage?id=${artwork.id}" class="art-item-link">

										<img src="myapp/images/${artwork.filepath}">
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
									</a>
								</div>

							</c:forEach>
						</c:when>
						<c:otherwise>
							<div>(no artwork)</div>
						</c:otherwise>
					</c:choose>


				</div>
			</div>
		</section>
	</header>

</body>