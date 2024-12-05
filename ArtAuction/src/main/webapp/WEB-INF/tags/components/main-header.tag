<%@tag description="Header" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags/components" %>

<header class="main-header">
	<div class="header-left">
		<h2>
			<a href="<c:url value="/"/>" class="logo">ART AUCTION</a>
		</h2>
	</div>
	<div class="header-mid">
		<form action="<c:url value="/SearchArtwork"/>" method="post">
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
				<jsp:useBean id="user" scope="session" type="artauction.user.User"/>
				<a href="<c:url value="/App/art-upload-form.jsp"/>" class="upload-btn">Artwork Upload</a>
				<form action="<c:url value="/Logout"/>" method="post">
					<button type="submit" class="logout-btn">Log Out</button>
				</form>
				<a href="<c:url value="/App/UserProfile"/>" class="profile-btn">
					<ui:avatar user="${user}"/>
				</a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value="/login.jsp"/>" class="login-btn">Log In</a>
				<a href="<c:url value="/register.jsp"/>" class="signup-btn">Sign Up</a>
			</c:otherwise>
		</c:choose>

	</div>
</header>
