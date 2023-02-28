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
		

     
    <h3>Confirmation: Here are your flight details: </h3>
   <h4> PNR code  <c:out value="QWe1324364544yyy4"></c:out> </h4>
					<sql:query dataSource="${db}" var="rs">  
			SELECT * from register_details;  
		</sql:query>
		
<sql:update dataSource="${db}" var="count">  
INSERT INTO register_details (full_name,address,age,mobile_phone, email_username  ,id_number  , country  ) VALUES (?, ?, ?, ?,?,?,?)
<sql:param value="${sessionScope.sfullname}" />
<sql:param value="${sessionScope.saddress}" />
<sql:param value="${sessionScope.sage}" />
<sql:param value="${sessionScope.smobile}" />
<sql:param value="${sessionScope.semail}" />
<sql:param value="${sessionScope.sid}" />
<sql:param value="${sessionScope.scountry}" /> 
</sql:update>
		 
		 		 

	<!-- sql:query  tag -->
	<sql:query dataSource="${db}" var="rs">  
	SELECT * from booking_flights;  
</sql:query>
	
	<sql:update dataSource="${db}" var="count">  
INSERT INTO booking_flights (email_username ,booking_id,flight_no ) VALUES (?, ?, ?)
<sql:param value="${sessionScope.semail}" />
<sql:param value="${count}" />
<sql:param value="${sessionScope.flightNumber}" />

</sql:update>


<sql:query dataSource="${db}" var="rs">  
			SELECT * from flights;  
		</sql:query>
			<c:forEach var="table" items="${rs.rows}">
			<c:if test="${table.flight_no eq sessionScope.flightNumber}">
			<c:set var="seatCount" value= "${table.seats_availible}"  scope="session"/>
			</c:if>
			</c:forEach>
			
	<c:set var="newSeatCount" value= "${sessionScope.seatCount - sessionScope.sessionNumberPassengers}"  scope="session"/>
				<h4>Review Your Travel Details </h4>
				
Old Seat count<c:out value="${sessionScope.seatCount}" />
New Seat Count<c:out value="${sessionScope.newSeatCount}" />
Passengers <c:out value="${sessionScope.sessionNumberPassengers}" />
Number <c:out value="${sessionScope.flightNumber}" />

	<sql:query dataSource="${db}" var="rs">  
	SELECT * from booking_flights;  
</sql:query>
	

<sql:query dataSource="${db}" var="rs">  
			SELECT * from flights;  
		</sql:query>
	<sql:update dataSource="${db}" var="rs">  

	UPDATE flights SET seats_availible= ? WHERE flight_no = ?;
	
    <sql:param value="${sessionScope.newSeatCount}" />
    <sql:param value="${sessionScope.flightNumber}" />

  </sql:update>
	

</body>
</html>