<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Success</title>
	</head>
	<body>
		<% if ((session.getAttribute("adminuser") == null)) { %>
			You are not logged in<br/>
			<a href="AccountType.jsp">Please Login</a>
		<%} 
		else { %>
			Welcome <%=session.getAttribute("adminuser") %>  
			<a href="Logout.jsp"><button>Log out</button></a>
		<% } %>
		
		<p style="float: right;"><a href="Logout.jsp">Log out</a></p>
		<br>
		
		<!-- -->
		<!-- Edit costumer representative accounts-->
		<a href = "Admin-ViewUsers.jsp"><button> View Costumer Reps </button></a>
		<!-- Sales Reports by month-->
		<a href = "Admin-SalesReport.jsp"><button> Sales Report </button></a>
		<!--Reservations sorted by transit line or costumer -->
		<a href = "Admin-Reservations.jsp"><button> Reservations </button></a>
		<!--Revenue sorted by transit line or costumer -->
		<a href = "Admin-Revenue.jsp"><button> Revenue </button></a>
		<!-- best customer -->
		<a href = "Admin-BestCustomer.jsp"><button> Best Customer </button></a>
		<!-- 5 most active lines -->
		<a href = "Admin-ActiveLines.jsp"><button> Most Active Lines </button></a>
		<!--
			<input type = "button" value = "View Users" 
			<input type = "button" value = "Browse All Train Schedules"
			<input type = "button" value = "Reserve/View Train Schedules"
			<input type = "button" value = "Manage Train Schedule"
			<input type = "button" value = "View Sales Reports"
			<input type = "button" value = "View Reservations" 
			<input type = "button" value = "View Messages"
		-->
		
	</body>
</html>