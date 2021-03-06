<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp" />

<div class="container" id="surveys">


	
		<div class="row resultsRow">
		<c:forEach var="surveyResult" items="${surveys}">
		
		<div class="col-md-auto col-lg-4">
			
			<div class="card" style="width: 23rem;">
			
			<c:url var="imgPark" value="/img/parks/${surveyResult.park.code.toLowerCase()}.jpg"/>
				<img class="card-img-top" src="${imgPark}" alt="Card image cap">
				
				<div class="card-body">
					<h5 class="card-title">${surveyResult.park.name}</h5>
					<h6 class="card-text votesResult">${surveyResult.surveyCount} votes!</h6>
					<c:url var="detail" value="/detail?parkCode=${surveyResult.park.code}"/>
					<a href="${detail}" class="btn btn-dark btnResult">View this Park</a>
				</div>
			</div>
			
			</div>
			
		</c:forEach>
		</div>
		
		


	


</div>

<c:import url="footer.jsp" />