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
	
		<h1>Connexion Espace Admin</h1>
		<form action="loginAdmin" method="post">
			Email    : <input type="text" name="email"> <br>
			Password : <input type="password" name="password"> <br>
			<input type="submit">
		</form>
	
</body>
</html>