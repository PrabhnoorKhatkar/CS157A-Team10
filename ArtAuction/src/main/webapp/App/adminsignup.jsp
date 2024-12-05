<%--
  Created by IntelliJ IDEA.
  User: dle
  Date: 12/4/24
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags/components" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<layout:base>
	<jsp:attribute name="head">
		<link rel="stylesheet" href="adminsignup.css"/>
		<title>Admin</title>
	</jsp:attribute>
	<jsp:body>
		<ui:main-header/>
		<div class="centered">
			<sl-card class="admin-signup">
				<div slot="header">
					<c:choose>
						<c:when test="${not empty param.from}">
							Please become an admin to access "<c:out value="${param.from}"/>".
						</c:when>
						<c:otherwise>
							Sign up to become an admin!
						</c:otherwise>
					</c:choose>
				</div>
				<form action="<c:url value="/App/AdminSignup"/>" method="POST">
					<sl-input
							name="role"
							label="Role Name"
							required
							placeholder="Enter role name"
					></sl-input>
					<br>
					<sl-input
							name="referralCode"
							label="Referral Code"
							pattern="[A-Za-z0-9]+"
							placeholder="Enter referral code (from another Admin)"
							help-text="Alphanumeric characters only"
							required
					></sl-input>
					<br>
					<sl-button type="submit" variant="primary">Submit</sl-button>
					<sl-button type="reset" variant="default">Reset</sl-button>
					<c:if test="${not empty requestScope.error}">
						<jsp:useBean id="error" scope="request" type="java.lang.String"/>
						<c:out value="${error}"/>
					</c:if>
				</form>
			</sl-card>
		</div>
	</jsp:body>
</layout:base>

