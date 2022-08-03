package mugen.web.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mugen.web.dao.DaoAdmin;


public class deleteMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Into Delete Message Servlet");
		
		int idMessage = Integer.parseInt(request.getParameter("id"));
		DaoAdmin dao = new DaoAdmin();
		boolean delete = dao.deleteMessage(idMessage);
		if(delete == true) {
			
			response.sendRedirect("./AdminSpace/messageUser.jsp?delete=Message supprimer");
			
		} else {
			System.out.println("Erreur de suppression du message");
		}
		
		
	}

}
