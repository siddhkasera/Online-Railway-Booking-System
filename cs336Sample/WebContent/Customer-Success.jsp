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
			<a href="AccountType.jsp"><button> Please Login </button></a>
		<%} else {
			%>
			<h2> Welcome <%=session.getAttribute("customeruser") %></h2>
			<%
		}
		%>
		<br>
		<a href= "Customer-messaging.jsp"><button> Messaging </button></a>
		<button>Reserve a Ticket</button>
		<button>View Past Reservations</button>
		<button>View Travel Itinerary</button>
		<a href= "BrowseFunction.jsp"><button>Browse Train Schedule</button>
		<a href="Logout.jsp"><button>Log out</button></a>
		
	</body>
</html>