<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Success</title>
	</head>
	<body>
		<%
		    if ((session.getAttribute("customeruser") == null)) {
		%>
		You are not logged in<br/>
		<a href="AccountType.jsp">Please Login</a>
		<%} else {
		%>
		<h2> Welcome <%=session.getAttribute("customeruser") %>  
		<a href="Logout.jsp">Log out</a> </h2>
		<%
		  }
		%>
		<p> What would you like to do? </p>
		<button>Reserve A Ticket</button>
	    <button>View All Reservations</button>
	    <button>View Travel Itinerary</button>
	    <button>Message a Customer Rep</button>
		
	</body>
</html>