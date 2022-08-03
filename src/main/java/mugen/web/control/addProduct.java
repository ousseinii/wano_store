package mugen.web.control;

import java.io.IOException;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import mugen.web.dao.DaoUser;
import mugen.web.model.Product;


public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		DaoUser dao = new DaoUser();
		Product product = new Product();
		
		product.setNomProduit(request.getParameter("nomProduit"));
		product.setPrixUnitaire(Integer.parseInt(request.getParameter("prixUnitaire")));
		product.setCategorieProduit(request.getParameter("categorieProduit"));
		product.setQuantiteProduit(Integer.parseInt(request.getParameter("quantiteProduit")));
		product.setFournisseur(request.getParameter("fournisseur"));
		// Ici l'id du user ; je le recupere via la session
		product.setUser(session.getAttribute("idUser"));
		
		// Check Input Product By User
		Hashtable<String, String> testInput = new Hashtable<>();
		testInput = dao.checkInputProduct(product);
		System.out.println(testInput);
		
		if(testInput.isEmpty()) {
			boolean test = dao.addProduct(product);
			if(test) {
				System.out.println("Insert OK");
				response.sendRedirect("./UserSpace/successAddProduct.jsp");
			} 
		} else {
			System.out.println("Insert KO");
			response.sendRedirect("./UserSpace/failureAddProduct.jsp");
		}
		

		
	}

}
