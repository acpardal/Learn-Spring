<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Minutes Page</title>

<script type="text/javascript" src="jquery-1.11.3.js"></script>

<script type="text/javascript">
	$(document).ready(
		function() {
			$.getJSON('<spring:url value="activities.json"/>', {
				ajax : 'true'
			}, function(data) {
				var html = '<option value="">--Please select one--</option>';
				var len = data.length;
				for(var i = 0; i < len; i++) {
					html += '<option value="' + data[i].desc + '">'
							+ data[i].desc + '</option>';
				}
				html += '</option>';
				
				$('#activities').html(html);
			});
		});
</script>

</head>
<body>
	<h1>Add Minutes Exercised</h1>
	
	Language : <a href="?language=en">English</a> | <a href="?language=es">Spanish</a>
	
	<form:form commandName="exercise">
		<table>
			<tr>
				<tr><spring:message code="goal.text"/></tr>
				<tr><form:input path="minutes" /></tr>
				<td>
					<form:select id="activities" path="activity"></form:select>
				</td>
			</tr>
			<tr>
				<tr colspan="3">
					<input type="submit" value="Enter Exercise"/>
				</tr>
			</tr>
		</table>
	</form:form>
	
	<h1>Our goal for the day is: ${goal.minutes}</h1>
</body>
</html>