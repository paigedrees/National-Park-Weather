<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="header.jsp" />

<div class="container">

	<c:forEach var="park" items="${parks}">
		<c:url var="parkImgURL"
			value="/img/parks/${park.code.toLowerCase()}.jpg" />
		<c:url var="parkDetailURL" value="/detail?parkCode=${park.code}" />

		<div class="row parkDetail">
			<div class="col-md-6 parkImage">
				<a href="${parkDetailURL}"><img class="img-fluid"
					src="${parkImgURL}" /></a>
			</div>

			<div class="col-md-6 parkTextShadow">
				<h3>${park.name}</h3>
				<p>${park.description}</p>
			</div>
		</div>

	</c:forEach>

</div>

<c:import url="footer.jsp" />
