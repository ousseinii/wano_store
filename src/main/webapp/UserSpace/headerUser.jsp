	<%
		response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");
	
		if(session.getAttribute("emailUser") == null){
			// Le user ne s'est pas connecter
			response.sendRedirect("../loginUser.jsp");
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
            <a class="nav-link" href="index.jsp">Profil Utilisateur <span class="sr-only">(current)</span></a>
          </li>
    
          <li class="nav-item">
            <a href="addProduct.jsp" class="nav-link">Ajouter un un produit</a>
          </li> 
          <li class="nav-item">
            <a class="nav-link" href="viewsProducts.jsp">Gerer le stock de produit</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="sendMessage.jsp">Messagerie</a>
          </li>
          
           <li class="nav-item">
            <a class="nav-link " href="sellsSpace.jsp">Espace de vente</a>
          </li>
          
          <li class="nav-item" style="margin-left: 50px; margin-top: 8px;">
	            <form action="${pageContext.request.contextPath}/logoutUser" method="post">
					<input type="submit" value="Deconnexion">
				</form>
          </li>
       
        </ul>
       
      </div>
    </nav>