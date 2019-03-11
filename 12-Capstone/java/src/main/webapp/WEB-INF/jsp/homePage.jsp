<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

	<div id="allParks">
	
		<c:forEach var="park" items="${parks}">
		<c:url var="imgPark" value="/img/parks/${park.code.toLowerCase()}.jpg"/>
		<div id="park">
		
			<div id="parkImage">
			
				<a href=""><img class="image" src="${imgPark}" /></a>
			
			</div>
		
			<div id="parkInfo">
			
				<h3>${park.name}</h3>
				<p>${park.description}</p>
			
			</div>
		
		
		</div>
		
		</c:forEach>
	
	</div>
	
	