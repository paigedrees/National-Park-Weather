<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp" />

	<div class="container" id="surveys">
		<div class="col-md-6">
		${pageURL}
		<c:forEach var="surveyResult" items="${surveys}">
			<p> The park name is ${surveyResult.park.name}</p>
			<p> The amount of votes is ${surveyResult.surveyCount}</p>
		</c:forEach>
	
	
		</div>
	</div>
	
<c:import url="footer.jsp" />