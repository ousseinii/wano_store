package mugen.web.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mugen.web.dao.DaoUser;

public class deleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int idProduct = Integer.parseInt(request.getParameter("idProduct"));
		
		DaoUser dao = new DaoUser();
		System.out.println(idProduct);
		
		Boolean deleteLog = dao.deleteProductFromLog(idProduct);
		System.out.println(deleteLog);
		
		Boolean delete = dao.deleteProductData(idProduct);
		System.out.println(delete);
		
		if(deleteLog && delete) {
			System.out.println("Delete Product Successfull");
			response.sendRedirect("UserSpace/viewsProducts.jsp?delete=Produit supprimer");
		}
		
		
//		
//		if(delete) {
//			System.out.println("Delete Product Successfull");
//			response.sendRedirect("UserSpace/viewsProducts.jsp");
//		}
		
		
	}

}
