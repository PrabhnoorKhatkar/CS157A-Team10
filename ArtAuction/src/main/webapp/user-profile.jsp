<jsp:useBean id="user" scope="request" type="artauction.user.User"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags/components"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="myapp/css/user-profile-style.css"
	type="text/css" />
<title>My Profile</title>
</head>
<body>

	<header class="profile-header">
		<div class="header-left">
			<h2>
				<a href="<c:url value="/"/>" class="logo">ART AUCTION</a>
			</h2>
		</div>

		<div class="header-right">

			<a href="art-upload-form.jsp" class="upload-btn">Artwork Upload</a>

			<form action="Logout" method="post">
				<button type="submit" class="logout-btn">Log Out</button>
			</form>

			<a href="UserProfile" class="profile-btn"> <img
				src="<c:url value="myapp/images/${image.filename}"/>" alt="profile pic" width="64"
				height="64">
			</a>
		</div>
	</header>

	<div class="profile-container">
		
		<c:if test="${myProfile}">
			<img src="<c:url value="myapp/images/${image.filename}"/>" alt="Profile Picture" class="profile-pic">

			<h2 class="name">Name: ${user.name}</h2>
			<h2 class="display-name">Display Name: ${user.displayName}</h2>
			
			<c:if test="${sessionScope.admin}">Admin</c:if>
			<form action="UserProfile" method="POST" enctype="multipart/form-data">
				<label for="profilepicture">New profile picture:</label><input id="profilepicture" name="profilepicture" accept="image/*" type="file">
				<button type="submit" name="action" value="editProfilePicture">Submit</button>
			</form>
			
			
			<button onclick="toggleFollowingList()" id="followingBtn">${followingCount} Following</button>
			
			<div id="followingList" style="display: none;">
			
				<c:forEach items="${followingUsersList}" var="user">
					<a href="<c:url value="UserProfile?user=${user.displayName}"/>">${user.displayName}</a>
				</c:forEach>
				
			</div>
			
			<button onclick="toggleFollowersList()" id="followersBtn">${followerCount} Followers</button>
			
			<div id="followersList" style="display: none;">
				<c:forEach items="${getFollowerUsersList}" var="user">
					<a href="<c:url value="UserProfile?user=${user.displayName}"/>">${user.displayName}</a>
				</c:forEach>
			</div>
		</c:if>

		<c:if test="${!myProfile}">
			<img src="<c:url value="myapp/images/${otherImage.filename}"/>" alt="Profile Picture" class="profile-pic">

			<h2 class="name">Name: ${user.name}</h2>
			<h2 class="display-name">Display Name: ${user.displayName}</h2>
			
			<c:if test="${sessionScope.admin}">Admin</c:if>
			<button onclick="toggleFollowingList()" id="followingBtn">${followingCount} Following</button>
			
			<div id="followingList" style="display: none;">
				<c:forEach items="${followingUsersList}" var="user">
					<a href="<c:url value="UserProfile?user=${user.displayName}"/>">${user.displayName}</a>
				</c:forEach>
			</div>
			
			<button onclick="toggleFollowersList()" id="followersBtn">${followerCount} Followers</button>
			
			<div id="followersList" style="display: none;">
				<c:forEach items="${getFollowerUsersList}" var="user">
					<a href="<c:url value="UserProfile?user=${user.displayName}"/>">${user.displayName}</a>
				</c:forEach>
			</div>
			
			<form action="UserProfile" method="post">
				<input type="hidden" name="followedUserId" value="${otherID}">
				<input type="hidden" name="displayName" value="${user.displayName}">

				<c:choose>
					<c:when test="${isFollowed}">
						<!-- Submit form to unfollow when clicked -->
						<button type="submit" name="action" value="unfollow"
							class="follow-btn">Unfollow</button>
					</c:when>
					<c:otherwise>
						<!-- Submit form to follow when clicked -->
						<button type="submit" name="action" value="follow"
							class="follow-btn">Follow</button>
					</c:otherwise>
				</c:choose>
			</form>

		</c:if>
	</div>

	<div class="user-artwork">
		<c:choose>
			<c:when test="${myProfile}">
				<h2>My Artwork</h2>
			</c:when>
			<c:otherwise>
				<h2>${user.displayName}'s Artwork</h2>
			</c:otherwise>
		</c:choose>
		<div class="art-grid">
			<!-- Iterate over the artwork list and display each artwork -->
			<c:choose>
				<c:when test="${not empty requestScope.artworkList}">
					<c:forEach var="artwork" items="${requestScope.artworkList}">
						<ui:artitem artwork="${artwork}"/>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div>(no artworks)</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<jsp:useBean id="myProfile" scope="request" type="java.lang.Boolean"/>
	<c:if test="${myProfile}">
		<div class="saved-artwork">
			<section class="search-results" id="gallery">
				<div class="container">
					<h2>Favorites</h2>
					<div class="art-grid">

						<!-- Iterate over the artwork list and display each artwork -->
						<c:choose>
							<c:when test="${not empty requestScope.favArtworkList}">
								<c:forEach var="favArtwork"
									items="${requestScope.favArtworkList}">
									<ui:artitem artwork="${favArtwork}"/>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div>(no saved artworks)</div>
							</c:otherwise>
						</c:choose>



					</div>
				</div>
			</section>
		</div>
	</c:if>
	
	<script src="myapp/javascript/user-profile.js"></script>
</body>
</html>