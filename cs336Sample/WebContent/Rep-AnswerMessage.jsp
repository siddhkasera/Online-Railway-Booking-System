<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset ="UTF-8">
		<title>Rep Answer Message</title>
		
	</head>
	<body>
		
		<p style="float: right;"><a "href="Logout.jsp"><button>Logout</button></a>
	
		<h3>Answer Customer's Questions</h3>
		<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		%>
		
		<%
		// this gets displayed when the user is not searching for particular keywords
		if(request.getParameter("search") == null){
			%>
			<p> Browse questions:</p>
		 	<% 
		 	ResultSet rs = stmt.executeQuery("SELECT messageId, subject, content, answer FROM messages");
		
			/*  admin can add, edit, and delete */
			while(rs.next()){
				%>
				<% out.println("ID: ");  %>
				<%=rs.getString("messageId") %> <br>
				
				<% out.println("Subject: ");  %>
				<%=rs.getString("subject") %> <br>
				
				<% out.println("Content: ");  %>
				<%=rs.getString("content") %> <br>
				
				<% out.println("Answer: ");  %>
				<%=rs.getString("answer") %> <br> <br>
				
				<form action="Rep-Response.jsp?value=<%=request.getParameter("messageId") %>" method="POST">
					<input name ="response" type= "text" placeholder="Enter response here"></input> <br>
					<button> Submit </button>
				</form>
					
			<%
			}
		}
		
		
		// creating a new message
		if(request.getParameter("subject") != null){ 
			int x = stmt.executeUpdate("INSERT INTO messages (customeruser, subject, content) VALUES ('" + customeruser + "', '" + subject+ "', '" + content +"')");
			response.sendRedirect("Customer-messaging.jsp");
		}
			
		db.closeConnection(con); 
		%>
	</body>
</html>