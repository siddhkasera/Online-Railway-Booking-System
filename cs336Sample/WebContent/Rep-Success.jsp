<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<style>
			table, th, td {
			  border: 1px solid black;
			  border-collapse: collapse;
			}
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Success</title>
	</head>
	<body>
		<%
		    if ((session.getAttribute("repuser") == null)) {
		%>
			You are not logged in<br/>
			<a href="AccountType.jsp">Please Login</a>
		<%} else {
		%>
			Welcome <%=session.getAttribute("repuser") %>  
			<a href="Logout.jsp">Log out</a>
		<%
		    }
		%>
		// add more things here for Costumer Representative account functionalities
		<table style="width:70%">
		  <tr>
		    <th>Firstname</th>
		    <th>Lastname</th> 
		    <th>Age</th>
		  </tr>
		  <tr>
		    <td>Jill</td>
		    <td>Smith</td> 
		    <td>50</td>
		  </tr>
		  <tr>
		    <td>Eve</td>
		    <td>Jackson</td> 
		    <td>94</td>
		  </tr>
		</table>
		<a href= "Rep-TableForStation.jsp"><button>produce schedule for specific station</button>
	</body>
</html>