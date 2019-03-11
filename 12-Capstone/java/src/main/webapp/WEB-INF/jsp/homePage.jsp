<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp">
	<c:param name="temperatureChoice" value="${temperatureChoice}"/>
</c:import>

	<div id="allParks">
	
		<c:forEach var="park" items="${parks}">
		<c:url var="imgPark" value="/img/parks/${park.code.toLowerCase()}.jpg"/>
		<div id="park">
		
			<div id="parkImage">
			
				<a href="detail?parkCode=${park.code}"><img class="image" src="${imgPark}" /></a>
			
			</div>
		
			<div id="parkInfo">
			
				<h3>${park.name}</h3>
				<p>${park.description}</p>
			
			</div>
		
		
		</div>
		
		</c:forEach>
	
	</div>
	
	