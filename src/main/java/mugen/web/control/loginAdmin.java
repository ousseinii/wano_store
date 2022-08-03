package mugen.web.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mugen.web.dao.DaoAdmin;
import mugen.web.model.Admin;



public class loginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Admin admin = new Admin();
		DaoAdmin dao = new DaoAdmin();
		admin = (Admin) dao.loginAdmin(email, password);
		
		if(admin.getNom() != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("nomAdmin", admin.getNom());
			session.setAttribute("prenomAdmin", admin.getPrenom());
			session.setAttribute("telephoneAdmin", admin.getTelephone());
			session.setAttribute("emailAdmin", admin.getEmail());
			session.setAttribute("passwordAdmin", admin.getPassword());
			response.sendRedirect("./AdminSpace/index.jsp");
		} else {
			response.sendRedirect("loginAdmin.jsp");
		}
		
		
		
		
	}

}
