<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.luv2code.springdemo.util.SortUtils" %>
<!DOCTYPE html>

<html>

<head>
	<title>Service Provider List</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM - Musteri Takip Sistemi</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			<!-- put new button : add customer -->

			<input type="button" value="Add Service"
				onclick="window.location.href='showFormForAdd'; return false;"
				class="add-button"
			/>
			 <!--  add a search box -->
            <form:form action="search" method="GET">
                Restoran Ara: <input type="text" name="theSearchName" />
                
                <input type="submit" value="Search" class="add-button" />
            </form:form>
			
			<!-- construct a sort link for first name -->
			<c:url var="sortLinkRestaurantName" value="/customer/list">
				<c:param name="sort" value="<%= Integer.toString(SortUtils.PROVIDER_NAME) %>" />
			</c:url>	
					
			<!-- construct a sort link for last name -->
			<c:url var="sortLinkHessCode" value="/customer/list">
				<c:param name="sort" value="<%= Integer.toString(SortUtils.PROVIDER_TYPE) %>" />
			</c:url>					
		
			<!-- construct a sort link for email -->
			<c:url var="sortLinkCustomerName" value="/customer/list">
				<c:param name="sort" value="<%= Integer.toString(SortUtils.PLAN) %>" />
			</c:url>	
		
		
			<table>
			
			<tr>
				<th><a href="${sortLinkFirstName}">Restoran Adi</a></th>
				<th><a href="${sortLinkLastName}">Hess Kodu</a></th>
				<th><a href="${sortLinkEmail}">Musteri Adi</a></th>
				<th>Action</th>
			</tr>					
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${customers}">
					
					<!-- construct an update link -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id }"></c:param>
					</c:url>
					
					<!-- construct an delete link -->
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id }"></c:param>
					</c:url>
				
					<tr>
						<td> ${tempCustomer.restaurantName} </td>
						<td> ${tempCustomer.hessCode} </td>
						<td> ${tempCustomer.customerName} </td>
											
						<td> 
							<!-- display an update link -->
							<a href="${updateLink }">Guncelle</a>
							 |
							<a href="${deleteLink }"
								onclick="if (!(confirm('Musteriyi silmeye emin misiniz?'))) return false"> Sil</a>
						</td>

					</tr>
				
				</c:forEach>
						
			</table>
				
		</div>
	
	</div>
	

</body>

</html>









