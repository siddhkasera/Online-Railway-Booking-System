<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<a href = "Customer-Success.jsp"><button> Home </button></a>
		<title>Browsing</title>
		<style>
			table, td, th {
	  			border: 1px solid black;
			}
			table {
				border-collapse: collapse;
				width: 70%;
			}
			h3, h1 {
				text-align: center;
			}
		</style>
</head>
<body>
		<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement(); 
		%>
		<center><h4>Browse and Sort Schedules</h4>
		
		<p> How would you like to sort the schedules by?: </p></center>
			<center>
			<form action="BrowseFunction.jsp">
				<select name="Filters">
				  <option value = ""> Filter By... </option> 
				  <option value = "Transit Line">Transit Line</option>
				  <option value = "Origin">Origin Stop</option>
				  <option value = "Destination">Destination Stop</option>
				</select>
				<button>Submit</button>
			</form>
			<form action="BrowseFunction.jsp">
				<select name="filterByOrigin">
					<option value= "choose">choose</option>
					<option value= "Metropark">Metropark</option>
					<option value= "Metuchen">Metuchen</option>
					<option value= "Edison">Edison</option>
					<option value= "New Brunswick">New Brunswick</option>
					<option value= "Dunellen">Dunellen</option>
					<option value= "Bound Brook">Bound Brook</option>
					<option value= "Bridgewater">Bridgewater</option>
					<option value= "Somerville">Somerville</option>
					<option value= "Newark Intl Airport">Newark Intl Airport</option>
					<option value= "Princeton Junction">Princeton Junction</option>
					<option value= "Trenton">Trenton</option>
					<option value= "Philadelphia">Philadelphia</option>
					<option value= "Secaucus Junction">Secaucus Junction</option>
					<option value= "Harrison">Harrison</option>
					<option value= "Elizabeth">Elizabeth</option>	
				</select>
				<button>submit origin</button>
			</form>
			<form action="BrowseFunction.jsp">
				<select name="filterByDest">
					<option value= "choose">choose</option>
					<option value= "Metropark">Metropark</option>
					<option value= "Metuchen">Metuchen</option>
					<option value= "Edison">Edison</option>
					<option value= "New Brunswick">New Brunswick</option>
					<option value= "Dunellen">Dunellen</option>
					<option value= "Bound Brook">Bound Brook</option>
					<option value= "Bridgewater">Bridgewater</option>
					<option value= "Somerville">Somerville</option>
					<option value= "Newark Intl Airport">Newark Intl Airport</option>
					<option value= "Princeton Junction">Princeton Junction</option>
					<option value= "Trenton">Trenton</option>
					<option value= "Philadelphia">Philadelphia</option>
					<option value= "Secaucus Junction">Secaucus Junction</option>
					<option value= "Harrison">Harrison</option>
					<option value= "Elizabeth">Elizabeth</option>	
				</select>
				<button>submit destination</button>
			</form>
		
		<table>
			<%
			if (request.getParameter("Filters") != null && !request.getParameter("Filters").isEmpty()){
				String filter = request.getParameter("Filters");
				out.println("<h3>" +"Okay we will sort by: " + request.getParameter("Filters"));
				
				ResultSet rs;
				
				if(filter.equals("Transit Line")) {
					rs = stmt.executeQuery("select bst.schedId, tlr.tlName, s.name, st.name, bst.dept_time, bst.arrv_time from buildScheduleWithTimes bst, " + 
												"Transit_line_route tlr, station s, station st where bst.routeId = tlr.routeId and tlr.origin = s.stationId and tlr.dest = st.stationId order by tlr.tlName;");
				}
				else if(filter.equals("Destination")) {
					rs = stmt.executeQuery("select bst.schedId, tlr.tlName, s.name, st.name, bst.dept_time, bst.arrv_time from buildScheduleWithTimes bst, " + 
							"Transit_line_route tlr, station s, station st where bst.routeId = tlr.routeId and tlr.origin = s.stationId and tlr.dest = st.stationId order by tlr.dest");
				}
				else {
					rs = stmt.executeQuery("select bst.schedId, tlr.tlName, s.name, st.name, bst.dept_time, bst.arrv_time from buildScheduleWithTimes bst, " + 
							"Transit_line_route tlr, station s, station st where bst.routeId = tlr.routeId and tlr.origin = s.stationId and tlr.dest = st.stationId order by tlr.origin;");
				}
			
				while(rs.next()){
					out.println("<tr><td>"+rs.getString("bst.schedId")+
							"</td><td>" +rs.getString("tlr.tlName")+
							"</td><td>" +rs.getString("s.name")+
							"</td><td>" +rs.getString("st.name")+
							"</td><td>" +rs.getString("bst.dept_time")+
							"</td><td>"+rs.getString("bst.arrv_time")+ "</td><td>");
			    		//out.println(rows);
				}
				
			}
			else if (request.getParameter("filterByOrigin") != null && !request.getParameter("filterByOrigin").isEmpty()) {
				String station = request.getParameter("filterByOrigin");
				out.println("<h2>trains with " + station + " as origin: ");
				ResultSet rs = stmt.executeQuery("select bst.schedId, tlr.tlName, s.name, st.name, bst.dept_time, bst.arrv_time from buildScheduleWithTimes bst, " + 
														"Transit_line_route tlr, station s, station st where bst.routeId = tlr.routeId and tlr.origin = s.stationId and tlr.dest = st.stationId and s.name = '" + station +"'");
				while(rs.next()){
					out.println("<tr><td>"+rs.getString("bst.schedId")+
							"</td><td>" +rs.getString("tlr.tlName")+
							"</td><td>" +rs.getString("s.name")+
							"</td><td>" +rs.getString("st.name")+
							"</td><td>" +rs.getString("bst.dept_time")+
							"</td><td>"+rs.getString("bst.arrv_time")+ "</td><td>");
			    		//out.println(rows);
				}
			}
			else if (request.getParameter("filterByDest") != null && !request.getParameter("filterByDest").isEmpty()) {
				String station = request.getParameter("filterByDest");
				out.println("<h2>trains with " + station + " as destination: ");
				ResultSet rs = stmt.executeQuery("select bst.schedId, tlr.tlName, s.name, st.name, bst.dept_time, bst.arrv_time from buildScheduleWithTimes bst, " + 
														"Transit_line_route tlr, station s, station st where bst.routeId = tlr.routeId and tlr.origin = s.stationId and tlr.dest = st.stationId and st.name = '" + station +"'");
				while(rs.next()){
					out.println("<tr><td>"+rs.getString("bst.schedId")+
							"</td><td>" +rs.getString("tlr.tlName")+
							"</td><td>" +rs.getString("s.name")+
							"</td><td>" +rs.getString("st.name")+
							"</td><td>" +rs.getString("bst.dept_time")+
							"</td><td>"+rs.getString("bst.arrv_time")+ "</td><td>");
			    		//out.println(rows);
				}
			}
			%>
		</table>
		</center>
</body>
</html>