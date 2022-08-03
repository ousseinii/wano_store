<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
</head>
<body>
		
		
		<%
			if(request.getParameter("id") != null){
		%>
			<%@include  file="headerAdmin.jsp" %>
		<%		
				int idUser = Integer.parseInt(request.getParameter("id"));
				
		%>
			<div class="container" style="margin-top: 50px; border: 3px black ; border-radius: 30px;" >
				<center>
					<div class="alert alert-primary">
						<p style="font-size: 20px; font-style: italic;">Cette operation est irréversible : l'utilisateur ainsi que tout ces produits seront supprimer </p>
						<form action="${pageContext.request.contextPath}/deleteUser" method="post">
							Identifiant de l'utilisateur : <input type="text" name="idUser" readonly value="<%= idUser %>" >
							<a href="viewAllUser.jsp" class="alert alert-primary" style="margin-right: 20px; margin-left: 20px;"><- Revenir en arriere </a>
							<input type="submit" class="alert alert-danger" value="confirmer la suppression">
						</form>
					</div>
				</center>
			</div>			 
		<%
				
			} else{
				response.sendRedirect("./viewAllUser.jsp");
			}
		%>
</body>
</html>