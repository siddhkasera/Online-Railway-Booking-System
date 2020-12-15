<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Customer Login</title>
	</head>
	<body>
		<h4>Already have an account? Login here </h4>
		<form action="Customer-CheckLogin.jsp" method="POST">
			Username: <input type="text" placeholder="Enter your username" required maxlength="30" name="Username"/> <br/>
		    Password: <input type="password" placeholder="Enter your password" required maxlength="45" name="Password"/> <br/>
		<input type="submit" value="Submit"/>
	    </form>
		
		<h4>Register for a new account:</h4>
		<form action="Customer-newAccLogin.jsp" method="POST">
			Username: <input type="text" placeholder="Enter your username" required maxlength="30" name="Username"/> <br/>
		    Password: <input type="password" placeholder="Enter your password" required maxlength="45" name="Password"/> <br/>
	       	Email: <input type="email" placeholder="Enter your email" required maxlength="45" name="Email"/> <br/>
	       	First Name: <input type="text" placeholder="Enter your first name" required maxlength="25" name="FirstName"/> <br/>
	       	Last Name: <input type="text" placeholder="Enter your last name" required maxlength="25" name="LastName"/> <br/>
	       	<input type="submit" value="Submit"/>
	     </form>
	</body>
</html>