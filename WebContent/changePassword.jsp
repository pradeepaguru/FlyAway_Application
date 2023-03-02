
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
<link rel="stylesheet" href="flyAwayLogin.css">
<title>Insert title here</title>
</head>
<body>

<c:set var="newadmin_password" value= "${param.newpassword}"  scope="session"/>
<c:set var="confirmadmin_password" value= "${param.confirmpassword}"  scope="session"/>	
<c:set var="admin_user_name" value= "${param.newusername}"  scope="session"/>	
 
<!-- sql:setDataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project1" user="root" password="root" />
		
	<sql:query dataSource="${db}" var="rs">  
	SELECT * from userlogin;  
</sql:query>

<c:forEach var="table" items="${rs.rows}">
					<c:if test="${sessionScope.admin_user_name eq table.Name}">
	<c:set var="oldpassword" value= "${table.Password}"  scope="session"/>

			</c:if>
		
			</c:forEach>
			
<sql:query dataSource="${db}" var="rs">  
			SELECT * from userlogin;  
		</sql:query>
	<sql:update dataSource="${db}" var="rs">  

	UPDATE userlogin SET Password= ? WHERE Name = ?;
	
    <sql:param value="${sessionScope.newadmin_password}" />
    <sql:param value="${sessionScope.admin_user_name}" />

  </sql:update>

			
  <h3>Password Successfully changed for the user <c:out value="${sessionScope.admin_user_name}" /> </h3> 
</body>
</html>