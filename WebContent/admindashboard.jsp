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
 <p> Welcome back <c:out value="${sessionScope.admin_user_name}"/> </p> 
</head>
<body>


<form action="changePassword.jsp" method="post" >
<strong>Enter New Password</strong><input type="password" name="newpassword" required/><br>
<strong>Enter Confirm Password</strong><input type="password" name="confirmpassword" required/><br>
<br>


<input id="submit_btn" type="submit" value="Submit"> 
<input id="reset_btn" type="reset" value="Cancel" />

</form>
		


	
  </body>
</html>
  