<%@tag description="Profile picture" %>
<%@attribute name="src" description="User for whom to get a profile picture" type="java.lang.String" required="true" %>
<%@attribute name="alt" description="Alt text" type="java.lang.String" %>

<span class="avatar">
	<img src="${p}" alt=""/>
</span>