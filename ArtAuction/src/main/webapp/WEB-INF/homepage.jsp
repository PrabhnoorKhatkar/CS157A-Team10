<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags/components"%>
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
					<label>
						<input type="text" class="search-box" placeholder="Search..."
							   name="searchText">
					</label>
					<button type="submit" class="search-button">Search</button>
				</form>
			</div>
			<div class="header-right">
				<!-- login is shown when first visit. change to logout + profile + upload when user is logged in  -->
				<c:choose>
					<c:when test="${not empty sessionScope.user}">
						<a href="<c:url value="/art-upload-form.jsp"/>" class="upload-btn">Artwork Upload</a>
						<form action="Logout" method="post">
							<button type="submit" class="logout-btn">Log Out</button>
						</form>
						<a href="UserProfile" class="profile-btn"> <img
								src="<c:url value="/myapp/images/${image.filename}"/>" alt="profile picture" width="64"
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
		<br>
		<header class = "slideshow-container">
			<!-- <div class="featured-artwork" id="gallery"> -->
				<!-- <h2>Featured Artwork</h2> -->
			<!-- 	<div class="slideshow-container"> -->
			<div>
				<jsp:useBean id="featuredArtworks" scope="request" type="artauction.Artwork[]"/>
					<c:forEach var="artwork" items="${featuredArtworks}">
						<ui:featured artwork="${artwork}"/>
					</c:forEach>
					
			<!-- 	</div> -->
				
				
			<!-- </div> -->
			</div>
		</header>
		<br>
			<a class="prev" onclick="plusSlides(-1)">❮</a>
			<a class="next" onclick="plusSlides(1)">❯</a>
			<div style = "text-align:center">
				<span class="dot" onclick="currentSlide(1)"></span>
				<span class="dot" onclick="currentSlide(2)"></span>
				<span class="dot" onclick="currentSlide(3)"></span>
			</div>
			<script src="<c:url value="myapp/javascript/slideshow.js"/>"></script>

		<header>
			<section class="search-results" id="search-gallery">
				<div class="container">
					<h2>Search Results</h2>
					<div class="art-grid">

						<!-- Iterate over the artwork list and display each artwork -->
						<c:choose>
							<c:when test="${not empty requestScope.artworkList}">
								<jsp:useBean id="artworkList" scope="request" type="java.util.List<artauction.Artwork>"/>
								<c:forEach var="artwork" items="${artworkList}">
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
