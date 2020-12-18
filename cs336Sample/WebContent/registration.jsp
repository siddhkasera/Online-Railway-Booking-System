<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import= "java.time.format.DateTimeFormatter, java.time.LocalDateTime"%>
<%@ page import = "java.text.DateFormat, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Success</title>
	</head>
	<body>
		
	<%
	if((session.getAttribute("user") == null) || (session.getAttribute("role") == null))  {
		response.sendRedirect("AccountType.jsp");
	}
	/* String username = (String) session.getAttribute("username");
	if(((String)session.getAttribute("role")).equals("customer")){
		username = (String) session.getAttribute("user");
	} */
	
	String username = (String) session.getAttribute("customeruser");
    if(session.getAttribute("username") != null){
        username = (String) session.getAttribute("username");
    }
	String date_ticket = (String) session.getAttribute("date"); //the day its reserved for
	String org = (String) session.getAttribute("origin");
	String dest = (String) session.getAttribute("destination");
	String trip = (String) session.getAttribute("tripType");
	String discount = (String) session.getAttribute("discount_group");
	String fare_ = (String) session.getAttribute("fixed fare");
	System.out.println(username + " " + date_ticket +  " " + org + " " + dest + " " + trip + " " + discount + " " + fare_);
	
	try{
		//connect to database
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		Date date = Calendar.getInstance().getTime();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    Date dateob = new Date();
	    System.out.println(df.format(dateob));
	    
	    int fare = Integer.parseInt(fare_);
	    //int total_fare_ = Integer.parseInt(total_fare);
		int origin = 0;
		int destination = 0;
		String date_reserved = df.format(dateob);
		
		String station_name = "SELECT s.name FROM station s" + "WHERE s.name= '"+ org + "' OR s.name = '" + dest + " ';";
	
		ResultSet output = stmt.executeQuery(station_name);
		
		while(output.next()){
			if(output.getString(station_name).equals(org)){
				origin = output.getInt("stationId");
			}else if(output.getInt("name") == dest){
				destination = output.getInt("stationId");
			}
		}
		if(trip.equals("roundtrip")){
			fare = total_fare*2;
		}/*else if(trip.equals("oneway")){
			fare = totalfare;
		}*/
		if(discount.equals("Disabled")){
			fare = total_fare / 2;
		}
		if(discount.equals("Child")){
			fare = fare - (0.25 * total_fare);
		}
		if(discount.equals("Senior")){
			fare = fare - (0.35 * total_fare);
		}
		/*if(discount.equals("Normal")){
			fare = fare;
		}*/
		
		stmt.executeUpdate("INSERT INTO reservation (username, fare, origin, destination, date, discount, trip) VALUES" 
				+"('"+ username + ","
				+ fare + ","
				+ origin + ","
				+ destination+ ","
				+ date + ","
				+ discount+ ","
				+ trip + "')");
	/*
	} catch(){
		
	}*/
		%>
	</body>
</html>