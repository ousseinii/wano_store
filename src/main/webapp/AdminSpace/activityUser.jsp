<%@page import="mugen.web.dao.DaoAdmin"%>
<%@page import="java.sql.ResultSet"%>
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


	<%@include  file="headerAdmin.jsp" %>
	
	<div class="container" style="margin-top: 50px;">
	<center>
	<%
		DaoAdmin dao = new DaoAdmin();
		
	 	ResultSet rs = dao.activityUser();
	%>
	
	<h1>Historique des ventes</h1>
	<hr style="margin-bottom: 30px;">
	
	<table class="table table-striped">
			<thead>
				<tr>
					<th>Nom</th>
					<th>Prenom</th>
					<th>Libelle</th>
					<th><center>Prix</center></th>
					<th>Quantite</th>
					<th>Fournisseu</th>
					<th>Date et Heure</th>
				</tr>
			</thead>
			
			<tbody>
				
				<%
					// TODO : On va recuperer tout les tuples de Users
					
					if(rs != null){
						while(rs.next())
						{
							out.println("<tr>");
								out.println("<td>" + rs.getString("nom") + "</td>");
								out.println("<td>" + rs.getString("prenom") + "</td>");
								out.println("<td>" + rs.getString("libelleProduit") + "</td>");
								out.println("<td>" + rs.getString("prix") + "</td>");
								out.println("<td>" + rs.getString("Quantite") + "</td>");
								out.println("<td>" + rs.getString("fournisseur") + "</td>");
								out.println("<td>" + rs.getString("dateArriver") + "</td>");
							out.println("</tr>");
						}
					}
				
				%>
				
			</tbody>
		</table>
	
	</center>
	</div>

</body>
</html>