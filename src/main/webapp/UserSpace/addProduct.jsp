import jakarta.servlet.*;
import jakarta.servlet.http.*;


<%@page import="java.io.InputStream"%>
<%@page import="javax.swing.filechooser.FileNameExtensionFilter"%>


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
	
	<% response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate"); %>
	
	<%@include  file="headerUser.jsp" %>
	
	<div class="container" style="padding: 20px;">
	 
		<center><h1 style="margin-top: 50px;">Ajout d'un produit dans le stock</h1>
		
		<hr style="margin-bottom: 50px;">
		
		<form action="${pageContext.request.contextPath}/addProduct" method="post" style="padding:20px;">
			
			
			<label class="label"><b><i>Nom du produit</i></b></label><input type="text" name="nomProduit" required=" placeholder="NomProdutit" >  <br>
				
			<label class="label"><b><i>Prix unitaire</i></b></label> <input type="number" name="prixUnitaire" required="" >   <br>
			
			<label class="label"><b><i>Categorie du produit</i></b></label><input type="text" name="categorieProduit" required="" >   <br>
			
			<label class="label"l><b><i>Quantite</i></b></label><input type="number" name="quantiteProduit" required="" >   <br>
			
			<label class="label"><b><i>Fournisseur</i></b></label><input type="text" name="fournisseur" required="" >   <br> <br>
			 
			<input type="submit" value="Ajouter un produit" class="btn btn-primary  rounded-0">
			 
		</form>
		</center>
	</div>
</body>
</html>

