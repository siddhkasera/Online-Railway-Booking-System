<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Reservations</title>
	</head>
	<body>
		
		<a href = "Admin-Success.jsp"><button> Home </button></a>
		<%
		try{
			
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			ResultSet result = stmt.executeQuery("SELECT distinct customeruser from reservation;");
			%>
			<p> Choose one at a time: </p>
			
			
			<form action = "Admin-Reservations.jsp" method= "post">
				
				<select name="username" id="username">
					<option value="" selected>All users</option>
		
					<%
					while(result.next()) {
					%>
		  				<option value=<%=result.getString("customeruser")%> ><%out.print(result.getString("customeruser"));%> </option>
					<%
					}
					%>
				</select>
				
				<%
				result = stmt.executeQuery("SELECT tlName FROM transitLine ;"); %>
	
				<select name="transitLine" id="transitLine">
				<option value="" selected>All Transit Lines</option>
				<%
				while(result.next()) {
				%>
	  				<option value=<%=result.getString("tlName")%> ><%out.print(result.getString("tlName"));%> </option>
				<%
				}
				%>
				</select>
				
				<INPUT TYPE="submit" VALUE="Filter"/>
			</form>
			<%
			// display all information for selected username
			if (request.getParameter("username") != null && request.getParameter("transitLine") == null){
				%><p> Add table at Admin-Reservations.jsp line 60 </p><%
			}
			// display all reservations for selected transit line
			if (request.getParameter("transitLine") != null && request.getParameter("username") == null){
				%><p> Add table at Admin-Reservations.jsp line 64 </p><%
			}
			
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
		%>
		<table id = "reservationTable" align = "center" style="width:90%">
			<tr>
		  		<th>Transit Line</th>
		  		<th>User</th>
		    	<th>Train ID</th>
		    	<th>Origin</th>
		    </tr>
		</table>
		
		<p> Admin-Reservations.jsp add 5 most active transit lines </p>
		
	</body>
</html>