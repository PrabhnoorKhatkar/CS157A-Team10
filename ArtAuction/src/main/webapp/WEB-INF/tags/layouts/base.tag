<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@tag description="Base page template" pageEncoding="UTF-8"%>
<%@attribute name="head" fragment="true" %>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags/components"%>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<c:url value="/myapp/css/common.css"/>">
		<jsp:invoke fragment="head"/>
	</head>
	<body>
		<ui:main-header/>
		<br>
		<jsp:doBody/>
		<script type="application/javascript" src="<c:url value="/myapp/javascript/animate-cards.js"/>"></script>
	</body>
</html>
