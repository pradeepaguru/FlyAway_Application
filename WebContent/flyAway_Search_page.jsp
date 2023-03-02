<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="styleSheet.css">
<title>Insert title here</title>
</head>
<body>


 <p> Welcome back <c:out value="${sessionScope.user_name}"/> </p> <a href="logout.jsp">Logout</a>
 <br>
 
<form action="flyAway_FlightDetails.jsp">
  <label for="date">Date of travel:</label>
  <select id="date" name="date">
   <option value="">Select Date</option>
    <option value="10-10-2023">10-10-2023</option>
    <option value="03-03-2023">03-03-2023</option>
  </select>
  
   <label for="source">Source city:</label>
  <select id="source" name="source">
   <option value="">Select City</option>
    <option value="Chennai">Chennai</option>
      <option value="Madurai">Madurai</option>
   
  </select>
  
     <label for="destination">Destination city:</label>
  <select id="destination" name="destination">
  <option value="">Select City</option>
<option value="Chennai">Chennai</option>
      <option value="Madurai">Madurai</option>
  </select>
  
  <br>
  <br>
  <label for="class">Class</label>
     <input type="radio" id="economy" name="type" value="Economy">
  <label for="economy">Economy</label>
  
  <input type="radio" id="buisness" name="type" value="Business">
  <label for="buisness">Business</label>
  <br>
  <br>
       <label for="number">Number of persons:</label>
    <select id="number" name="number">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
  </select>
  
  <br><br><br>
  <input id="submit_btn" type="submit" value="Search"> 
			<input id="reset_btn" type="reset" value="Cancel" />
</form>
 

 
 
</body>
</html>