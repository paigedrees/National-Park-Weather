<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>National Park Geek</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/site.css">
</head>

<body>


	<header class="container">
		<div class="row">

			<div class="col-md-3">
				<a href="<c:url value="/home"/>"><img class="img-fluid logo" src="css/CircleParkLogo.png"></a>
			</div>

			<div class="col-md-9 parkDetail">
			<c:url var="surveyUrl" value="/submitSurvey" />
			<form:form id="submitSurvey" action="${surveyUrl}" method="POST" modelAttribute="submitSurvey">

				<div>
					
						<label for="favoriteParkCode"><strong>Favorite
								Park</strong></label>
						<select id="favoriteParkCode" name="favoriteParkCode">
							<c:forEach var="park" items="${parks}">
								<option value="${park.code}">${park.name}</option>

							</c:forEach>
						</select>
				</div>

				<div>
						<label for="email"><strong>Email</strong></label>
						<form:input path="email" placeholder="enter email" />
						<form:errors path="email" class="error" />
				</div>

				<div>
						<label for="stateOfResidence"><strong>State of
								Residency</strong></label>
						<select id="stateOfResidence" name="stateOfResidence">
							<option value="AL">Alabama</option>
							<option value="AK">Alaska</option>
							<option value="AZ">Arizona</option>
							<option value="AR">Arkansas</option>
							<option value="CA">California</option>
							<option value="CO">Colorado</option>
							<option value="CT">Connecticut</option>
							<option value="DE">Delaware</option>
							<option value="DC">District Of Columbia</option>
							<option value="FL">Florida</option>
							<option value="GA">Georgia</option>
							<option value="HI">Hawaii</option>
							<option value="ID">Idaho</option>
							<option value="IL">Illinois</option>
							<option value="IN">Indiana</option>
							<option value="IA">Iowa</option>
							<option value="KS">Kansas</option>
							<option value="KY">Kentucky</option>
							<option value="LA">Louisiana</option>
							<option value="ME">Maine</option>
							<option value="MD">Maryland</option>
							<option value="MA">Massachusetts</option>
							<option value="MI">Michigan</option>
							<option value="MN">Minnesota</option>
							<option value="MS">Mississippi</option>
							<option value="MO">Missouri</option>
							<option value="MT">Montana</option>
							<option value="NE">Nebraska</option>
							<option value="NV">Nevada</option>
							<option value="NH">New Hampshire</option>
							<option value="NJ">New Jersey</option>
							<option value="NM">New Mexico</option>
							<option value="NY">New York</option>
							<option value="NC">North Carolina</option>
							<option value="ND">North Dakota</option>
							<option value="OH">Ohio</option>
							<option value="OK">Oklahoma</option>
							<option value="OR">Oregon</option>
							<option value="PA">Pennsylvania</option>
							<option value="RI">Rhode Island</option>
							<option value="SC">South Carolina</option>
							<option value="SD">South Dakota</option>
							<option value="TN">Tennessee</option>
							<option value="TX">Texas</option>
							<option value="UT">Utah</option>
							<option value="VT">Vermont</option>
							<option value="VA">Virginia</option>
							<option value="WA">Washington</option>
							<option value="WV">West Virginia</option>
							<option value="WI">Wisconsin</option>
							<option value="WY">Wyoming</option>
							<option value="NOTINUS">Outside the U.S.</option>
							</select>
				</div>

				<div>
						<label for="physicalActivityLevel"><strong>Physical
								Activity Level</strong></label>
						<select id="physicalActivityLevel" name="physicalActivityLevel">
							<option value="inactive">Inactive</option>
							<option value="sedentary">Sedentary</option>
							<option value="active">Active</option>
							<option value="extremely active">Extremely Active</option>

						</select>
				</div>
				
				<input type="submit" value="Submit Survey" class="btn btn-dark submitButton float-right">
			</form:form>
			</div>
		</div>

	</header>


<%-- <c:import url="header.jsp"> --%>
<%-- 	<c:param name="temperatureChoice" value="${temperatureChoice}"/> --%>
<%-- 	<c:param name="submitSurvey" value="${submitSurvey}"/> --%>
<%-- </c:import> --%>

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
	
	