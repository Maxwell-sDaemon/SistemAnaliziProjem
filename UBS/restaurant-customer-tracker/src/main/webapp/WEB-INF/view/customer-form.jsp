<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
	<title>Save Service Provider</title>

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css">

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/add-customer-style.css">
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>CRM - Musteri Takip Sistemi</h2>
		</div>
	</div>

	<div id="container">
		<h3>Musteri Kaydet</h3>
	
		<form:form action="saveCustomer" modelAttribute="customer" method="POST">
			
			<!--  need to associate this data to given customer id -->
			<form:hidden path="id"/>
			
			
			<table>
				<tbody>
					<tr>
						<td><label>Restoran Adi:</label></td>
						<td><form:input path="restaurantName" /></td>
					</tr>
				
					<tr>
						<td><label>Hess Kodu:</label></td>
						<td><form:input path="hessCode" /></td>
					</tr>

					<tr>
						<td><label>Musteri Adi:</label></td>
						<td><form:input path="customerName" /></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Kaydet" class="save" /></td>
					</tr>

				
				</tbody>
			</table>
		
		
		</form:form>
	
		<div style="clear; both;"></div>
		
		<p>
			<a href="${pageContext.request.contextPath}/customer/list">Listeye geri don.</a>
		</p>
	
	</div>

</body>

</html>










