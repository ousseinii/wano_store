<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="mugen.web.dao.DaoAdmin"%>
<%@page import="java.sql.*"%>

   
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
			<h1>Boite de Messagerie</h1>
			<hr>
				
						<%if(request.getParameter("delete") != null){%>
							<center>
								<div class="alert alert-danger">
									<h3><% out.println(request.getParameter("delete")); %></h3>
								</div> 
							</center>
							<%}%>	
			<%
				
				DaoAdmin dao = new DaoAdmin();
				ResultSet rs = dao.viewALLMessage();
			
			%>
			<table class="table table-striped">
			<thead>
				<tr>
					<th>Origine</th>
					<th>Destinataire</th>
					<th>Objet du message</th>
					<th>Date d'envoi</th>
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
							out.println("<td>" + rs.getString("origine") + "</td>");
							out.println("<td>" + rs.getString("destination") + "</td>");
							out.println("<td>" + rs.getString("objet") + "</td>");
							out.println("<td>" + rs.getString("date_heure") + "</td>");
							out.println("<td>");
								out.println("<a href='viewMessage.jsp?id="+rs.getInt("id")+"' class='btn btn-primary'>view message</a>");
								out.println("<a href='deleteMessage.jsp?id="+rs.getInt("id")+"' class='btn btn-danger'>delete message</a>");
							out.println("</td>");
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