package mugen.web.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mugen.web.dao.DaoUser;


public class sendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String objet = request.getParameter("objetMail");
		String message = request.getParameter("messageMail");
		String origine = request.getParameter("userMail");
		String destination = request.getParameter("adminMail");
		
		DaoUser dao = new DaoUser();
		boolean insert = dao.sendMessage(origine, destination, objet, message);
		if(insert == true) {
			response.sendRedirect("./UserSpace/sendMessage.jsp");
		}
		
	}

}
