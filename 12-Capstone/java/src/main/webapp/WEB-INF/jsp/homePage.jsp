<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="parkImgURL" value="/img/parks/${park.code.toLowerCase()}.jpg" />

<c:import url="header.jsp" />

	<div class="container">
	
		<c:forEach var="park" items="${parks}">
		<c:url var="imgPark" value="${parkImgURL}"/>
		<div class="row parkDetail">
		
			<div class="col-md-6">
				<c:url var="parkCode" value="detail?parkCode=${park.code}"/>
				<a href="${parkCode}"><img class="img-fluid" src="${imgPark}" /></a>
			</div>
		
			<div class="col-md-6">
				<h3>${park.name}</h3>
				<p>${park.description}</p>
			</div>
		
		
		</div>
		
		</c:forEach>
	
	</div>
	
<c:import url="footer.jsp" />
	