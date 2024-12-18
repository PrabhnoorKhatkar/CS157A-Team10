<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags/components" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<jsp:useBean id="viewedUser" scope="request" type="artauction.user.User"/>
<jsp:useBean id="myProfile" scope="request" type="java.lang.Boolean"/>

<layout:base>
	<jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value='/myapp/css/user-profile-style.css'/>" type="text/css"/>
        <title>My Profile</title>
    </jsp:attribute>
	<jsp:body>
		<ui:main-header/>
		<br>
		<main>

		<div class="profile-container">
			<!-- Profile Card -->
			<div class="profile-card">
				<div class="profile-img">
					<ui:avatar user="${viewedUser}" size="150px"/>
				</div>
				<div class="profile-details">
					<h2 class="display-name">
							${viewedUser.displayName} <c:if test="${sessionScope.admin}">[Admin]</c:if>
					</h2>
					<h2 class="name font-bold">${viewedUser.name}</h2>
					<br>
					<hr width="100%" size="2">
					<br>
					<c:if test="${myProfile}">
						<form action="<c:url value="/App/UserProfile"/>" method="POST"
							  enctype="multipart/form-data" class="new-pfp">
							<label for="profilepicture" class="font-bold">New profile picture:</label>
							<div class="flex flex-row justify-between">
								<input id="profilepicture" name="profilepicture" accept="image/*" type="file">
								<sl-button type="submit" name="action" value="editProfilePicture" class="submit-pfp">
									Submit
								</sl-button>
							</div>
						</form>
					</c:if>
					<c:if test="${!myProfile}">
					<form action="<c:url value="/App/UserProfile"/>" method="post">
							<input type="hidden" name="followedUserId"
								   value="${viewedUser.id}">
							<input type="hidden" name="displayName"
								   value="${viewedUser.displayName}">
							<c:choose>
								<c:when test="${isFollowed}">
									<sl-button type="submit" name="action"
											value="unfollow" class="follow">Unfollow
									</sl-button>
								</c:when>
								<c:otherwise>
									<sl-button type="submit" name="action"
											value="follow" class="follow">Follow
									</sl-button>
								</c:otherwise>
							</c:choose>
						</form>
					</c:if>
					<sl-button onclick="toggleFollowingList()"
							id="followingBtn" class="follow">${followingCount} Following
					</sl-button>
					<sl-button onclick="toggleFollowersList()"
							id="followersBtn" class="follow">${followerCount} Followers
					</sl-button>
					<br><br>
					<div id="followingList" style="display: none;">
						<c:forEach items="${followingUsersList}"
								   var="followingUser">
							<a
									href="<c:url value='UserProfile?user=${followingUser.displayName}'/>"
									class="display-follow">${followingUser.displayName}</a>
						</c:forEach>
					</div>
					<div id="followersList" style="display: none;">
						<c:forEach items="${getFollowerUsersList}"
								   var="follower">
							<a
									href="<c:url value='UserProfile?user=${follower.displayName}'/>"
									class="display-follow">${follower.displayName}</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="user-artwork">
			<div class="buttons flex flex-row justify-center gap-4">
				<sl-button-group>
					<c:choose>
						<c:when test="${myProfile}">
							<sl-button onclick="toggleArtworkList()"
									   id="artworkBtn" class="artwork-btn">My Artwork
							</sl-button>
							<sl-button onclick="toggleFavoriteList()"
									   id="favoriteBtn" class="favorite-btn">Favorites
							</sl-button>
							<sl-button onclick="toggleOrderList()"
									   id="orderBtn" class="order-btn">Order History
							</sl-button>
							<!-- <h2>My Artwork</h2>-->
						</c:when>
						<c:otherwise>
							<sl-button onclick="toggleArtworkList()"
									   id="artworkBtn" class="artwork-btn">${viewedUser.displayName}'s Artwork
							</sl-button>
							<!-- <h2>${viewedUser.displayName}'s Artwork</h2> -->
						</c:otherwise>
					</c:choose>
				</sl-button-group>
			</div>
			<div class="art-grid">
				<c:choose>
					<c:when test="${not empty requestScope.artworkList}">
						<div id="artworkList">
							<c:forEach var="artwork"
									   items="${requestScope.artworkList}">
								<ui:artitem artwork="${artwork}"/>
							</c:forEach>
						</div>
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
					<div class="register-card" id="favoriteList" style="display: none;">

						<!--    <h2>Favorites</h2> -->
						<div class="art-grid">
							<c:choose>

								<c:when test="${not empty requestScope.favArtworkList}">
									<jsp:useBean id="favArtworkList" scope="request" type="java.util.List"/>
									<c:forEach var="favArtwork"
											   items="${favArtworkList}">
										<ui:artitem
												artwork="${favArtwork}"/>
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
			<div class="order-history" id="orderList" style="display: none;">
			<c:choose>
					<c:when test="${not empty requestScope.getOrderList}">
						<table class="tbl-order">
							<thead>
								<tr>
									<th>Order ID</th>
									<th>Date</th>
									<th>Tracking Number</th>
									<th>Status</th>
									<th>Total Paid</th>
								</tr>
							</thead>
							<c:forEach items="${requestScope.getOrderList}"
									   var="order">
								<tbody>
									<tr>
										<td>${order.orderID}</td>
										<td>${order.purchasedTime}</td>
										<td>${order.tracking}</td>
										<td>${order.status}</td>
										<td>${order.total}</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
						<div>(no orders)</div>
					</c:otherwise>
			</c:choose>
			</div>
		</c:if>
		<script src="<c:url value='/myapp/javascript/user-profile.js'/>"></script>
		</main>
		<footer>
		<jsp:useBean id="admin" scope="session" type="java.lang.Boolean"/>
		<c:if test="${myProfile and not admin}">
			<sl-button href="<c:url value="/App/adminsignup.jsp"/>">
				Sign up for admin.
			</sl-button>
		</c:if>
		</footer>
	</jsp:body>
</layout:base>
