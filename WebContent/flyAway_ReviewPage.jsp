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


<c:set var="sfullname" value= "${param.fullname}"  scope="session"/>
<c:set var="saddress" value= "${param.address}"  scope="session"/>
<c:set var="sage" value= "${param.age}"  scope="session"/>
<c:set var="smobile" value= "${param.mobile}"  scope="session"/>
<c:set var="semail" value= "${param.email}"  scope="session"/>
<c:set var="sid" value= "${param.idnum}"  scope="session"/>
<c:set var="scountry" value= "${param.country}"  scope="session"/>


<!-- sql:setDataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/flyaway" user="root" password="root" />
		
		<sql:query dataSource="${db}" var="rs">  
			SELECT * from flights;  
		</sql:query>
			<c:forEach var="table" items="${rs.rows}">
			<c:if test="${table.flight_no eq sessionScope.flightNumber}"></c:if>
			<c:set var="ticketPrice" value= "${table.price}"  scope="session"/>
			</c:forEach>
			
	<c:set var="totalCost" value= "${ticketPrice * sessionScope.sessionNumberPassengers}"  scope="session"/>
				<h4>Review Your Travel Details </h4>

		<form method="post" action="flyAway_Confirm.jsp">
		<h4><b>Name: </b><c:out value="${sfullname}"></c:out></h4>
		<h4><b>Address:</b><c:out value="${saddress}"></c:out></h4>
		<h4><b>Age: </b><c:out value="${sage}"></c:out></h4>
		<h4><b>Phone: </b><c:out value="${smobile}"></c:out></h4>
		<h4><b>Email:</b><c:out value="${semail}"></c:out></h4>
		<h4><b>ID Number:</b><c:out value="${sid}"></c:out></h4>
		<h4><b>Country: </b><c:out value="${scountry}"></c:out></h4>
		<h4><b>Ticket Cost: </b><c:out value="${ticketPrice}"></c:out></h4>
		<h4><b>Total Ticket Cost:</b> <c:out value="${totalCost}"></c:out></h4>
		<br><br>
		   <input id="submit_btn" type="submit" value="Purchase Now"> 		
		</form>
</body>
</html>