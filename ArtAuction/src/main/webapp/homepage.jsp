<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="myapp/homepage-style.css" type="text/css"/>
		<script src="myapp/main.js"></script>
		<title>Homepage</title>
	</head>
	<body>
		<!--<p>homepage</p> -->

		<header class="header">
			<div class="header-left">
				<h2>
					<a href="homepage.jsp" class="logo">ART AUCTION</a>
				</h2>
			</div>
			<div class="header-mid">
				<form action="SearchArtwork" method="post">
					<input type="text" class="search-box" placeholder="Search..." name="searchText">
					<button type="submit" class="search-button">Search</button>
				</form>
			</div>
			<div class="header-right">
				
				<!-- login is shown when first visit. change to logout + profile + upload when user is logged in  -->
				<c:choose>
				<c:when test="${not empty sessionScope.email}">
				<a href="art-upload-form.jsp" class="upload-btn">ImageUpload</a>
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
		<header>
			<section class="search-results" id="gallery">
					<div class="container">
						<h2>Search Results</h2>
						<div class="art-grid">

							<!-- Iterate over the artwork list and display each artwork -->
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
		</header>


	</body>
