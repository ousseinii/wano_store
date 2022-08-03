<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="mugen.web.model.Admin" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../UserSpace/styleUser.css">
</head>
<body>
	

	

		<%@include  file="headerAdmin.jsp" %>
		
		<div class="container" style="padding: 70px">
		
			<center>
			
			<h1>Information personelle</h1>
			
			<hr style="margin-bottom: 50px;">
			

					
					<div class="col">
						
							<h3><label for="1" ><i><b>Nom</b></i></label> <span>${nomAdmin}</span></h3>
							
							<h3><label for="1" ><i><b>Prenom</b></i></label> <span>${prenomAdmin}</span></h3>
					
							<h3><label for="1" ><i><b>Telephone</b></i></label> <span>${telephoneAdmin}</span></h3>
					
							<h3><label for="1" ><i><b>Email</b></i></label> <span>${emailAdmin}</span></h3>
						
							<h3><label for="1" ><i><b>Password</b></i></label> <span>${passwordAdmin}</span></h3>
					
					
					
					
					
					
				
				
			
				</center>	
			</div>
			
		
		<!-- <a href="./gestionUtilisateur.jsp">Gestion des Utilisateur</a> -->
		
		
		
		
		
		
	
		
</body>
</html>