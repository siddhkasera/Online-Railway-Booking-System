<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>View Users</title>
		<style>
			table, td, th {
	  			border: 1px solid black;
			}
			table {
				  border-collapse: collapse;
				  width: 80%;
			}
			h3, h1 {
					text-align: center;
			}
		</style>
	</head>
	<body>
		<a href = "Admin-Success.jsp"><button> Home </button></a>
		<center><h4>Edit Costumer Rep Account</h4></center>
		<table>
		<tr>
			<th> Username </th>
			<th> Password </th>
			<th> First Name </th>
			<th> Last Name </th>
			<th> SSN </th>
			<th> Edit </th>
			<th> Delete </th>
		</tr>
		<% 
	
		try{
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT repuser, reppass, firstname, lastname, ssn FROM customerrep");
			/*  admin can add, edit, and delete */
			
			while(rs.next()){
			%>
				<tr>
				<td><%=rs.getString("repuser") %> </td>
				<td><%=rs.getString("reppass") %> </td>
				<td><%=rs.getString("firstname") %> </td>
				<td><%=rs.getString("lastname") %> </td>
				<td><%=rs.getString("ssn") %> </td>
				
				<td>
					<a href ="Admin-EditRep.jsp?value=<%=rs.getString("repuser") %>" class = "btn btn-warning"> Edit </a> 
				</td>
				<td>
					<a href ="Admin-DeleteRep.jsp?value=<%=rs.getString("repuser") %>" class = "btn btn-warning"> Delete </a> 
				</td>
				</tr>
			
			<%
			}
			db.closeConnection(con);
		}
		catch (Exception e) {
			out.print(e);
		}
		 %>
		</table>
	</body>
</html>