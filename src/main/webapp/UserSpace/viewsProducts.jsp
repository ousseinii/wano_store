<%@page import="java.net.http.HttpRequest"%>
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
</head>
<body>
	<%
		HttpSession s = request.getSession();
		DaoUser dao = new DaoUser();
		int idUser = (int) s.getAttribute("idUser");
		ResultSet rs = dao.viewsProducts(idUser);
		
		System.out.println(s.getAttribute("idUser").getClass().getName());
		
	%>
	<%@include  file="headerUser.jsp" %>
	
	<div class="container">
		<center><h1 style="margin: 30px">Liste des produits <mark>ajouter</mark> </h1></center>
		
		<%
			
			if(request.getParameter("delete") != null){
				%>
					<center>
						<h3 class="alert alert-danger">
							<%= request.getParameter("delete") %>
						</h3>
					</center>
				<% 
			}
		
		if(request.getParameter("update") != null){
			%>
				<center>
					<h3 class="alert alert-warning">
						<%= request.getParameter("update") %>
					</h3>
				</center>
			<% 
		}
			
		%>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Libelle</th>
					<th>PrixUnitaire</th>
					<th>Categorie</th>
					<th>Quantite</th>
					<th>Heure/Dates</th>
					<th>Fournisseur</th>
					<th><center>Actions</center></th>
				</tr>
			</thead>
			<tbody>
				
				<%
					// TODO : On va recuperer tout les tuples de Users
				
					if(rs != null){
						while(rs.next())
						{
							out.println("<tr>");
							out.println("<td>" + rs.getString("nomProduit") + "</td>");
							out.println("<td>" + rs.getString("prixUnitaireProduit") + "</td>");
							out.println("<td>" + rs.getString("categorieProduit") + "</td>");
							out.println("<td>" + rs.getString("quantiteProduit") + "</td>");
							out.println("<td>" + rs.getString("dateArriver") + "</td>");
							out.println("<td>" + rs.getString("Fournisseur") + "</td>");
							out.println("<td>");
								out.println("<a href='viewOnlyProduct.jsp?id="+rs.getInt("id")+"' class='btn btn-primary'>view</a>");
								out.println("<a href='updateProduct.jsp?id="+rs.getInt("id")+"' class='btn btn-warning'>update</a>");
								out.println("<a href='deleteProduct.jsp?id="+rs.getInt("id")+"' class='btn btn-danger'>delete</a>");
							out.println("</td>");
							out.println("</tr>");
						}
					}
				
				
				%>
				
			</tbody>
		</table>
	</div>
</body>
</html>