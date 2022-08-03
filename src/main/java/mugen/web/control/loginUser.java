package mugen.web.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mugen.web.dao.DaoUser;
import mugen.web.model.Users;


public class loginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Users user = new Users();
		DaoUser dao = new DaoUser();
		user = dao.loginAdmin(email, password);
		
		if(user.getEmail() != null) {
			HttpSession session = request.getSession();
			session.setAttribute("idUser", user.getIdUser() );
			session.setAttribute("nomUser", user.getNom());
			session.setAttribute("prenomUser", user.getPrenom());
			session.setAttribute("telephoneUser", user.getTelephone());
			session.setAttribute("adresseUser", user.getAdresse());
			session.setAttribute("emailUser", user.getEmail());
			session.setAttribute("passwordUser", user.getPassword());
			response.sendRedirect("./UserSpace/index.jsp");
		}else {
			response.sendRedirect("./loginUser.jsp");
		}
		
	}

}
