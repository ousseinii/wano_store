<%@page import="mugen.web.dao.DaoUser"%>
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
    <link rel="stylesheet" href="styleUser.css">
</head>
<body>

	<%@include  file="headerUser.jsp" %>

	<div class="container" style="margin-top: 55px;">
	
	<center>
				<h3>Bienvenue <b><i>${nomUser} ${prenomUser}</i></b> dans votre plateforme de gestion et vente de produit</h3>
				
				<hr style="margin-bottom: 50px;">
				
				<h3 style="text-decoration: underline; margin-bottom: 30px;">Information personnelle</h3>
				
				<div class="row">
					<div class="col-md-4">
						<p>Nom : ${nomUser}</p>
					</div>
					<div class="col-md-4">
						<p>Prenom : ${prenomUser}</p>
					</div>
					<div class="col-md-4">
						<p>Adresse : ${adresseUser}</p>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<p>Telephone : ${telephoneUser}</p>
					</div>
					<div class="col-md-4">
						<p>Email : ${emailUser}</p>
					</div>
					<div class="col-md-4">
						<p>Password : ${passwordUser}</p>
					</div>
				</div>	
				
				<h3 style="text-decoration: underline; margin-bottom: 60px; margin-top: 30px;">Vos statistiques generales</h3>
				
				<%
				
					// TODO : Debug this part 
					
					DaoUser daoUser = new DaoUser();
				
					HttpSession s1 = request.getSession();
				
					int idUser = (int) s1.getAttribute("idUser");
					
					System.out.println("idUser : " + idUser);
					
					// getCountStock
					
					ResultSet stock = daoUser.getCountStock(idUser);
					// Result 1
					int countStock = stock.getInt("count");
					
					System.out.println("Nombre de produit en stock : " + countStock);
					
					// getCountSoldProduct
					
					ResultSet soldProduct = daoUser.getCountSoldProduct(idUser);
					// Result 2
					int countSoldProduct = soldProduct.getInt("count");
					
					System.out.println("Nombre de produit vendu : " + countSoldProduct);
					
					// getCountSendMessage()
					
					ResultSet messageToAdmin = daoUser.getCountSendMessage(s1.getAttribute("emailUser").toString());
					// Result 3
					int countSendMessage = messageToAdmin.getInt("count");
					
					System.out.println("Nombre de message envoyer a l'admin " + countSendMessage);
					
					
				%>
						
					<marquee><h4>=> <b><i>Nombre de produit en stock :</i></b> <%= countStock %></h4> </marquee>
					<marquee><h4>=> <b><i>Nombre de vente effectuer : </i></b> <%= countSoldProduct %></h4> </marquee>
					<marquee><h4>=> <b><i>Nombre de message envoyer a l'admin :</i></b> <%= countSendMessage %></h4></marquee>
				
			
		</center>		
	</div>

	

	
</body>
</html>