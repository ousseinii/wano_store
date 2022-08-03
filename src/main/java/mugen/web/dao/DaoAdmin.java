package mugen.web.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



import mugen.web.model.Admin;
import mugen.web.model.Users;

public class DaoAdmin {
	
	private String url = "jdbc:mysql://localhost:3306/wano_store";
	private String user = "root";
	private String password = "";
	
	private Connection conn = null ;
	
	
	public DaoAdmin() {
		super();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url , user , password);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Admin loginAdmin( String email , String password)  {
		
		// TODO : Function for login Admin
		String query = "SELECT * FROM admin WHERE email=? AND password=?";
		Admin admin = new Admin();
		
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, email);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				admin.setNom(rs.getString("nom"));
				admin.setPrenom(rs.getString("prenom"));
				admin.setTelephone(Integer.parseInt(rs.getString("telephone")));
				admin.setEmail(rs.getString("email"));
				admin.setPassword(rs.getString("password"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return admin ;
		
	}
	
	public boolean addUser(Users user) {
		
		String query = "INSERT INTO users (nom , prenom , telephone , adresse , email , password) VALUES(? , ? , ? , ? , ? , ?)";
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, user.getNom());
			st.setString(2, user.getPrenom());
			st.setString(3, user.getTelephone());
			st.setString(4, user.getAdresse());
			st.setString(5, user.getEmail());
			st.setString(6, user.getPassword());
			int rs = st.executeUpdate(); 
			if(rs  > 0) {
				return true ;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public ResultSet viewAllUser() {
		
		// TODO : Lister tout les users present dans wano_store
		String query = "SELECT * FROM users";
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			return rs ;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null ;
		
	}
	
	public ResultSet onlyUser(int idUser) {
		
		String query = "SELECT * FROM users WHERE id = ?";
		try {
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, idUser);
			ResultSet rs = pst.executeQuery();
			return rs ;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean compareUser(Users user1 , Users user2) {
		
		if(user1.getNom().equals(user2.getNom()) && user1.getPrenom().equals(user2.getPrenom()) && user1.getAdresse().equals(user2.getAdresse()) && user1.getTelephone().equals(user2.getTelephone()) && user1.getEmail().equals(user2.getEmail()) && user1.getPassword().equals(user2.getPassword())) {
			return true;
		} 
		
		return false ;
		
	}
	
	public boolean updateUser(Users user) {
		
		try {
			
			String query = "UPDATE users SET nom = ?  , prenom = ? , adresse = ? , telephone = ? , email = ? , password = ? WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, user.getNom());
			pst.setString(2, user.getPrenom());
			pst.setString(3, user.getAdresse());
			pst.setString(4, user.getTelephone());
			pst.setString(5, user.getEmail());
			pst.setString(6, user.getPassword());
			pst.setInt(7, user.getIdUser());
			int update = pst.executeUpdate();
			if(update > 0) {
				return true;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return false ;
	}
	
	public boolean deleteProductUser(int idUser) {
		
		try {
			String query = "DELETE FROM products WHERE User = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, idUser);
			int delete = pst.executeUpdate();
			// La personne peut ne pas mettre de produit
			return true ;
		}catch(Exception e) {
			e.printStackTrace();
		}	
		
		return false ;
	}
	
	public boolean deleteHistoryUser(int idUser) {
		
			try {
				String query = "DELETE FROM saleshistory WHERE idUser = ?";
				PreparedStatement pst = conn.prepareStatement(query);
				pst.setInt(1, idUser);
				int delete = pst.executeUpdate();
				// La personne peut ne pas vendre de produit
				return true ;
			}catch(Exception e) {
				e.printStackTrace();
			}

			return false ;
	}
	
	public boolean deleteUser(int idUser) {
		
		try {
				/*
				 * 1. Supprimer les produits de l'utilisateur
				 * 2. Supprimer l'historique de l'utilisateur
				 * 3. Supprimer l'historique de l'utilisateur
				 * */
			
				boolean deleteProduct = deleteProductUser(idUser);
				if(deleteProduct) {
					boolean deleteHistory = deleteHistoryUser(idUser);
					if(deleteHistory) {
						
						String query = "DELETE FROM users WHERE id = ? ";
						PreparedStatement pst = conn.prepareStatement(query);
						pst.setInt(1, idUser);
						int destroyUser = pst.executeUpdate(); 
						if(destroyUser > 0) {
							return true ;
						}
						}
					}
					
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false ;
	}
	
	
	public ResultSet viewALLMessage() {
		
		try {
			String query = "SELECT * FROM `message` ORDER BY id DESC";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			return rs;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return null ;
	}
	
	
	public ResultSet viewOnlyMessage(int idMessage) {
		
		try {
			String query = "SELECT * FROM message WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, idMessage);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				return rs;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return null ;
	}
	
	public boolean deleteMessage(int idMessage) {
		
		try {
			
			String query = "DELETE FROM message WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, idMessage);
			int deleteLine = pst.executeUpdate();
			if(deleteLine > 0) {
				return true ;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return false ;
	}
	
	public ResultSet activityUser() {
		
		try {
			
			String query = "SELECT \r\n"
					+ "users.nom  as nom  , users.prenom as prenom, products.nomProduit as libelleProduit , products.prixUnitaireProduit as prix , Quantite , products.Fournisseur as fournisseur, dateArriver  \r\n"
					+ "FROM saleshistory\r\n"
					+ "INNER JOIN products ON saleshistory.idProduct = products.id \r\n"
					+ "INNER JOIN users ON saleshistory.idUser = users.id  \r\n"
					+ "";
			
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery(query);
			
			return rs ;
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		
		return null ;
	}

}




