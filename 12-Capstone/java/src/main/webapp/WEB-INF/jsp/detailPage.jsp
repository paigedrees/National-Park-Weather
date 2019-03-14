<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url var="imgPark" value="/img/parks/${park.code.toLowerCase()}.jpg" />
<c:url var="temperatureSubmitURL" value="/temperature/flipScale" />

<c:import url="header.jsp">
	<c:param name="cssPageURL" value="/css/detail.css"/>
</c:import>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/box-slider.css">


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
			<p class="font-italic font-weight-bold">&ldquo;${park.inspirationalQuote}&rdquo;</p>
			<h4>- ${park.quoteSource}</h4>
		</div>

	</div>

	<div class="row pt-5">

		<div class="col-md">

			<p>${park.description}</p>

		</div>

	</div>

	<div class="row pb-5">

		<div class="col-md-4">
			<p>
				<span class="font-weight-bold">State:</span> ${park.state}
			</p>
			<p>
				<span class="font-weight-bold">Year Founded:</span>
				${park.yearFounded}
			</p>
			<p>
				<span class="font-weight-bold">Annual Visitor Count:</span>
				<fmt:formatNumber value="${park.annualVisitorCount}" type="number" />
			</p>
			<p class="font-weight-bold">
				Fee:
				<fmt:setLocale value="en_US" />
				<fmt:formatNumber value="${park.entryFee}" type="currency" />
			</p>
		</div>

		<div class="col-md-4">
			<p>
				<span class="font-weight-bold">Acreage:</span>
				<fmt:formatNumber value="${park.acreage}" type="number" />
				acres
			</p>
			<p>
				<span class="font-weight-bold">Elevation:</span>
				${park.elevationInFeet} ft.
			</p>
			<p>
				<span class="font-weight-bold">Miles of Trail:</span>
				${park.milesOfTrail} miles
			</p>
		</div>

		<div class="col-md-4">
			<p>
				<span class="font-weight-bold">Climate:</span> ${park.climate}
			</p>
			<p>
				<span class="font-weight-bold">Number of Campsites:</span>
				<fmt:formatNumber value="${park.numberOfCampsites}" type="number" />
			</p>
			<p>
				<span class="font-weight-bold">Number of Animal Species:</span>
				<fmt:formatNumber value="${park.numberOfAnimalSpecies}"
					type="number" />
			</p>
		</div>

	</div>
	
    <div class="row">
        <div class="col-md">
            <div class="row p-0 m-0">
                <div class="col-sm-4  p-0">
                    <div class="row">
                        <div class="col-sm-10 p-0 align-top text-center slides-container">
                            <div class="slide" data-order="1">
                                <p class="header">Thursday, August 30</p>
                                <p class="forecast">
                                    Forecast: snow
                                </p>
                                <p class="climate">
                                    Climate Rainforest
                                </p>
                                <p class="temperature-high">
                                    31 <sup>o</sup>C
                                </p>
                                <p class="temperature-low">
                                    10 <sup>o</sup>C
                                </p>
                                <img class="img-fluid mx-auto d-block" src="img/weather/snow.png">
                            </div>
                            <div class="slide" data-order="2">
                                <p class="header">Wednesday, August 30</p>
                                <p class="forecast">
                                    Forecast: Sunny
                                </p>
                                <p class="climate">
                                    Climate Desert
                                </p>
                                <p class="temperature-high">
                                    100 <sup>o</sup>C
                                </p>
                                <p class="temperature-low">
                                    10 <sup>o</sup>C
                                </p>
                                <img class="img-fluid mx-auto d-block" src="img/weather/sunny.png">
                                <p>${weather.getRecommendation()}</p>
                                <p></p>
                                <p></p>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="slide-navigation__txt">
                                <ul>
                                    <li><span data-order="1">Mon</span></li>
                                    <li><span data-order="2">Tue</span></li>
                                    <li><span data-order="3">Wed</span></li>
                                    <li><span data-order="4">Thu</span></li>
                                    <li><span data-order="5">Fri</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	

	<div class="row form-group">
		<!-- === Temperature Scale === -->
		<!-- tempScale defaults to 'F' -->
		<c:if test = "${empty sessionScope.tempScale}">
			<c:set var="tempScale" value="F" scope="session"  />
		</c:if>

		<form action="${temperatureSubmitURL}" method="POST">
		<input type="hidden" name="tempScale" value="${sessionScope.tempScale}">
		<input type="hidden" name="pageURL" value="${pageURL}">
		
		<c:if test = "${sessionScope.tempScale == 'F'}">
			<button class="tempScale">degree C</button><br/>
		</c:if>
		<c:if test = "${sessionScope.tempScale == 'C'}">
			<button class="tempScale">degree F</button><br/>
		</c:if>
		</form>
		<!-- === end Temperature Scale === -->
		
		<c:forEach var="weather" items="${weatherForecast}">
			<c:url var="imgWeather"
				value="/img/weather/${weather.forecastText}.png" />
			<div class="col-md">
				<p>${weather.dayName}</p>
				<img class="img-fluid" src="${imgWeather}" />
				<p>Low: ${weather.getLowTempAs(sessionScope.tempScale)}</p>
				<p>High: ${weather.getHighTempAs(sessionScope.tempScale)}</p>
				<p id="forecast">${weather.forecast}</p>
				<p id="recommendation">${weather.getRecommendation()}</p>
			</div>

		</c:forEach>
	</div>
</div>

<c:url var="queryURL" value="/js/jquery-3.1.0-min.js" />
<script src="${queryURL}"></script>

<c:url var="queryURL" value="/js/TweenMax-1.19.0-min.js" />
<script src="${queryURL}"></script>

<c:url var="queryURL" value="/js/index.js" />
<script src="${queryURL}"></script>


<c:import url="footer.jsp" />