	<%
		response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");
	
		if(session.getAttribute("emailAdmin") == null){
			// L'admin n'est pas connecter
			response.sendRedirect("../loginAdmin.jsp");
		}
	%>
    
    <nav class="navbar navbar-expand-md navbar-dark bg-dark text-center" style="padding: 30px">
      <a class="navbar-brand" href="index.php"><i><img src="../images/logo1.png" style="width: 200px;margin-right: 18px;"></i></a>

      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">

          <li class="nav-item active">
            <a class="nav-link" href=index.jsp>Mon Profil <span class="sr-only">(current)</span></a>
          </li>
    
          <li class="nav-item">
            <a href="addUser.jsp" class="nav-link">Ajouter un utilisateur</a>
          </li> 
          <li class="nav-item">
            <a class="nav-link" href="viewAllUser.jsp">Voir tout les utilisateur</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="messageUser.jsp">Messagerie</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="activityUser.jsp">Suivie des ventes</a>
          </li>
          <li class="nav-item active" style="margin-left: 50px; margin-top: 10px;">
            <form action="../logoutAdmin" method="post">
				<input type="submit" value="Deconnexion">
			</form>
          </li>
       
        </ul>
       
      </div>
    </nav>