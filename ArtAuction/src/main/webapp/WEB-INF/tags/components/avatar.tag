<%@tag description="Profile picture" %>
<%@attribute name="user" description="User for whom to display their profile picture" type="artauction.user.User" required="true" %>
<%@attribute name="size" description="Size of the avatar (any CSS unit)" type="java.lang.String" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="size" value="${(not empty size) ? size : '64px'}" />
<a href="<c:url value="/App/UserProfile"/>" class="profile-btn">
<sl-avatar
		<c:if test="${not empty user.profilePictureID and user.profilePictureID ne 0}">
			image="<c:url value="/Uploads/${user.profilePictureID}"/>"
		</c:if>
		<c:if test="${not user.anonymous}">
			initials="${user.displayName.substring(0,1)}"
		</c:if>
		label="Profile picture for ${user.displayName}"
		style="--size: ${size};"
></sl-avatar>
</a>
