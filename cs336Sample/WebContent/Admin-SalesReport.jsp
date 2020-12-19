<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Sales Report</title>
		<style>
			table, td, th {
	  			border: 1px solid black;
			}
			table {
				border-collapse: collapse;
				width: 70%;
			}
			h3, h1 {
				text-align: center;
			}
		</style>
	</head>
	<body>
		<a href = "Admin-Success.jsp"><button> Home </button></a>
		<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement(); 
		%>
		<center><h4>View Sales Report</h4>
		
		<p> Choose one at a time: </p></center>
		<div class="selection">
			<center>
			<form action="Admin-SalesReport.jsp">
				<select name="month">
				  <option value = ""> Choose Month </option> 
				  <option value = "Jan">Jan</option>
				  <option value = "Feb">Feb</option>
				  <option value = "Mar">Mar</option>
				  <option value = "Apr">Apr</option>
				  <option value = "May">May</option>
				  <option value = "Jun">Jun</option>
				  <option value = "Jul">Jul</option>
				  <option value = "Aug">Aug</option>
				  <option value = "Sep">Sep</option>
				  <option value = "Oct">Oct</option>
				  <option value = "Nov">Nov</option>
				  <option value = "Dec">Dec</option>
				</select>
				<button>Submit</button>
			</form>
		
		
			<form action="Admin-SalesReport.jsp">
				<select name="category">
				  <option value = ""> Choose sales category </option>
				  <option value = "transitLine">By Transit Line</option>
				  <option value = "customer">By Customer</option>
				  <option value = "desCity">By Destination City</option>
				  <option value = "bestLine">Best Line </option>
				  <option value = "bestCustomer">Best Customer</option>
				</select>
				<button>Submit</button>
			</form>
			</center>
		</div>
		<table>
			<%
			//if month is chosen
			if (request.getParameter("month") != null && !request.getParameter("month").isEmpty()){
				String month = request.getParameter("month");
				out.println("<h3>" +"month: " + request.getParameter("month"));
				
				ResultSet rs = stmt.executeQuery("SELECT sum(totalFare) FROM reservation WHERE DATE_FORMAT(date, '%b') = '" + month + "'");
				if(rs.next()){
					if(rs.getString(1) != null){
						//  print the total month's revenue
						out.println("<h3>" + " Total Revenue: $"+rs.getString(1) +"</h3>");
						out.print("<tr><th>Customer</th> <th>Reservation No.</th> <th>Date</th> <th>Total Fare</th> <th>Discount group</th>");
					}
					else{
						out.print("<br> </h3> No reservations for this month </h3>");
					}
				}
				// print table with all reservations
				rs = stmt.executeQuery("SELECT * FROM reservation WHERE DATE_FORMAT(date, '%b') = '" + month + "'ORDER BY totalFare DESC");
				while(rs.next()){
					out.println("<tr><td>"+rs.getString("customeruser")+
							"</td><td>"+rs.getString("reservation no.")+
							"</td><td>" +rs.getString("date")+
							"</td><td>"+rs.getString("totalFare")+
							"</td><td>"+rs.getString("discount_group") +"</td><td>");
			    		//out.println(rows);
				}
				
			}
			%>
		</table>
		<table>
	    	<%
	    	
	    	if(request.getParameter("category") != null && !request.getParameter("category").isEmpty()) {
	    		String category = request.getParameter("category");
	    		// each of these categories are per month
	    		if(category.equals("transitLine")){
	    			out.print("<tr><th>Transit Line</th><th>Total Sales</th></tr>");
	    			
	    			/// ADD HEREEEEEEEEEE
	    		}
	    		if(category.equals("bestLine")){
					out.print("<tr><th>Transit Line</th><th>Total Sales</th></tr>");
					
					/// ADD HEREEEEEEEEEE - top transit line with the most sales
	    		}
				if(category.equals("customer")){
					out.print("<tr><th>Customer</th><th>Total Sales</th></tr>");
					ResultSet rs = stmt.executeQuery("SELECT customeruser, sum(totalfare) as totalSales FROM reservation GROUP BY customeruser ORDER BY sum(totalfare) DESC");
					while (rs.next()){
						out.println("<tr><td>"+rs.getString("customeruser")+"</td><td>"+rs.getString("totalSales")+"</td></tr>");
			    	}
	    		}
				if(category.equals("bestCustomer")){  // highest ticket sales fare
					out.print("<tr><th>Customer</th><th>Total Sales</th></tr>");
					ResultSet rs = stmt.executeQuery("SELECT customeruser, sum(totalfare) as totalSales FROM reservation GROUP BY customeruser ORDER BY sum(totalfare) DESC LIMIT 1");
					while (rs.next()){
						out.println("<tr><td>"+rs.getString("customeruser")+"</td><td>"+rs.getString("totalSales")+"</td></tr>");
			    	}
				}
				if(category.equals("desCity")){
					out.print("<tr><th>Destination City</th><th>Total Sales</th></tr>");
					
					/// ADD HEREEEEEEEEEE - top destination city with the most sales
					
				}
				
	    	}
	    	
	    	%>
	    </table>
	</body>
</html>