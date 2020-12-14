<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Customer Booking</title>
</head>

<body>
    <%@ page import ="java.sql.*" %>
    Booking
    <br>
    <%
    String trainId = request.getParameter("train-Id") + ""; 
    
    
    String triptype = request.getParameter("triptype") + "";   
    String sort = request.getParameter("button1") + ""; 
    
    String train_price = request.getParameter("price") + "";   
    String train_stops = request.getParameter("stops") + "";
    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet rs1;
    String sql= "";

    

    rs1 = stmt.executeQuery("select * from trainRunsOn where trainId= '" 
    + trainId + "' and train_price= '" + train_price);
    
    while(rs1.next()){
 		String trainId= rs1.getString(1);
    	
    	String dair = rs1.getString(3);
    	String ddate = rs1.getString(4);
    	String dtime = rs1.getString(5);
    	String aair = rs1.getString(6);
    	
    	
    	
    	out.println(rs1.getString(1) + rs1.getString(2));
    	out.println(rs1.getString(3));
    	out.println(rs1.getString(4));
    	out.println(rs1.getString(5));
    	out.println(rs1.getString(6));
    	
    	%>

    <form action="CustomerConfirmation.jsp">
        <input type="submit" name="button_clicked" value="Book for Round Trip">
        <input type="submit" name="button_clicked" value="Book for Single Trip">
        <input type="hidden" name=train_Id value="<%=trainId%>">
        <input type="hidden" name=fare value="<%=train_price%>">
        <input type="hidden" name=noStops value="<%=noStops%>">
        <input type="hidden" name=dep_time value="<%=dtime%>">

    </form>





    <%} %>


</body>

</html>