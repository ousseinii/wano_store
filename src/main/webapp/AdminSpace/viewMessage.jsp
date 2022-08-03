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
</head>
<body>
	<%
		
		if(request.getParameter("id") != null){
			%>
				<%@include  file="headerAdmin.jsp" %>
	
				<div class="container" style="margin-top: 50px;">
					<center><h1>Contenue du Message</h1></center>
					<hr style="margin-bottom: 40px;">
				</div>
				
				<%
					
					int idMessage = Integer.parseInt(request.getParameter("id"));
					DaoAdmin dao = new DaoAdmin();
					ResultSet rs = dao.viewOnlyMessage(idMessage);
					if(rs != null){
						
						%>
						<center>
							<div class="row" style="margin-bottom: 50px;">
								<div class="col-md-4">
									<p style="font-size: 20px; text-decoration: underline;"><span style="font-weight: bold;">Origine :</span> <%= rs.getString("origine") %></p>
								</div>
								<div class="col-md-4">
									<p style="font-size: 20px;text-decoration: underline;"><span style="font-weight: bold;">Objet :</span> <%= rs.getString("objet") %></p>
								</div>
								<div class="col-md-4">
									<p style="font-size: 20px;text-decoration: underline;"><span style="font-weight: bold;">Destinataire :</span> <%= rs.getString("destination") %></p>
								</div>
							</div>
							<div class="row" style="margin-bottom: 50px;">
								<div class="col-md-12">
									<p style="font-size: 20px;"><%= rs.getString("message") %></p>
								</div>
							</div>
							<div class="row" style="margin-bottom: 50px;">
								<div class="col-md-12">
									<p style="font-size: 20px;text-decoration: underline;"><span style="font-weight: bold;">Date et heure :</span> <%= rs.getString("date_heure") %></p>
								</div>
							</div>
							
						</center>	
						<% 
						
					} else{
						response.sendRedirect("messageUser.jsp");
					}
				%>
				
			<%
		} else {
			response.sendRedirect("messageUser.jsp");
		}
	
	%>
	
	
</body>
</html>