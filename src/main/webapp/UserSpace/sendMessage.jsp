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
	
	<%
		
		String name = "Mugen";
		
		
	%>
	<center>
		<div class="container">
		
			<h1 style="margin-top: 30px;">Envoyer un message au responsable</h1>
			
			<hr style="margin-bottom: 55px;">
			<div  style="border: 2px black double ; padding: 25px; border-radius: 30px;" >
				<form action="${pageContext.request.contextPath}/sendMessage" method="post">
					 <label><b><i>Envoyer par</i></b></label> <input type="text" name='userMail'  value="${emailUser}" readonly="readonly" size="40"> <br> <br>
					<label><b><i>En destionation de</i></b></label><input type="txt" name="adminMail" value="wanostore.stock@gmail.com" readonly="readonly"  size="40"> <br> <br>
					<label><b><i>Objet du message</i></b></label>  <input type="text" name="objetMail"  size="40"> <br> <br>
					<textarea style="display: inline-block;"  rows="4" cols="70" name="messageMail" placeholder="Editer votre message"></textarea> <br> <br>
					<input type="submit" value="Envoyer un message" class="btn btn-primary">
				</form>
			</div>
		</div>
	</center>
	
</body>
</html>