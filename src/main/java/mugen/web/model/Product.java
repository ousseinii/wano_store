package mugen.web.model;

public class Product {

	private String nomProduit , categorieProduit , dateArriver , Fournisseur = null ;
	int quantiteProduit , User  , prixUnitaire;
	
	public Product(String nomProduit , int prixUnitaire, String categorieProduit, String fournisseur,
			int quantiteProduit, int user) {
		super();
		this.nomProduit = nomProduit;
		this.prixUnitaire = prixUnitaire ;
		this.categorieProduit = categorieProduit;
		Fournisseur = fournisseur;
		this.quantiteProduit = quantiteProduit;
		User = user;
	}

	public Product() {
		super();
	}

	public int getPrixUnitaire() {
		return prixUnitaire;
	}

	public void setPrixUnitaire(int prixUnitaire) {
		this.prixUnitaire = prixUnitaire;
	}

	public String getNomProduit() {
		return nomProduit;
	}

	public void setNomProduit(String nomProduit) {
		this.nomProduit = nomProduit;
	}

	public String getCategorieProduit() {
		return categorieProduit;
	}

	public void setCategorieProduit(String categorieProduit) {
		this.categorieProduit = categorieProduit;
	}

	public String getFournisseur() {
		return Fournisseur;
	}

	public void setFournisseur(String fournisseur) {
		Fournisseur = fournisseur;
	}

	public int getQuantiteProduit() {
		return quantiteProduit;
	}

	public void setQuantiteProduit(int quantiteProduit) {
		this.quantiteProduit = quantiteProduit;
	}

	public int getUser() {
		return User;
	}

	public void setUser(Object object) {
		User = (int) object;
	}
	
	
	
	
	
}
