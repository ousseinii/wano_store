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
    <link rel="stylesheet" href="styleUser.css">
</head>
<body>
	
		<%
			int idProduct = Integer.parseInt(request.getParameter("id"));		
		%>
		
		<%@include  file="headerUser.jsp" %>
		
		<div class="container" style="margin-top: 50px;">
			<center>
				<div class="alert alert-danger">
					<h2>Supprimer le produit de votre stock</h2>
					<hr style="margin-bottom: 30px;">
					<p>Cette operation est irreversible , alors faite le bon choix [suppression du produit ainsi que les logs]</p> 
					<a href="./viewsProducts.jsp"> <= Revenir sur la liste des produits</a> <br> <br>
					
				</div>
					<form action="${pageContext.request.contextPath}/deleteProduct" method="post">
						Identifiant du produit : <input type="text" name="idProduct" value="<%= idProduct %>" readonly> <br> <br>
						<input type="submit" value="Supprimer le produit">
					</form>
			</center>
		</div>
		
	
	
</body>
</html>