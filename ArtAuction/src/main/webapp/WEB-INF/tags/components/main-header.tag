<%@tag description="Header" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags/components" %>

<header class="main-header">
	<div class="header-left">
		<h2>
			<a href="<c:url value="/"/>" class="logo flex flex-row items-center">
				<sl-icon name="brush" style="font-size: 48px;"></sl-icon>
				<span class="flex flex-col">
					<span>
						Brushstroke
					</span>
					<span>
						Bargains
					</span>
				</span>
			</a>
		</h2>
	</div>
	<div class="header-mid">
		<form action="<c:url value="/SearchArtwork"/>" method="post" class="flex flex-row flex-nowrap items-center m-0">
			<label>
				<sl-input type="text" placeholder="Search artworks..." name="searchText">
					<sl-icon name="search" slot="prefix"></sl-icon>
				</sl-input>
			</label>
			<sl-button type="submit" >Search</sl-button>
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
				<sl-button href="<c:url value="/login.jsp"/>" class="login-btn">Log In</sl-button>
				<sl-button href="<c:url value="/register.jsp"/>" class="signup-btn">Sign Up</sl-button>
			</c:otherwise>
		</c:choose>

	</div>
</header>
