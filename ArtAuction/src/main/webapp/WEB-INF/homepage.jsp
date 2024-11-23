<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<c:url value="/myapp/css/homepage-style.css"/>" type="text/css"/>
		<%-- <script src="<c:url value="/myapp/main.js"/>"></script> --%>
		<title>Homepage</title>
	</head>
	<body>
		<!--<p>homepage</p> -->

		<header class="header">
			<div class="header-left">
				<h2>
					<a href="<c:url value="/"/>" class="logo">ART AUCTION</a>
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
						<a href="<c:url value="/art-upload-form.jsp"/>" class="upload-btn">Artwork Upload</a>
						<form action="Logout" method="post">
							<button type="submit" class="logout-btn">Log Out</button>
						</form>
						<a href="UserProfile" class="profile-btn"> <img
								src="myapp/temporary-pic.jpg" alt="profile picture" width="64"
								height="64">
						</a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value="/login.jsp"/>" class="login-btn">Log In</a>
						<a href="<c:url value="/register.jsp"/>" class="signup-btn">Sign Up</a>
					</c:otherwise>
				</c:choose>

			</div>
		</header>
		<header>
			<section class="featured-artwork" id="gallery">
				<h2>Featured Artwork</h2>
				<div class="container">
					<div class="art-grid">
						<jsp:useBean id="featuredArtworks" scope="request" type="ArtAuction.Artwork[]"/>
						<c:forEach var="artwork" items="${featuredArtworks}">
							<ui:artitem artwork="${artwork}"/>
						</c:forEach>
					</div>
				</div>
			</section>
		</header>
		<header>
			<section class="search-results" id="search-gallery">
				<div class="container">
					<h2>Search Results</h2>
					<div class="art-grid">

						<!-- Iterate over the artwork list and display each artwork -->
						<c:choose>
							<c:when test="${not empty requestScope.artworkList}">
								<c:forEach var="artwork" items="${requestScope.artworkList}">
									<ui:artitem artwork="${artwork}"/>
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
</html>
