<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset ="UTF-8">
		<title>Messaging</title>
		<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		%>
	</head>
	<body>
		<a "href="Customer-Success.jsp"><button>Home</button></a>
		<p style="float: right;"><a "href="Logout.jsp"><button>Logout</button></a>
	
		<h3>Messaging</h3>
		
		<p> Search questions:</p>
		<form action= "Customer-messaging.jsp" method ="POST">
			<input name ="search" type= "text" placeholder="Enter keywords here"></input> <br>
			<button> Enter </button>
		</form>
		
		<p> Enter a question here:</p>
		<form action =Customer-messaging.jsp method="POST">
			   <input name ="subject" id ="question" type= "text" placeholder ="Subject"></input> <br>
			   <textarea  name = "content" placeholder="How can we help you?"></textarea> <br>
			<button> Post Question </button>
		</form>
			
		<%
		//read what the user is entering in the form 
		String customeruser = (String)session.getAttribute("customeruser");
		String search = request.getParameter("search");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
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
			<%
			}
		}
		// searching now
		if(request.getParameter("search") != null){ 
			// display search results where subject or content has keywords
			ResultSet rs1 = stmt.executeQuery("SELECT * FROM messages WHERE subject REGEXP '" + search+ "' or content REGEXP '" + search+ "'ORDER BY messageId");
			while(rs1.next()){
				out.println("ID: "); %>
				<%=rs1.getString("messageId") %> <br>
				
				<% out.println("Subject: ");  %>
				<%=rs1.getString("subject") %> <br>
				
				<% out.println("Content: ");  %>
				<%=rs1.getString("content") %> <br>
				
				<% out.println("Answer: ");  %>
				<%=rs1.getString("answer") %> <br> <br>
		<%	}
		}
		
		// creating a new message
		if(request.getParameter("subject") != null){ 
			int x = stmt.executeUpdate("INSERT INTO messages (customeruser, subject, content) VALUES ('" +customeruser + "', '" + subject+ "', '" + content +"')");
			response.sendRedirect("Customer-messaging.jsp");
		}
			
		db.closeConnection(con); 
		%>
	</body>
</html>