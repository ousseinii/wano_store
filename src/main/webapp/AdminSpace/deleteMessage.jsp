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
		
		if(request.getParameter("id") != null){
			
			int idMessage = Integer.parseInt(request.getParameter("id"));
			
			%>
					<%@include  file="headerAdmin.jsp" %>
	
					<div class="container" style="margin-top: 50px;">
						<center>
							<div class="alert alert-danger">
								<h3>Cette operation est irréversible , la suppression de ce message sera definitif</h3>
								<div style="margin-top: 30px; margin-bottom: 30px;"><a  href="messageUser.jsp" class="alert alert-primary"><= Revenir a la messagerie</a></div>
								
								<form action="${pageContext.request.contextPath}/deleteMessage" method="post">
									<span style="font-weight: bold; margin-right: 20px;">Identifiant du Message :</span> <input type="text" name="id" value="<%=idMessage%>" readonly="readonly"> 
									<input type="submit" class="alert alert-check" value="confirmer la suppression">
								</form>
								
							</div>
						</center>
					</div>
			<% 
		} else {
			response.sendRedirect("messageUser.jsp");
		}
		
	%>
	
	
</body>
</html>