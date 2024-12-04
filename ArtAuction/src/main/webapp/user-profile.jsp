<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags/components"%>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layouts"%>
<jsp:useBean id="viewedUser" scope="request" type="artauction.user.User" />
<jsp:useBean id="myProfile" scope="request" type="java.lang.Boolean" />

<layout:base>
	<jsp:attribute name="head">
        <link rel="stylesheet" href="myapp/css/user-profile-style.css"
			type="text/css" />
        <title>My Profile</title>
    </jsp:attribute>
	<jsp:body>
        <div class="profile-container">
            <!-- Profile Card -->
            <div class="profile-card">
                <c:if test="${myProfile}">
                    <div class="profile-img">
                        <img
							src="<c:url value='myapp/images/${image.filename}'/>"
							alt="Profile Picture" class="profile-pic">
                    </div>
                    <div class="profile-details">
                        <h2 class="display-name">${viewedUser.displayName} <c:if
								test="${sessionScope.admin}">[Admin]</c:if>
						</h2>
                        <h2 class="name">${viewedUser.name}</h2>
                        <br>
                        <hr width="100%" size="2">
                        <br>
                        <form action="UserProfile" method="POST"
							enctype="multipart/form-data" class="new-pfp">
                            <label for="profilepicture">New profile picture:</label>
                            <input id="profilepicture"
								name="profilepicture" accept="image/*" type="file">
                            <br>
                            <button type="submit" name="action"
								value="editProfilePicture" class="submit-pfp">Submit</button>
                        </form>
                        <button onclick="toggleFollowingList()"
							id="followingBtn" class="follow">${followingCount} <br> Following</button>
                        <button onclick="toggleFollowersList()"
							id="followersBtn" class="follow">${followerCount} <br> Followers</button>
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
                </c:if>
                <c:if test="${!myProfile}">
                    <div class="profile-img">
                        <img
							src="<c:url value='myapp/images/${otherImage.filename}'/>"
							alt="Profile Picture" class="profile-pic">
                    </div>
                    <div class="profile-details">
                        <h2 class="display-name">${viewedUser.displayName}</h2>
                        <h2 class="name">${viewedUser.name}</h2>
                        <br>
                        <hr width="100%" size="2">
                        <br>
                        <button onclick="toggleFollowingList()"
							id="followingBtn" class="follow">${followingCount} <br> Following</button>
                        <button onclick="toggleFollowersList()"
							id="followersBtn" class="follow">${followerCount} <br> Followers</button>
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
                        <form action="UserProfile" method="post">
                            <input type="hidden" name="followedUserId"
								value="${viewedUser.id}">
                            <input type="hidden" name="displayName"
								value="${viewedUser.displayName}">
                            <c:choose>
                                <c:when test="${isFollowed}">
                                    <button type="submit" name="action"
										value="unfollow" class="follow">Unfollow</button>
                                </c:when>
                                <c:otherwise>
                                    <button type="submit" name="action"
										value="follow" class="follow">Follow</button>
                                </c:otherwise>
                            </c:choose>
                        </form>
                    </div>
                </c:if>
            </div>
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
                <c:choose>
                    <c:when test="${not empty requestScope.artworkList}">
                        <c:forEach var="artwork"
							items="${requestScope.artworkList}">
                            <ui:artitem artwork="${artwork}" />
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
                            <c:choose>
                                <c:when
									test="${not empty requestScope.favArtworkList}">
                                    <c:forEach var="favArtwork"
										items="${favArtworkList}">
                                        <ui:artitem
											artwork="${favArtwork}" />
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
        </c:if>
        <script src="myapp/javascript/user-profile.js"></script>
    </jsp:body>
</layout:base>
