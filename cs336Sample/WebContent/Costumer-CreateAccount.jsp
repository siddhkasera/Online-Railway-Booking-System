<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Create a new Costumer account</title>
	</head>
	<body>
		<form action="Costumer-newAccLogin.jsp" method="POST">
		       Enter A Username: <input type="text" placeholder="Enter your username" required maxlength="30" name="Username"/> <br/>
		       Enter A Password: <input type="password" placeholder="Enter your password" required maxlength="30" name="Password"/> <br/>
		       <input type="submit" value="Submit"/>
	     </form>
	</body>
</html>