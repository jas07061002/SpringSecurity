<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<title>luv2code Company Home Page</title>
</head>

<body>

	<h2>luv2code Company Home Page - Yoohoo!!!!!</h2>
	<hr>

	<p>Welcome to the luv2code Company Home Page</p>
	<hr>
	<!-- display user name and role -->

	<p>
		User:
		<security:authentication property="principal.username" />
		<br> <br> Role(s):
		<security:authentication property="principal.authorities" />
	</p>
	<hr>

	<security:authorize access="hasRole('MANAGER')">
		<!-- add a link to point to /leaders..... this is for the managers -->

		<p>
			<a href="${pageContext.request.contextPath}/leaders">Leadership
				Meeting</a> (Only for manager peeps)

		</p>

	</security:authorize>
	<security:authorize access="hasRole('ADMIN')">
	<!-- add a link to point to /systems.... this is for the admins -->
	<p>
		<a href="${pageContext.request.contextPath}/systems">IT Systems
			Meeting </a> (Only for Admin peeps)

	</p>
	
	</security:authorize>
	
	


	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">

		<input type="submit" value="Logout" />
	</form:form>
</body>

</html>