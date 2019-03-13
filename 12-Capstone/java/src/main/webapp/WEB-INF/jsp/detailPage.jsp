<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:url var="imgPark" value="/img/parks/${park.code.toLowerCase()}.jpg" />

<c:import url="header.jsp"/>

<div class="container parkDetail">


	<div class="row p-4">

		<div class="col-md">

			<h2 class="text-center">${park.name}</h2>

		</div>

	</div>

	<div class="row align-items-center">

		<div class="col-md-6">

			<img class="img-fluid" src="${imgPark}" />

		</div>
		
		<div class="col-md-6">
			<h4 class="font-italic">"${park.inspirationalQuote}"</h4>
			<h4>- ${park.quoteSource}</h4>
		</div>

	</div>

	<div class="row pt-4">

		<div class="col-md">

			<p>${park.description}</p>

		</div>

	</div>

	<div class="row pb-5">

		<div class="col-md-4 col-sm">
			<p><span class="font-weight-bold">State:</span> ${park.state}</p>
			<p><span class="font-weight-bold">Year Founded:</span> ${park.yearFounded}</p>
			<p><span class="font-weight-bold">Annual Visitor Count:</span> ${park.annualVisitorCount}</p>
			<p class="text-primary">Fee: $${park.entryFee}</p>
		</div>

		<div class="col-md-4 col-sm">
			<p><span class="font-weight-bold">Acreage:</span> ${park.acreage}</p>
			<p><span class="font-weight-bold">Elevation:</span> ${park.elevationInFeet} ft.</p>
			<p><span class="font-weight-bold">Miles of Trail:</span> ${park.milesOfTrail} miles</p>
		</div>

		<div class="col-md-4 col-sm">
			<p><span class="font-weight-bold">Climate:</span> ${park.climate}</p>
			<p><span class="font-weight-bold">Number of Campsites:</span> ${park.numberOfCampsites}</p>
			<p><span class="font-weight-bold">Number of Animal Species:</span> ${park.numberOfAnimalSpecies}</p>
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