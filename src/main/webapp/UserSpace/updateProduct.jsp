<%@page import="mugen.web.dao.DaoUser"%>
<%@page import= "java.sql.ResultSet"%>
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
		// Recuperer l'ID 
		int idProduct = Integer.parseInt(request.getParameter("id"));
		// out.println(idProduct);
		// Recupere les data du tuple via l'id
		DaoUser dao = new DaoUser();
		ResultSet rs = dao.onlyProduct(idProduct);
		if(rs.next()){
	%>>
	
	<%@include  file="headerUser.jsp" %>
	
	<div class="container" style="margin-top: 50px;">
		<center>
			<h1>Formulaire de modification</h1>
			<hr style="margin-bottom: 30px;">
			<form action="${pageContext.request.contextPath}/updateProduct" method="post">
				<label>Identifiant</label> <input type="text" name="idProduit" value="<% out.println( rs.getInt("id")); %>"  readonly > <br>
				<label>Libelle</label><input type="text" name="nomProduit" value="<% out.println(rs.getString("nomProduit")); %>"> <br>
				<label>PrixUnitaire</label><input type="text" name="prixUnitaire" value="<% out.println(rs.getInt("prixUnitaireProduit")); %>"> <br>
				<label>Categorie</label><input type="text" name="categorie" value="<%  out.println(rs.getString("categorieProduit")); %>"> <br>
				<label>Quantite</label> <input type="text" name="quantite" value="<% out.println(rs.getInt("quantiteProduit")); %>"> <br>
				<label>Fournisseur</label><input type="text" name="fournisseur" value="<%  out.println(rs.getString("Fournisseur")); %>"> <br> <br>
				<input type="submit" value="Modifier le produit" class="btn btn-warning btn-lg"> 
			</form>
		</center>
	</div>
	<%} %>
	
</body>
</html>