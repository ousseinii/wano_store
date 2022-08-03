package mugen.web.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mugen.web.dao.DaoAdmin;
import mugen.web.model.Users;


public class addUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String telephone = request.getParameter("telephone");
		String adresse = request.getParameter("adresse");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println("In addUser Servlet");
		
		if(nom != "" && prenom != "" && telephone != "" && adresse != "" && email != "" && password != "") {
			
			Users user = new Users();
			user.setNom(nom); user.setPrenom(prenom); user.setTelephone(telephone);
			user.setAdresse(adresse); user.setEmail(email); user.setPassword(password);
			
			DaoAdmin dao = new DaoAdmin();
			
			
			
			if(dao.addUser(user)) {
				System.out.println("Utilisateur ajouter");
				response.sendRedirect("AdminSpace/index.jsp");
			} else {
				System.out.println("Utilisateur non ajouter");
			}
			
			
		} else {
			response.sendRedirect("AdminSpace/gestionUtilisateur.jsp");
		}
		
	}


}
