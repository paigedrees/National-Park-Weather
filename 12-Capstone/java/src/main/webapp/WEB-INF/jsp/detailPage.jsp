<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div id="detailGrid">

	<div id="detailImage">
	
		<img src="${}" />
	
	</div>
	
	<div id="detailName">
		
		<h3>${ }</h3>
		
	</div>
	
	<div id="detailQuote">
	
		<h4>${ }</h4>
	
	</div>

	<div id="quoteSource">
		
		<h4>${ }</h4>
		
	</div>
	
	<div id="detailDescription">
	
		<p>${ }</p>
		
	</div>
	
	<div id="history">
		<ul>
			<li>State: ${ }</li>
			<li>Year Founded: ${ }</li>
			<li>Annual Visitor Count: ${ }</li>
			<li class="price">Fee: ${ }</li>
		</ul>
	</div>
	
	<div id="hikingInfo">
		<ul>
			<li>Acreage: ${ }<li>
			<li>Elevation in Feet: ${ }</li>
			<li>Miles of Trail: ${ }</li>
		</ul>
	</div>
	
	<div id="environment">
		<ul>
			<li>Climate: ${ }</li>
			<li>Number of Campsites: ${ }</li>
			<li>Number of Animal Species: ${ }</li>
		</ul>
	</div>
	
	<div id="weather">
		<c:forEach var="" items="${ }">
			<div>
				<p id="fiveDayForecastValue"></p>
				<img src=${ } />
				<p>Low: </p>
				<p>High: </p>
				<p id="forecast"></p>
			</div>
		
		</c:forEach>
	</div>



</div>