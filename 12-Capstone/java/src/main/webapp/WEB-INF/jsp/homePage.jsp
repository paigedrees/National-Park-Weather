<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="header.jsp">
<c:param name="pageURL" value="${pageURL}"/>
</c:import>

<div class="container">

    <c:forEach var="park" items="${parks}">
    <c:url var="imgPark" value="/img/parks/${park.code.toLowerCase()}.jpg"/>
    <div class="row parkDetail">
    
        <div class="col-md-6">
            <a href="detail?parkCode=${park.code}"><img class="img-fluid" src="${imgPark}" /></a>
        </div>
    
        <div class="col-md-6">
            <h3>${park.name}</h3>
            <p>${park.description}</p>
        </div>
    
    
    </div>
    
    </c:forEach>

</div>
<c:import url="footer.jsp" />
	