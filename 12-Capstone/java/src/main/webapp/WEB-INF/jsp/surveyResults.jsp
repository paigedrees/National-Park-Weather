<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp">
	<c:param name="temperatureChoice" value="${temperatureChoice}"/>
</c:import>

	<div id="surveyResults">
	
	<p> The most popular park is ${topPark.name}</p>
	</div>
	
