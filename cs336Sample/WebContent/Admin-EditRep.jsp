<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Edit Customer Rep</title>
		
	</head>
	<body>
		<a href = "Admin-Success.jsp"><button> Home </button></a>
		<p> Edit a customer representative account info: </p>
		<% 
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			String repuser = request.getParameter("value");
			ResultSet rs = stmt.executeQuery("SELECT firstname, lastname FROM customerrep WHERE repuser ='" + repuser + "'");
			rs.next();
			
			String firstname = rs.getString("firstname");
	    	session.setAttribute("c.firstname", firstname);
	    	String lastname = rs.getString("lastname");
	    	session.setAttribute("c.lastname", lastname);
	    	
	    	db.closeConnection(con);
	    }
		catch(Exception e){
 			out.print(e);
		}
		%>
		<form action="Admin-SubmitEdit.jsp?value=<%=request.getParameter("value") %>" method="POST">
    		First Name: <input type="text" name="firstname" value = "<%= session.getAttribute("c.firstname") %>"/> <br/>
		    Last Name: <input type="text" name="lastname" value = "<%= session.getAttribute("c.lastname") %>"/> <br/>			
			<input type="submit" value="Submit"/>
		</form>
	</body>
</html>