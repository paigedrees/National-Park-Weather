<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div id="detailGrid">

	<c:url var="imgPark" value="/img/parks/${park.code.toLowerCase()}.jpg"/>
	<div id="detailImage">
	
		<img src="${imgPark}" />
	
	</div>
	
	<div id="detailName">
		
		<h3>${park.name}</h3>
		
	</div>
	
	<div id="detailQuote">
	
		<h4>${park.inspirationalQuote}</h4>
	
	</div>

	<div id="quoteSource">
		
		<h4>${park.quoteSource}</h4>
		
	</div>
	
	<div id="detailDescription">
	
		<p>${park.description}</p>
		
	</div>
	
	<div id="history">
		<ul>
			<li>State: ${park.state}</li>
			<li>Year Founded: ${park.yearFounded}</li>
			<li>Annual Visitor Count: ${park.annualVisitorCount}</li>
			<li class="price">Fee: ${park.entryFee}</li>
		</ul>
	</div>
	
	<div id="hikingInfo">
		<ul>
			<li>Acreage: ${park.acreage}</li>
			<li>Elevation: ${park.elevationInFeet} ft.</li>
			<li>Miles of Trail: ${park.milesOfTrail}</li>
		</ul>
	</div>
	
	<div id="environment">
		<ul>
			<li>Climate: ${park.climate}</li>
			<li>Number of Campsites: ${park.numberOfCampsites}</li>
			<li>Number of Animal Species: ${park.numberOfAnimalSpecies}</li>
		</ul>
	</div>
	
	<div id="weather">
		<c:forEach var="weather" items="${weatherForecast}">
		<c:url var="imgWeather" value="/img/weather/${weather.forecastText}.png"/>
			<div>
				<p>${weather.dayName}</p>
				<img src="${imgWeather}" />
				<p>Low: ${weather.getLowTempAs('F')}</p>
				<p>High: ${weather.getHighTempAs('F')}</p>
				<p id="forecast">${weather.forecast}</p>
				<p id="recommendation">${weather.getRecommendation()}</p> 
			</div>
		
		</c:forEach>
	</div>



</div>