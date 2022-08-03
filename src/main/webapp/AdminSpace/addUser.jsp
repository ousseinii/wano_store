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
    <link rel="stylesheet" href="../UserSpace/styleUser.css">
</head>
<body>
	
	<%@include  file="headerAdmin.jsp" %>
	
	 <div class="container" style="margin-top: 20px; padding: 50px">
	 	<center>
	 	
	 	<h1>Ajouter un nouvelle utilisateur</h1>
	 	
	 	<hr style="margin-bottom: 40px;">
	 	
	 	<form action="${pageContext.request.contextPath}/addUserByAdmin" method="post" class="form">
	 	
	 		
	 			<label for="1" ><i><b>Nom</b></i></label> <input type="text" name="nom"  id="1"> <br> <br>
	 		
	 		
	 			<label for="2"><i><b>Prenom</b></i></label> <input type="text" name="prenom"  id="2"> <br> <br>
	 		
	 		
	 			<label for="3"><i><b>Telephone</b></i></label> <input type="text" name="telephone"  id="3"> <br> <br>
	 		
	 		
	 			<label for="4"><b><i>Adresse</i></b></label> <input type="text" name="adresse"  id="4">	<br>	<br>
	 		
	 		
	 			<label for="5"><b><i>Email</i></b></label> <input type="email" name="email"  id="5"> <br>	<br>
	 		
	 		
	 			<label for="6"><i><b>Password</b></i></label> <input type="password" name="password"  id="6"> <br> <br> <br>
	 		
	 		<input type="submit" class="btn btn-primary btn-lg" value="Ajouter un utilisateur">
	 	</form>
	 </center>
	 </div>

	
</body>
</html>