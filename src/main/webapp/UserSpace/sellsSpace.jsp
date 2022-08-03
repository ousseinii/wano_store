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
	<%@include  file="headerUser.jsp" %>
	<%
			HttpSession s = request.getSession();
			int idUser = (int) s.getAttribute("idUser");
			
			DaoUser dao = new DaoUser();
			ResultSet rs = dao.viewsProducts(idUser);
	%>
	
	<div class="container">
	
	<center>
		<h1 style="margin-top: 50px;">Espace de vente des produits</h1>
		
		<hr style="margin-bottom: 50px;">
		
		<%
			
			if(request.getParameter("error") != null)
			{
				out.println("<div class='alert alert-danger'>");
					out.println("<p>");
						out.println(request.getParameter("error"));
					out.print("</p>");
				out.println("</div>");
			}
		
		
		%>
		<form action="${pageContext.request.contextPath}/sellProduct" method="post">
			<div class="form-group">
				<label for="choixProduit">Choisir le produit</label>
				<select class="form-control "  name="product" id="choixProduit">
					<%
						while(rs.next()){
					%>
				  <option value="<%= rs.getString("id") %>"> <%= rs.getString("nomProduit") %></option>
					 <% } %>
				</select>
			</div>
			 
			
			<!--  <input type="text" name="quantite" placeholder="Quantite"> <br> <br> -->
			<div class="form-group">
				<label for="quantiteProduit">Choisir la quantite</label>
				<input type="text" class="form-control"  placeholder="Quantite"  name="quantite" id="quantiteProduit"> 
			</div>
			
			<input type="submit" value="Vendre ce produit" style="margin-top: 30px;" class="btn btn-primary btn-lg">
			
		</center>
			
		</form>
		
		
		

		
		
		
		
	</div>
		
</body>
</html>