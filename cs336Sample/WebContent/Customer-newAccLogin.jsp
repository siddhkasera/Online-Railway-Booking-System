<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Login to New Customer Account</title>
	</head>
	<body>
		<%@ page import ="java.sql.*" %>
		<%
			String userid = request.getParameter("Username");
			String pass = request.getParameter("Password");
			String email = request.getParameter("Email");
			String firstname = request.getParameter("FirstName");
			String lastname = request.getParameter("LastName");
			
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
		    
		    ResultSet rs;
		    rs = stmt.executeQuery("select * from customer where customeruser='" + userid + "'");
		    if (rs.next()) {
		    	out.println("Username exists, please try another <a href='Customer-Login.jsp'>try again</a>");
		    } else {
		    	int x = stmt.executeUpdate("insert into customer values('" + userid + "', '" + email + "', '" + firstname + "', '" + lastname + "', '" + pass + "')");
		    	session.setAttribute("customeruser", userid); // the username will be stored in the session
		        response.sendRedirect("Customer-Success.jsp");
		    }
		%>
	</body>
</html>