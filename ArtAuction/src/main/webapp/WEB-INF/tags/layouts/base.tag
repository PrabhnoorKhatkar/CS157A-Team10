<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@tag description="Base page template" pageEncoding="UTF-8"%>
<%@attribute name="head" fragment="true" required="true"%>
<%@attribute name="footer" fragment="true" %>
<%@taglib prefix="ui" tagdir="/WEB-INF/tags/components"%>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<c:url value="/myapp/css/layout/base.css"/>">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.19.0/cdn/themes/light.css" />
<%--		<script type="module" src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.19.0/cdn/shoelace-autoloader.js"></script>--%>
		<script type="module" src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.19.0/cdn/shoelace.js" ></script>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Titillium+Web:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700&display=swap" rel="stylesheet">
		<script src="https://cdn.tailwindcss.com"></script>
		<jsp:invoke fragment="head"/>
	</head>
	<body>
		<jsp:doBody/>
		<jsp:invoke fragment="footer"/>
		<script type="application/javascript" src="<c:url value="/myapp/javascript/animate-cards.js"/>"></script>
	</body>
</html>
