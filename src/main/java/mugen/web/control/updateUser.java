package mugen.web.control;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mugen.web.dao.DaoAdmin;
import mugen.web.model.Users;


public class updateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idUser = Integer.parseInt(request.getParameter("idUser"));
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String telephone = request.getParameter("telephone");
		String adresse = request.getParameter("adresse");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Users userUpdate = new Users( idUser, nom, prenom,telephone, adresse, email, password);
		
		
		DaoAdmin dao = new DaoAdmin();
		ResultSet rs = dao.onlyUser(idUser);
		
		try {
			if(rs.next()) {
				Users userDB = new Users();
				userDB.setIdUser(rs.getInt("id"));
				userDB.setNom(rs.getString("nom"));
				userDB.setPrenom(rs.getString("prenom"));
				userDB.setTelephone(rs.getString("telephone"));
				userDB.setAdresse(rs.getString("adresse"));
				userDB.setEmail(rs.getString("email"));
				userDB.setPassword(rs.getString("password"));

				boolean same = dao.compareUser(userUpdate, userDB);
				
				if(same == true) {
					response.sendRedirect("./AdminSpace/viewAllUser.jsp");
				} else {
					
					boolean update = dao.updateUser(userUpdate);
					if(update == true) {
						response.sendRedirect("./AdminSpace/viewAllUser.jsp?update=Mise a jour effectuer");
						System.out.println("Mise a jour effectuer OK");
					} else {
						System.out.println("Erreur de la mise a jour");
					}
					
				}
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
