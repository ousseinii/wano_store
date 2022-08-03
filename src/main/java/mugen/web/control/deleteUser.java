package mugen.web.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mugen.web.dao.DaoAdmin;

public class deleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int idUser = Integer.parseInt(request.getParameter("idUser"));
		
		DaoAdmin dao = new DaoAdmin();
		boolean deleteUser = dao.deleteUser(idUser);
		
		System.out.println(deleteUser);
		
//		System.out.println(dao.deleteHistoryUser(idUser));
//		System.out.println(dao.deleteProductUser(idUser));
		
		
		if(deleteUser == true) {
			System.out.println("Utilisateur Supprimer");
			response.sendRedirect("./AdminSpace/viewAllUser.jsp?delete=Utilisateur Supprimer");
		} else {
			System.out.println("Erreur de Suppression de l'utilisateur ");
		}
		
	}

}
