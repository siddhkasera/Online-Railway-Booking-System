<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Submit Account Edit</title>
	</head>
	<body>
		<% 
	
		try{
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			String repuser = request.getParameter("value");
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			
			int x = stmt.executeUpdate("UPDATE customerrep SET firstname='" + firstname +
				"',  lastname='" + lastname+ "' WHERE repuser ='"+ repuser+"'");
			if(x == 1){
				response.sendRedirect("Admin-ViewUsers.jsp");
			}
			db.closeConnection(con);
		}
		catch (Exception e) {
			out.print(e);
		}
		%>
	</body>
</html>