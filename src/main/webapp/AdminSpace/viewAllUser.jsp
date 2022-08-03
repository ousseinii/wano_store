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
		DaoAdmin dao = new DaoAdmin();
		ResultSet rs = dao.viewAllUser();
	%>
	
	<%@include  file="headerAdmin.jsp" %>
	
	<div class="container" style="margin-top: 50px;">
		<center><h1 style="margin: 30px">Liste des utilisateur <mark>Wano-Store</mark> </h1></center>
		
						<%if(request.getParameter("update") != null){%>
							<center>
								<div class="alert alert-primary">
									<h3><% out.println(request.getParameter("update")); %></h3>
								</div> 
							</center>
							<%}%>
							
						<%if(request.getParameter("delete") != null){%>
							<center>
								<div class="alert alert-danger">
									<h3><% out.println(request.getParameter("delete")); %></h3>
								</div> 
							</center>
							<%}%>	
		<hr>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Nom</th>
					<th>Prenom</th>
					<th>Telephone</th>
					<th>Adresse</th>
					<th><center>Email</center></th>
					<th>Password</th>
					<th>Actions</th>
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
							out.println("<td>" + rs.getString("telephone") + "</td>");
							out.println("<td>" + rs.getString("adresse") + "</td>");
							out.println("<td>" + rs.getString("email") + "</td>");
							out.println("<td>" + rs.getString("password") + "</td>");
							out.println("<td>");
								out.println("<a href='viewUser.jsp?id="+rs.getInt("id")+"' class='btn btn-primary'>view</a>");
								out.println("<a href='updateUser.jsp?id="+rs.getInt("id")+"' class='btn btn-warning'>update</a>");
								out.println("<a href='deleteUser.jsp?id="+rs.getInt("id")+"' class='btn btn-danger'>delete</a>");
							out.println("</td>");
							out.println("</tr>");
						}
					}
				
				%>
				
			</tbody>
		</table>
	</div>
	
</body>
</html>