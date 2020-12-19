<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<a href = "Rep-Success.jsp"><button> Home </button></a>
		<title>Schedule for station</title>
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
		<center><h4>Obtain Schedule for a Station</h4>
		
		<p> How would you like to sort the schedules by?: </p></center>
			<center>
			<form action="Rep-TableForStation.jsp">
				<select name="stations">
					<option value= "choose">choose station...</option>
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
				<button>submit station</button>
			</form>
			</center>	
			
			<table> 
			<% 
			if(request.getParameter("stations") != null && !request.getParameter("stations").isEmpty());
			String station = request.getParameter("stations");
			out.println("<h2>schedules with " + station + "</h2>");
			ResultSet rs = stmt.executeQuery("select bst.schedId, tlr.tlName, s.name, st.name, bst.dept_time, bst.arrv_time from buildScheduleWithTimes bst, " + 
													"Transit_line_route tlr, station s, station st where bst.routeId = tlr.routeId and tlr.origin = s.stationId and tlr.dest = st.stationId " + 
													"and (s.name = '" + station + "' or st.name = '" + station + "') order by bst.schedId");
			while(rs.next()){
				out.println("<tr><td>"+rs.getString("bst.schedId")+
						"</td><td>" +rs.getString("tlr.tlName")+
						"</td><td>" +rs.getString("s.name")+
						"</td><td>" +rs.getString("st.name")+
						"</td><td>" +rs.getString("bst.dept_time")+
						"</td><td>"+rs.getString("bst.arrv_time")+ "</td><td>");
		    		//out.println(rows);
			}
		    %>
		    </table>
			
</body>
</html>