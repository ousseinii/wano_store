<%@page import="mugen.web.dao.DaoAdmin"%>
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
    <link rel="stylesheet" href="../UserSpace/styleUser.css">
</head>
<body>
	
	<%@include  file="headerAdmin.jsp" %>
	<%
			
		if(request.getParameter("id") != null){
			
			int idUser = Integer.parseInt(request.getParameter("id"));
			DaoAdmin dao = new DaoAdmin();
			ResultSet rs = dao.onlyUser(idUser);
			if(rs.next()){
				%>
					<center>
						<div class="container" style="margin-top: 50px; padding: 30px;">	
							
							<h1 >Modifier les information du utilisateur</h1>
							
							<hr style="margin-bottom: 40px;">
							
							<form action="${pageContext.request.contextPath}/updateUser" method="post">
								<label><i><b>Identifiant</b></i></label><input type="text" name="idUser" value="<%=rs.getInt("id")%>"  readonly > <br> <br>
								<label><i><b>Nom</b></i></label>  <input type="text" name="nom" value="<%=rs.getString("nom")%>">	<br> <br>
								<label><i><b>Prenom</b></i></label> <input type="text" name="prenom" value="<%=rs.getString("prenom")%>"> <br> <br>
								 <label><i><b>Telephone</b></i></label> <input type="text" name="telephone" value="<%=rs.getInt("telephone")%>"> <br> <br>
								 <label><i><b>Adresse</b></i></label> <input type="text" name="adresse" value="<%=rs.getString("adresse")%>"> <br> <br>
								 <label><i><b>Email</b></i></label> <input type="text" name="email" value="<%=rs.getString("email")%>"> <br> <br>
								 <label><i><b>Password</b></i></label> <input type="text" name="password" value="<%=rs.getString("password")%>"> <br><br>
								<input type="submit" value="Modifier les informations cette l'utilisateur" class="alert alert-primary btn-lg">
							</form>
						</div>
					</center>
				<% 
			}
			
		} else{
			response.sendRedirect("./viewAllUser.jsp");
		}
	
	%>
</body>
</html>