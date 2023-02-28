<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="styleSheet.css">
</head>
<body>



	<!-- sql:setDataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project1" user="root" password="root" />

	<c:set var="sessionDate" value="${param.date}" scope="session" />
	<c:set var="sessionSource" value="${param.source}" scope="session" />
	<c:set var="sessionDestination" value="${param.destination}" scope="session" />
	<c:set var="sessionNumberPassengers" value="${param.number}" scope="session" />
	<c:set var="sessionClass" value="${param.type}" scope="session" />
	
	<h4>
		Date:
		<c:out value="${sessionScope.sessionDate}" />
	</h4>
	<h4>
		Source:
		<c:out value="${sessionScope.sessionSource}" />
	</h4>
	<h4>
		Destination:
		<c:out value="${sessionScope.sessionDestination}" />
	</h4>
	<h4>
		Class:
		<c:out value="${sessionScope.sessionClass}" />
	</h4>
	<h4>
		Number of passengers:
		<c:out value="${sessionScope.sessionNumberPassengers}" />
	</h4>
	<c:set var="count" value="0" scope="page" />
	<sql:query dataSource="${db}" var="rs">  
	SELECT * from flights;  
</sql:query>
<h3><i>Please see the avaliable options based on the above details selection</i> </h3>
	<table border="2" width="100%">
		<tr>

			
			<th>Airline</th>
			<th>Price(IND)</th>
			<th>Flight No</th>
			<th>Source City</th>
			<th>Destination City</th>
			<th>Departure Time</th>
			<th>Arrival Time</th>
			<th>Total Seats</th>
			<th>Booked Seats</th>
			<th>Seats Availible</th>
			<th>Travel_date</th>
			<th>Class</th>
			<th>Choose</th>

		</tr>
		<c:forEach var="table" items="${rs.rows}">
		
			
				<c:if test="${sessionScope.sessionDate eq table.travel_date}">
				<c:if test="${sessionScope.sessionSource eq table.source_city}">
				<c:if
							test="${sessionScope.sessionDestination eq table.destination_city}">
								<c:if
								test="${sessionScope.sessionNumberPassengers <= table.seats_availible}">
								<c:if
								test="${sessionScope.sessionClass eq table.travel_class}">
								<tr>	
								<td><c:out value="${table.AirlineName}" /></td>
								<td><c:out value="${table.price}" /></td>
								<td><c:out value="${table.flight_no}" /></td>
								<td><c:out value="${table.source_city}" /></td>
								<td><c:out value="${table.destination_city}" /></td>
								<td><c:out value="${table.departure_time}" /></td>
								<td><c:out value="${table.arrival_time}" /></td>
								<td><c:out value="${table.total_seats}" /></td>
								<td><c:out value="${table.booked_seats}" /></td>
								<td><c:out value="${table.seats_availible}" /></td>
								<td><c:out value="${table.travel_date}" /></td>
								<td><c:out value="${table.travel_class}" /></td>
								<td>
										
										<form method="POST" action="flyAway_Register.jsp">
											<input value="${table.flight_no}" name="selectedflight"
												type="submit" />
										</form> </td> 
                            </tr>
                            </c:if>
                            	</c:if>
                            	</c:if>
                            	</c:if>
                            		</c:if>                          											
			</c:forEach>
	</table>



</body>
</html>