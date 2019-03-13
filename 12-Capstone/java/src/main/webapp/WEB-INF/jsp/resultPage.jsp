<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp">
	<c:param name="pageURL" value="${pageURL}"/>
</c:import>

	<div id="surveys">
	${pageURL}
	<c:forEach var="surveyResult" items="${surveys}">
		<p> The park name is ${surveyResult.park.name}</p>
		<p> The amount of votes is ${surveyResult.surveyCount}</p>
	</c:forEach>


	
	</div>
	
<c:import url="footer.jsp" />