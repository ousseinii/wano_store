<%@page import="mugen.web.dao.DaoUser"%>
<%@page import="java.sql.*"%>
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
</head>
<body>

	<%@include  file="headerUser.jsp" %>
	
	<%
		if(request.getParameter("id") != null){
			
			int idProduct = Integer.parseInt(request.getParameter("id"));	
			System.out.println(idProduct);
			
			DaoUser dao = new DaoUser();
			ResultSet rs = dao.onlyProduct(idProduct);
			
			if(rs.next())
			{
				%>
					<div class="container" style="margin-top: 50px; border: 2px black solid; border-radius: 15px; padding: 20px;">
					
						<center>
							<h1>Information Generale sur le produit</h1>
							<hr>
							
							<h3 style="margin-bottom: 15px;">Nom produit : <span style="font-style: italic;"><%= rs.getString("nomProduit") %></span></h3>
							<h3 style="margin-bottom: 15px;">Prix unitaire : <span  style="font-style: italic;"> <%= rs.getInt("prixUnitaireProduit") %></span></h3>
							<h3 style="margin-bottom: 15px;">Telephone : <span  style="font-style: italic;"><%= rs.getString("categorieProduit") %></span></h3>
							<h3 style="margin-bottom: 15px;">categorie : <span  style="font-style: italic;"><%= rs.getInt("quantiteProduit") %></span></h3>
							<h3 style="margin-bottom: 15px;">Date-Heure : <span  style="font-style: italic;"> <%= rs.getString("dateArriver") %></span></h3>
							<h3 style="margin-bottom: 30px;">Fournisseur : <span  style="font-style: italic;"><%= rs.getString("Fournisseur") %></span></h3>
							<a href="./viewsProducts.jsp" class="alert alert-primary btn-block btn-lg"><h3 style="color: darkblue;"> <=Revenir en Arriere</h3></a>
						</center>
						
					</div>
				<%
			}
			
			
		} else{
			response.sendRedirect("./viewsProducts.jsp");
		}
	
		
		
	%>
	
	
	
</body>
</html>