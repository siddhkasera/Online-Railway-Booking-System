<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Check Customer Login</title>
	</head>
	
	<body>
			<%@ page import ="java.sql.*" %>
		<%
		    String userid = request.getParameter("Username");
		    String pwd = request.getParameter("Password");
		    
		    ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
		    Statement stmt = con.createStatement();
		    
			ResultSet rs1;
		    rs1 = stmt.executeQuery("SELECT * FROM customer WHERE customer-user = " + userid);
		    
		    /*
		    if (rs1.next()){
		    	 ResultSet rs2;
		    	    rs2 = stmt.executeQuery("select * from customer where customer-user=" + userid + " and password=" + pwd);
		    	    if (rs2.next()) { // if set is not empty, store username in session
		    	    	session.setAttribute("user", userid);
		    	        response.sendRedirect("Customer-Success.jsp");
		    	    } else {  // try again if username exists but password is incorrect
		    	        out.println("Invalid password <a href='Customer-Login.jsp'>try again</a>");
		    	    }
		    }
		    else{   // if username does not exist, create an account
		    	out.println("Username doesn't exist <a href= 'Customer-CreateAccount.jsp'>Create An Customer Account</a>");
		    }*/
		    
		%>
	</body>
</html>