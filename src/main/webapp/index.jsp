<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%	
		response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");
		
		if(session.getAttribute("emailAdmin") != null)
		{
			response.sendRedirect("./AdminSpace/index.jsp");
		}
		
		if(session.getAttribute("emailUser") != null){
			
			response.sendRedirect("./UserSpace/index.jsp");
		}
	%>
	<center><h1>Bienvenue chez nous a Wano-Store</h1></center>
	
	<center>
		<a href="loginAdmin.jsp">Admin Space</a>
		<a href="loginUser.jsp">Users Space</a>
		<a href="#">About Wano-Store</a>
	</center>
	
</body>
</html>