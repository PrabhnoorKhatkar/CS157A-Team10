<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags/components"%>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layouts"%>
<!DOCTYPE html>

<layout:base>
	<jsp:attribute name="head">
		<link rel="stylesheet" href="<c:url value="/myapp/css/homepage-style.css"/>" type="text/css"/>
		<title>Homepage</title>
	</jsp:attribute>
	<jsp:body>
		<!--<p>homepage</p> -->
		<div class="flex flex-column align-center">
			<h1>Featured artworks:</h1>
			<div class="slideshow-container">
				<div class="slideshow-slide">
					<jsp:useBean id="featuredArtworks" scope="request" type="artauction.Artwork[]"/>
					<c:forEach var="artwork" items="${featuredArtworks}">
						<ui:featured artwork="${artwork}"/>
					</c:forEach>
					<a class="prev" onclick="plusSlides(-1)">❮</a>
					<a class="next" onclick="plusSlides(1)">❯</a>
				</div>
				<div class="slideshow-controls" style = "text-align:center">
					<span class="dot" onclick="currentSlide(1)"></span>
					<span class="dot" onclick="currentSlide(2)"></span>
					<span class="dot" onclick="currentSlide(3)"></span>
				</div>
			</div>
		</div>
		<br>
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

	</jsp:body>
</layout:base>