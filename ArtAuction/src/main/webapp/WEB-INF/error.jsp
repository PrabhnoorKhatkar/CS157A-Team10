<%--
  Created by IntelliJ IDEA.
  User: dle
  Date: 12/5/24
  Time: 7:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags/components"%>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layouts"%>
<layout:base>
	<jsp:attribute name="head">
		<title>Title</title>
	</jsp:attribute>
	<jsp:body>
		<div class="centered">
			<sl-card>
				
			</sl-card>
			<sl-button href="<c:url value="/"/>">Back to homepage.</sl-button>
		</div>
	</jsp:body>
</layout:base>
