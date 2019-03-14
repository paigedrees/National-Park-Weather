<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>


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

<c:forEach var="weather" items="${weatherForecast}" varStatus="countObject">
                            <div class="slide" data-order="${countObject.index + 1}">
                                <p class="header"><fmt:formatDate pattern = "EEEE, MMM dd" value = "${weather.date}" /></p>
                                
                                <p class="forecast">
                                    ${weather.forecast}
                                </p>
                                <p >
								<!-- === Temperature Scale === -->
								<!-- tempScale defaults to 'F' -->
								<c:if test = "${empty sessionScope.tempScale}">
									<c:set var="tempScale" value="F" scope="session"  />
								</c:if>
						
								<form action="${temperatureSubmitURL}" method="POST">
								<input type="hidden" name="tempScale" value="${sessionScope.tempScale}">
								<input type="hidden" name="pageURL" value="${pageURL}">
								
								<c:if test = "${sessionScope.tempScale == 'F'}">
									<button class="temperature-change">Switch to Centigrade</button><br/>
								</c:if>
								<c:if test = "${sessionScope.tempScale == 'C'}">
									<button class="temperature-change">Switch to Fahrenheit</button><br/>
								</c:if>
								</form>
								<!-- === end Temperature Scale === -->

								<c:choose>
								<c:when test = "${weather.getHighTempAs('F') >= 80}">
								<c:set var="highColor" value="var(--orange)" />
								</c:when>
								
								<c:when test = "${weather.getHighTempAs('F') <= 50}">
								<c:set var="highColor" value="var(--cyan)" />
								</c:when>
								
								<c:otherwise>
								<c:set var="highColor" value="inherit" />
								</c:otherwise>
								</c:choose>
                                <fmt:formatNumber var="tempHigh" 
                                value="${weather.getHighTempAs(sessionScope.tempScale)}"
  								maxFractionDigits="0" />
                                <p class="temperature-high" style="color: ${highColor}">${tempHigh} <sup>o</sup>${sessionScope.tempScale}</p>


								<c:choose>
								<c:when test = "${weather.getLowTempAs('F') >= 80}">
								<c:set var="lowColor" value="var(--orange)" />
								</c:when>
								
								<c:when test = "${weather.getLowTempAs('F') <= 50}">
								<c:set var="lowColor" value="var(--cyan)" />
								</c:when>
								
								<c:otherwise>
								<c:set var="lowColor" value="inherit" />
								</c:otherwise>
								</c:choose>
                                <fmt:formatNumber var="tempLow" 
                                value="${weather.getLowTempAs(sessionScope.tempScale)}"
  								maxFractionDigits="0" />
                                <p class="temperature-low" style="color: ${lowColor}">${tempLow} <sup>o</sup>${sessionScope.tempScale}</p>
                                
                                <c:url var="imgWeather" value="/img/weather_t/${weather.forecastText}.png" />
                                <img class="img-fluid mx-auto d-block" src="${imgWeather}">
                                <p>${weather.getRecommendation()}</p>
                            </div>
</c:forEach>
                        </div>
                        <div class="col-sm-2">
                            <div class="slide-navigation__txt">
                                <ul>
<c:forEach var="weather" items="${weatherForecast}" varStatus="countObject">
                                    <li><span data-order="${countObject.index + 1}">
                                    <fmt:formatDate pattern = "E" value = "${weather.date}" /></span></li>
</c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<c:url var="queryURL" value="/js/jquery-3.1.0-min.js" />
<script src="${queryURL}"></script>

<c:url var="queryURL" value="/js/TweenMax-1.19.0-min.js" />
<script src="${queryURL}"></script>

<c:url var="queryURL" value="/js/index.js" />
<script src="${queryURL}"></script>


<c:import url="footer.jsp" />