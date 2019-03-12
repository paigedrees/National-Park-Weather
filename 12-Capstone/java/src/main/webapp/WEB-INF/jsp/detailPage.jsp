<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="container">

	<c:url var="imgPark" value="/img/parks/${park.code.toLowerCase()}.jpg" />

	<div class="row justify-content-center form-group">

		<div class="col-md">

			<img class="img-fluid" src="${imgPark}" />

		</div>

	</div>

	<div class="row justify-content-center form-group">

		<div class="col-md">

			<h3>${park.name}</h3>

		</div>

	</div>

	<div class="row form-group">

		<div class="col-md-6">

			<h4>${park.inspirationalQuote}</h4>

		</div>

		<div class="col-md-6">

			<h4>${park.quoteSource}</h4>

		</div>

	</div>

	<div class="row form-group">

		<div class="col-md">

			<p>${park.description}</p>

		</div>

	</div>

	<div class="row form-group">

		<div class="col-md-4 col-sm">
			<p>State: ${park.state}</p>
			<p>Year Founded: ${park.yearFounded}</p>
			<p>Annual Visitor Count: ${park.annualVisitorCount}</p>
			<p class="price">Fee: $${park.entryFee}</p>
		</div>

		<div class="col-md-4 col-sm">
			<p>Acreage: ${park.acreage}</p>
			<p>Elevation: ${park.elevationInFeet} ft.</p>
			<p>Miles of Trail: ${park.milesOfTrail} miles</p>
		</div>

		<div class="col-md-4 col-sm">
			<p>Climate: ${park.climate}</p>
			<p>Number of Campsites: ${park.numberOfCampsites}</p>
			<p>Number of Animal Species: ${park.numberOfAnimalSpecies}</p>
		</div>

	</div>

	<div class="row form-group">
		<c:forEach var="weather" items="${weatherForecast}">
			<c:url var="imgWeather"
				value="/img/weather/${weather.forecastText}.png" />
			<div class="col-md">
				<p>${weather.dayName}</p>
				<img class="img-fluid" src="${imgWeather}" />
				<p>Low: ${weather.getLowTempAs('F')}</p>
				<p>High: ${weather.getHighTempAs('F')}</p>
				<p id="forecast">${weather.forecast}</p>
				<p id="recommendation">${weather.getRecommendation()}</p>
			</div>

		</c:forEach>
	</div>



</div>

<c:import url="footer.jsp" />