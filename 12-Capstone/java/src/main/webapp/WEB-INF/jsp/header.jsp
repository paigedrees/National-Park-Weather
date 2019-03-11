<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>National Park Geek</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/site.css">
</head>

<body>
    <header>
    	<h1>National Park Geek</h1>
    </header>
    <nav class="navbar navbar-dark bg-dark">
        <ul>
	        <li><a href="<c:url value="/home"/>">Home</a></li>
	        <li><a href="<c:url value=""/>">Survey</a></li>
	       	<li>'
	       	<form:form  modelAttribute="temperatureChoice">
	       	<label class="text" for="scale">Temperature Scale</label>
	       		
	       		<select id="scale" name="scale">
	       			
	       			<option value="F"
	       			<c:if test="${temperatureChoice.scale == 'F'}">
	       			selected
	       			</c:if>
	       			>Fahrenheit</option>
	       			
	       			<option value="C"
	       			<c:if test="${temperatureChoice.scale == 'C'}">
	       			selected
	       			</c:if>
	       			>Celcius</option>
	       		</select>
	       	</form:form>
	        </li>
	    </ul>
    </nav>
   
   