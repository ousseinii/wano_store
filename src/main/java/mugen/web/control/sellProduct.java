package mugen.web.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mugen.web.dao.DaoUser;


public class sellProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		int idUser = (int) session.getAttribute("idUser");
		int idProduct = Integer.parseInt(request.getParameter("product"));
		int quantite = Integer.parseInt(request.getParameter("quantite"));
		
		DaoUser dao = new DaoUser();
		
		boolean saleProduct = dao.saleProduct(idUser, idProduct, quantite);
		
		if(saleProduct == true) {
			System.out.println("Produit vendu");
			response.sendRedirect("./UserSpace/viewsProducts.jsp");
		} else {
			System.out.println("Probleme de stock");
			response.sendRedirect("./UserSpace/sellsSpace.jsp?error='Probleme de stock : vous n'avez pas cette quantite dans votre stock'");
		}
		
	}

}
