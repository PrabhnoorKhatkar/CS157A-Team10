<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fn" uri="jakarta.tags.functions"%>
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
				<a href="/ArtAuction" class="logo">ART AUCTION</a>
			</h2>
		</div>

		<div class="header-right">

			<a href="art-upload-form.jsp" class="upload-btn">Artwork Upload</a>

			<form action="Logout" method="post">
				<button type="submit" class="logout-btn">Log Out</button>
			</form>

			<a href="UserProfile" class="profile-btn"> <img
				src="myapp/temporary-pic.jpg" alt="profile pic" width="64"
				height="64">
			</a>
		</div>
	</header>

	<div class="profile-container">

		<img src="myapp/temporary-pic.jpg" alt="Profile Picture"
			class="profile-pic">

		<h2 class="Name: ">Name: ${user.name}</h2>
		<h2 class="Display Name ">Display Name: ${user.displayName}</h2>

		<c:if test="${myProfile}">
			<p>${followingCount}Following</p>
			<c:forEach items="${followingUsersList}" var="user">
				<p>${user.displayName}</p>
			</c:forEach>
			<p>${followerCount}Followers</p>
			<c:forEach items="${getFollowerUsersList}" var="user">
				<p>${user.displayName}</p>
			</c:forEach>
		</c:if>

		<c:if test="${!myProfile}">

			<button>${followingCount}Following</button>
			<c:forEach items="${followingUsersList}" var="user">
				<p>${user.displayName}</p>
			</c:forEach>
			<button>${followerCount}Followers</button>
			<c:forEach items="${getFollowerUsersList}" var="user">
				<p>${user.displayName}</p>
			</c:forEach>
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
		<h2>My Artwork</h2>
		<div class="art-grid">

			<!-- Iterate over the artwork list and display each artwork -->
			<c:choose>
				<c:when test="${not empty requestScope.artworkList}">
					<c:forEach var="artwork" items="${requestScope.artworkList}">
						<div class="art-item">
							<a href="ArtworkPage?id=${artwork.id}" class="art-item-link">

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
					<div>(no artworks)</div>
				</c:otherwise>
			</c:choose>



		</div>
	</div>

	<c:if test="${myProfile}">
		<div class="saved-artwork">
			<section class="search-results" id="gallery">
				<div class="container">
					<h2>Favorites</h2>
					<div class="art-grid">

						<!-- Iterate over the artwork list and display each artwork -->
						<c:choose>
							<c:when test="${not empty requestScope.favArtworkList}">
								<c:forEach var="favArtworkList"
									items="${requestScope.favArtworkList}">
									<div class="art-item">
										<a href="ArtworkPage?id=${favArtworkList.id}"
											class="art-item-link">


											<h3>${favArtworkList.title}</h3>
											<p>
												Description:
												<c:choose>
													<c:when
														test="${fn:length(favArtworkList.description) > 45}">
												${fn:substring(favArtworkList.description, 0, 45)}...
											</c:when>
													<c:otherwise>
												${favArtworkList.description}
											</c:otherwise>
												</c:choose>
											</p>

											<p>By: ${favArtworkList.artist}</p>
										</a>
									</div>
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
</body>
</html>