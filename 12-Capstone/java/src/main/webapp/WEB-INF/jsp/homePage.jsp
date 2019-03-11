<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

	<div id="allParks">
	
		<c:forEach var="" items="${ }">
		
		<div id="park">
		
			<div id="parkImage">
			
				<a href=""><img class="image" src="img/${}" /></a>
			
			</div>
		
			<div id="parkInfo">
			
				<h3>Name</h3>
				<p>Description</p>
			
			</div>
		
		
		</div>
		
		</c:forEach>
	
	</div>
	
	