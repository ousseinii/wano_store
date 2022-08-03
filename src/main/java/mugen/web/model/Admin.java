package mugen.web.model;

public class Admin {

	private String nom , prenom , email , password  = null ;
	private int telephone ;
	
	
	// Constructor
	
	public Admin() {
		super();
	}
	
	public Admin(String nom, String prenom, String email, String password, int telephone) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.password = password;
		this.telephone = telephone;
	}
	
	// Setter / Getter
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getTelephone() {
		return telephone;
	}
	public void setTelephone(int telephone) {
		this.telephone = telephone;
	}
	
	
	
	
}
