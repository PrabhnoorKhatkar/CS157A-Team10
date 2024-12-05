<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layouts" %>
<layout:base>
	<jsp:attribute name="head">
		<link rel="stylesheet" href="<c:url value='/myapp/css/register-style.css'/>" type="text/css"/>
		<title>Account Register</title>
	</jsp:attribute>
	<jsp:body>
		<div class="register-card">
			<div class="text">
				<form action="Register" method="post">
						<h1 class="font-bold text-xl mb-4">Become a member of Brushstroke Bargains!</h1>
							<sl-input type="text" name="name" placeholder="Name" required></sl-input>

								<sl-input type="text" name="displayName" placeholder="Display Name" required></sl-input>

					<sl-input type="email" name="emailAddress" placeholder="Email" required>
						<sl-icon name="envelope" slot="prefix"></sl-icon>
					</sl-input>

							<sl-input type="password" name="password" placeholder="Password" required password-toggle>
								<sl-icon name="lock" slot="prefix"></sl-icon>
							</sl-input>

							<sl-input type="text" name="address" placeholder="Address" required>
								<sl-icon name="house" slot="prefix"></sl-icon>
							</sl-input>

								<label>
									<sl-checkbox type="checkbox" name="anonymous" value="false"></sl-checkbox>
									Register Anonymously
								</label>
								<input type="submit" value="register">
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
							<a href="login.jsp">Already have an account? Sign in</a>
				</form>
			</div>
			<div class="image">
				<img src="https://t4.ftcdn.net/jpg/04/14/88/81/360_F_414888151_TFfbswegz6dmezIuOvU6zWYcCuFW9JwS.jpg">
			</div>
		</div>
	</jsp:body>
</layout:base>
