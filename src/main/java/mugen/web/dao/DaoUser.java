package mugen.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;


import mugen.web.model.Admin;
import mugen.web.model.Product;
import mugen.web.model.Users;

public class DaoUser {
	
	
	private String url = "jdbc:mysql://localhost:3306/wano_store";
	private String user = "root";
	private String password = "";
	
	private Connection conn = null ;
	
	
	public DaoUser() {
		super();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url , user , password);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Users loginAdmin( String email , String password)  {
			
			// TODO : Function for login Admin
			String query = "SELECT * FROM users WHERE email=? AND password=?";
			Users user = new Users();
			
			try {
				PreparedStatement st = conn.prepareStatement(query);
				st.setString(1, email);
				st.setString(2, password);
				ResultSet rs = st.executeQuery();
				if(rs.next()) {
					user.setIdUser(rs.getInt("id"));
					user.setNom(rs.getString("nom"));
					user.setPrenom(rs.getString("prenom"));
					user.setTelephone(rs.getString("telephone"));
					user.setAdresse(rs.getString("adresse"));
					user.setEmail(rs.getString("email"));
					user.setPassword(rs.getString("password"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return user ;	
		}
	
	public Hashtable<String ,String> checkInputProduct(Product product) {
		
		// TODO : Cette fonction va nous permettre de verifier si les input du user sont correcte
		// Si ErrorMessage est vide on retourn true ; sinon on retourne le message d'erreur
		
		Hashtable<String, String> ErrorMessage = new Hashtable<>();
		
		String nom = product.getNomProduit();
		String categorie = product.getCategorieProduit();
		int quantite = product.getQuantiteProduit();
		String fournisseur = product.getFournisseur();
		if(nom == "" && categorie == "" && fournisseur == "") {
			// Cette erreur va etre gerer le required
			ErrorMessage.put("Variable-Error-Empty", "Les champs doivent tous etre renseigner");
		}
		else {
			// Tout les champs ont ete renseigner
			// NomCheck : Verifier si c'est un String ; Caracteres < 25 
						if(nom instanceof String) {
							
						} else {
							ErrorMessage.put("Name-Error-Type", "Le type de votre nom n'est pas correct : String");
						}
						if(nom.length() > 30) {
							ErrorMessage.put("Name-Error-Length", "La taille de vote nom n'est pas correcte : < 30");
						}
						// Categorie
						if(categorie instanceof String) {
							
						} else {
							ErrorMessage.put("Categorie-Error-Type", "Le type de votre categorie n'est pas correcte : String");
						}
						// Quantite 
						// Create objet : 
						Integer objInteger = new Integer(quantite);
						if( objInteger instanceof Integer ) {
							
						} else {
							ErrorMessage.put("Quantite-Error-Type", "Le type de votre quantite n'est pas correcte : Int");
						}
						
						// Fournisseur : 
						if(fournisseur instanceof String) {
							
						} else {
							ErrorMessage.put("Fournisseur-Error-Type", "Le type de fournisseur n'est pas correcte : String");
						}
		}
		
		return ErrorMessage;
		
	}
	
	public boolean addProduct(Product product) {
	
		String query = "INSERT INTO products (nomProduit , prixUnitaireProduit , categorieProduit , quantiteProduit  , Fournisseur , User) VALUES( ? , ?, ? , ? , ? , ?) ";
		try {
			PreparedStatement st = conn.prepareStatement(query);
			
			st.setString(1, product.getNomProduit());
			st.setInt(2, product.getPrixUnitaire());
			st.setString(3 , product.getCategorieProduit());
			st.setInt(4, product.getQuantiteProduit());
			st.setString(5, product.getFournisseur());
			st.setInt(6, product.getUser());
		
			
			int rs = st.executeUpdate();
			if(rs > 0) {
				return true ;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false ;
	}
	
	
	public ResultSet viewsProducts(int idUser) {
		
		try {
			String query =  "SELECT * FROM products WHERE User = ?  ORDER BY id DESC" ;
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, idUser);
			ResultSet rs = pst.executeQuery();
			return rs ;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null ;
	}
	
	public ResultSet onlyProduct(int idProduct) {
		
		
		try {
			String query = "SELECT * FROM products WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, idProduct);
			ResultSet rs = pst.executeQuery();
			return rs ;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}




	public boolean updateProductData(int idProduct , String libelle , int prixUnitaire , String categorie , int quantite , String fournisseur) {
		
		String query = "UPDATE products SET nomProduit = ? , prixUnitaireProduit = ? , categorieProduit = ? , quantiteProduit = ? , Fournisseur = ? WHERE id = ?";
		
		try {
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, libelle);
			pst.setInt(2, prixUnitaire);
			pst.setString(3, categorie);
			pst.setInt(4, quantite);
			pst.setString(5, fournisseur);
			pst.setInt(6, idProduct);
			int update = pst.executeUpdate();
			if(update > 0) {
				return true;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false ;
	}
	
	public boolean deleteProductFromLog(int idProduct) {
		
		try {
			String query = "DELETE FROM saleshistory WHERE idProduct = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, idProduct);
			int deleteLog = pst.executeUpdate();
			
				return true ;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
	}
	
	public boolean deleteProductData(int id) {
		
		try {
				
				String query = "DELETE FROM products WHERE id = ?";
				PreparedStatement pst = conn.prepareStatement(query);
				pst.setInt(1, id);
				int delete = pst.executeUpdate();
				
				if(delete > 0) {
					return true ;
				}	
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false ;
	}
	
	public boolean sendMessage(String origine , String destination , String objet , String message) {
		
		try {
			String query = "INSERT INTO message (origine , destination , objet , message) VALUES(? , ? , ? , ?)";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, origine);
			pst.setString(2, destination);
			pst.setString(3, objet);
			pst.setString(4, message);
			int insert = pst.executeUpdate();
			if(insert > 0) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		return false ;
	}
	
	
	public boolean verifyQuantiteDispo(int idProduct , int quantite) {
		
		// 1 - Verifier si la quantite disponible du produit est positif 
		
		ResultSet rs = onlyProduct(idProduct);
		
			try {
				if(rs.next()) {
					if(rs.getInt("quantiteProduit") >= quantite ) {
						return true;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return false;
	}
	
	public boolean updateQuantiteProduct(int idProduct , int quantite) throws SQLException {
		
		ResultSet rs = onlyProduct(idProduct);
		int lastQuantite = 0 ;
		if(rs.next())
		{
			lastQuantite = rs.getInt("quantiteProduit");
		}
		
		try {
//			// Partie 2 : Update
			String query = "UPDATE products SET quantiteProduit = ? WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, (lastQuantite - quantite) );
			pst.setInt(2, idProduct);
			int update = pst.executeUpdate();
			if(update > 0) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
		
		
	}
	
	
	
	public boolean saleProduct(int idUser , int idProduct , int quantite) {
		
		// 2 - Enregistrer la vente dans la table historique
		
		boolean qtVerify = verifyQuantiteDispo(idProduct, quantite);
		
		if(qtVerify == true) {
			// On peut enregistrer la vente
			try {
				String query = "INSERT INTO saleshistory (idUser , idProduct , Quantite) VALUES(? , ? , ?)";
				PreparedStatement pst = conn.prepareStatement(query);
				pst.setInt(1, idUser);
				pst.setInt(2, idProduct);
				pst.setInt(3, quantite);
				int insert = pst.executeUpdate();
				if(insert > 0) {
					// update la qt de produit ici
					return updateQuantiteProduct(idProduct, quantite);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("La quantite demande n'est pas en stock ");
			
		}
		return false ;
			
	}
	
	// getCountStock()
	public ResultSet getCountStock(int idUser) {
		
		// int result = 0 ;
		
		try {
			String query = "SELECT Count(*) as count  FROM products WHERE User = ?" ;
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, idUser);
			ResultSet rs = pst.executeQuery();
	
			if(rs.next()) {
				// result = rs.getInt("count");
				return rs;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	public ResultSet getCountSoldProduct(int idUser) {
		
		try {
			String query = "SELECT Count(*) as count  FROM saleshistory WHERE idUser = ?" ;
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, idUser);
			ResultSet rs = pst.executeQuery();
	
			if(rs.next()) {
				// result = rs.getInt("count");
				return rs;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null ;
	}
	
	
public ResultSet getCountSendMessage(String emailUser) {
		
		try {
			String query = "SELECT Count(*) as count  FROM message WHERE origine = ?" ;
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, emailUser);
			ResultSet rs = pst.executeQuery();
	
			if(rs.next()) {
				// result = rs.getInt("count");
				return rs;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null ;
	}
	


	
	


	
	
	
	
	
	
}


