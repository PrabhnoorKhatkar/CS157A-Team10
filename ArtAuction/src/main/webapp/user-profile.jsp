<jsp:useBean id="viewedUser" scope="request" type="artauction.user.User"/>
<jsp:useBean id="myProfile" scope="request" type="java.lang.Boolean"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags/components"%>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layouts"%>
<layout:base>
		<jsp:attribute name="head">
			<link rel="stylesheet" href="myapp/css/user-profile-style.css" type="text/css" />
			<title>My Profile</title>
		</jsp:attribute>
		<jsp:body>

			<div class="profile-container">

				<c:if test="${myProfile}">
					<ui:avatar user="${viewedUser}"/>

					<h2 class="name">Name: ${viewedUser.name}</h2>
					<h2 class="display-name">Display Name: ${viewedUser.displayName}</h2>

					<c:if test="${sessionScope.admin}">Admin</c:if>
					<form action="UserProfile" method="POST" enctype="multipart/form-data">
						<label for="profilepicture">New profile picture:</label><input id="profilepicture" name="profilepicture" accept="image/*" type="file">
						<button type="submit" name="action" value="editProfilePicture">Submit</button>
					</form>


					<button onclick="toggleFollowingList()" id="followingBtn">${followingCount} Following</button>

					<div id="followingList" style="display: none;">

						<c:forEach items="${followingUsersList}" var="followingUser">
							<a href="<c:url value="UserProfile?user=${followingUser.displayName}"/>">${followingUser.displayName}</a>
						</c:forEach>

					</div>

					<button onclick="toggleFollowersList()" id="followersBtn">${followerCount} Followers</button>

					<div id="followersList" style="display: none;">
						<c:forEach items="${getFollowerUsersList}" var="follower">
							<a href="<c:url value="UserProfile?user=${follower.displayName}"/>">${follower.displayName}</a>
						</c:forEach>
					</div>
				</c:if>

				<c:if test="${!myProfile}">
					<ui:avatar user="${viewedUser}"/>

					<h2 class="name">Name: ${viewedUser.name}</h2>
					<h2 class="display-name">Display Name: ${viewedUser.displayName}</h2>

					<c:if test="${sessionScope.admin}">Admin</c:if>
					<button onclick="toggleFollowingList()" id="followingBtn">${followingCount} Following</button>

					<div id="followingList" style="display: none;">
						<c:forEach items="${followingUsersList}" var="followingUser">
							<a href="<c:url value="UserProfile?user=${followingUser.displayName}"/>">${followingUser.displayName}</a>
						</c:forEach>
					</div>

					<button onclick="toggleFollowersList()" id="followersBtn">${followerCount} Followers</button>

					<div id="followersList" style="display: none;">
						<c:forEach items="${getFollowerUsersList}" var="follower">
							<a href="<c:url value="UserProfile?user=${follower.displayName}"/>">${follower.displayName}</a>
						</c:forEach>
					</div>

					<form action="UserProfile" method="post">
						<input type="hidden" name="followedUserId" value="${viewedUser.id}">
						<input type="hidden" name="displayName" value="${viewedUser.displayName}">

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
						<h2>${viewedUser.displayName}'s Artwork</h2>
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
										<jsp:useBean id="artworkList" scope="request" type="java.util.List<artauction.Artwork>"/>
								<c:forEach var="favArtwork"
												   items="${favArtworkList}">
											<ui:artitem artwork="${favArtwork}"/>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div>(no artwork)</div>
									</c:otherwise>
								</c:choose>



							</div>
						</div>
					</section>
				</div>
			</c:if>

			<script src="myapp/javascript/user-profile.js"></script>
		</jsp:body>
</layout:base>