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
<title>Dakvin Fly Away Flight Booking Company</title>
<link rel="stylesheet" href="flyAwayLogin.css">
<h2>Welcome to Admin </h2>
</head>
<body>
	<!-- sql:setDataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project1" user="root" password="root" />
		
	<h3>Only Admin users can change the password</h3>
	<h3>Admin Login</h3>                  
		<form action="adminLogin.jsp" method="post" >
			<Strong>UserName:</Strong> <input type="text" name="username" required /><br>
			<br>
			<Strong>Password:</Strong> <input type="password" name="password" required /><br>
			<br>
			<br>
			<input id="submit_btn" type="submit" value="Submit"> 
			<input id="reset_btn" type="reset" value="Cancel" />
		</form>
		
		
			<!-- sql:query  tag -->
	<sql:query dataSource="${db}" var="rs">  
	SELECT * from adminlogin;  
    </sql:query>
			<c:if test="${param.username != null}" >
				<c:forEach var="table" items="${rs.rows}">
					<c:if test="${param.username eq table.Name}">
						<c:if test="${param.password eq table.Password}">
							<c:set var="admin_user_name" value="${param.username}"
								scope="session" />
		  				 <c:redirect url="admindashboard.jsp"></c:redirect>			
			</c:if>
			</c:if>
			</c:forEach>
			<br>
			<br>
			<br>
			<br>
			<br>
				<p class="error"><b>Entered UserName and Password are not Matching</b><p>
			<p class="error"><b>Please try again!!!</b></p>
			</c:if>
	 
	
</body>
</html>