<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>

<layout:base>

	<jsp:attribute name="head">
		<link rel="stylesheet" href="<c:url value='/myapp/css/login-style.css'/>" type="text/css"/>
		<title>Login</title>
	</jsp:attribute>
	<jsp:body>
		<form action="Login" method="post" style="background-color: rgba(0, 0, 0, 0.6);">
			<h2 class="text-xl font-bold mb-4" style="color: white;">
				Welcome to Brushstroke Bargains!
				<c:choose>
					<c:when test="${not empty param.from}">
						Please login to access "<c:out value="${param.from}"/>".
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</h2>
			<table>
				<input type="hidden" value="${param.from}" name="from">
				<tr>

					<td><label>
						<sl-input type="email" name="email" placeholder="Email" required autocomplete="username">
							<sl-icon name="envelope" slot="prefix"></sl-icon>
						</sl-input>
					</label></td>
				</tr>

				<tr>
					<td><label>
						<sl-input type="password" name="password" placeholder="Password" required password-toggle>
							<sl-icon name="lock" slot="prefix"></sl-icon>
						</sl-input>
					</label></td>
				</tr>

				<tr class="flex flex-row justify-center">
					<td><sl-button type="submit">Login</sl-button></td>
				</tr>

				<tr>
					<td><a style="color: #b5b5b5;" href="register.jsp">Don't have an account? Sign up here!</a></td>
				</tr>

				<!-- display error for log in unsuccessfully-->

				<!-- display register successful message -->

				<c:if test="${not empty requestScope.errorMessage}" >
					<jsp:useBean id="errorMessage" scope="request" type="java.lang.String"/>
					<div class="error">
						<c:out value="${errorMessage}"/>
					</div>
				</c:if>
				<c:if test="${not empty requestScope.successMessage}" >
					<jsp:useBean id="successMessage" scope="request" type="java.lang.String"/>
					<div class="success">
						<c:out value="${successMessage}"/>
					</div>
				</c:if>
			</table>
		</form>
	</jsp:body>
</layout:base>