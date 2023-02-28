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

<c:set var="flightNumber" value="${request.getParameter('selectedflight') }" scope="session"/>


<c:set var="flightNumber" value= "${param.selectedflight}"  scope="session"/>

	
	<h2><strong>Confirm Travel Details</strong></h2>
	<h5> <b> Travel Date:</b><c:out value="${sessionScope.sessionDate}" /> </h5>
	<h5> <b> Source City:</b><c:out value="${sessionScope.sessionSource}" /> </h5>
	<h5> <b> Destination City:</b><c:out value="${sessionScope.sessionDestination}" /> </h5>
	<h5> <b> Number of Passengers:</b><c:out value="${sessionScope.sessionNumberPassengers}" /> </h5>
	<h5> <b> Flight Number:</b><c:out value="${sessionScope.flightNumber }" /> </h5>
	
	<h2>Enter Below Details to process</h2>
	<form method="post" action="flyAway_ReviewPage.jsp">
	<Strong>Full Name:</Strong> <input type="text" name="fullname" required /><br>
	<Strong>Address:</Strong> <input type="text" name="address" required /><br>
	<Strong>Age:</Strong> <input type="text" name="age" required /><br>
	<Strong>Mobile:</Strong> <input type="text" name="mobile" required /><br>
	<Strong>Email:</Strong> <input type="text" name="email" required /><br>
	<Strong>Identification Number:</Strong><br>
	<select id="idnum" name="idnum"> </Strong> 
		<option value="">Select </option>
		<option value="AdarCard">AdarCard</option>
		<option value="Passport">Passport</option>
	    <option value="DrivingLicense">DrivingLicense</option>
	    <option value="VoterId">VoterID</option>
   </select> <input type="text" name="idvalue" required /><br>
   <Strong>Country:</Strong> <input type="text" name="country" required /><br>
	<br><br>
   <input id="submit_btn" type="submit" value="Submit"> 
			<input id="reset_btn" type="reset" value="Cancel" />
	</form>
	
	
	<c:set var="sessionFull_name" value="${param.fullname}" scope="session" />
<c:set var="sessionAddress" value="${param.address}" scope="session" />
<c:set var="sessionAge" value="${param.age}" scope="session" />
	
	
	
	


</body>
</html>