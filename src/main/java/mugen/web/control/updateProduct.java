package mugen.web.control;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mugen.web.dao.DaoUser;


public class updateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/**
		 * Update les data des products 
		 * 1. On verifie si tout les champs sont saisie
		 * 2. On recupere les data de la bdd 
		 * 3. On recupere les data saisie 
		 * 4. On compare : if(equal) : redirige vers la page viewProduct & else(new data) : update
		 */
		
		int idProduct = Integer.parseInt(request.getParameter("idProduit"));
		String libelle = request.getParameter("nomProduit");
		int prixUnitaire = Integer.parseInt(request.getParameter("prixUnitaire"));
		String categorie = request.getParameter("categorie");
		int quantite = Integer.parseInt(request.getParameter("quantite"));
		String fournisseur = request.getParameter("fournisseur");
		
		
		
		try {
			DaoUser dao = new DaoUser();
			ResultSet rs = dao.onlyProduct(idProduct);
			if(rs.next()) {
				String dbLibelle =  rs.getString("nomProduit");
				int dbPrixUnitaire = rs.getInt("prixUnitaireProduit");
				String dbCategorie = rs.getString("categorieProduit");
				int dbQuantite = rs.getInt("quantiteProduit");
				String dbFournisseur = rs.getString("Fournisseur");
				
				System.out.println("Database value : ");
				System.out.println(dbLibelle + " " + dbPrixUnitaire  + " " + dbCategorie  + " " + dbQuantite  + " " + dbFournisseur);
				
				// On compare les deux valeurs 
				Boolean equal = false ;
				
				if(libelle.equals(dbLibelle) && prixUnitaire == dbPrixUnitaire && categorie.equals(dbCategorie) && quantite == dbQuantite && fournisseur.equals(dbFournisseur)) {
					equal = true ;
				}
				
				if(equal == true) {
					response.sendRedirect("UserSpace/viewsProducts.jsp");
				} else {
					boolean update = dao.updateProductData(idProduct, libelle, prixUnitaire, categorie, quantite, fournisseur);
					response.sendRedirect("UserSpace/viewsProducts.jsp?update=Produit modifier");
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("Form field Value : ");
		System.out.println(libelle + " " + prixUnitaire  + " " + categorie  + " " + quantite  + " " + fournisseur);
		
		

		

		
		
		
		
	}

}
