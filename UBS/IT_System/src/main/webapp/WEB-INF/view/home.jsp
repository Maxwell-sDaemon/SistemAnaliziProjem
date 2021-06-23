<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>

<head>
	<title>Calisan Sayfasi</title>
</head>

<body>
	<h2>Calisan Sayfasina Hosgeldiniz.</h2>
	<h2>Son Toplantilari ve yenilikleri buradan ogrenebilirsiniz.</h2>
	<hr>
	
	<p>
	evet restoran sayfamizin ilk surumu yayinlandi.
	<a href=""https://ancient-coast-20530.herokuapp.com"> bakiniz.</a>
	</p>
	
	<hr>
	
	<!-- display user name and role -->
	
	<p>
		Citizenship Number: <security:authentication property="principal.username" />
		<br><br>
		Role(s): <security:authentication property="principal.authorities" />
		<br><br>
		Name: ${user.firstName}, Telephone Number: ${user.lastName}, Email: ${user.email}
	</p>
	
	<security:authorize access="hasRole('CUSTOMER_TRACKER')">
	
		<!-- Add a link to point to /leaders ... this is for the managers -->
		
		<p>
			<a href="${pageContext.request.contextPath}/talkers">Musterileri izlemek için bakiniz.</a>
			(Kolay gelsin.)
		</p>

	</security:authorize>	
	
	
	<security:authorize access="hasRole('ADMIN')">  

		<!-- Add a link to point to /systems ... this is for the admins -->
		
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
			(Sadece Adminler Gorebilir)
		</p>
	
	</security:authorize>
	
	<hr>
	
	
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<input type="submit" value="Logout" />
	
	</form:form>
	
</body>

</html>









