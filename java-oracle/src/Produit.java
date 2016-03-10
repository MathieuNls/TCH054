import java.sql.ResultSet;
import java.sql.SQLException;

public class Produit {

	private String codeProduit;
	private String description;
	private float cout;
	private int qte;
	private String etagere;
	private ClasseProduit classe;
	private String unite;

	/**
	 * @param codeProduit
	 */
	public Produit(String codeProduit) {

		String selection = "Select * from produit " +
				"join classe on produit.classe = classe.classe "
				+ "where code_produit='"+codeProduit+"'";
		
		
		try {
			ResultSet rs = ConnectionOracle.sqlQuery(selection);
			
			while (rs.next()) {
				this.codeProduit = rs.getString("code_produit");
				this.description = rs.getString("desc_produit");
				this.qte = rs.getInt("quantite");
				this.cout = rs.getFloat("cout");
				this.unite = rs.getString("unite");
				this.etagere = rs.getString("etagere");
				
				this.classe = 
						new ClasseProduit(rs.getString("classe"), 
								rs.getString("nom"), 
								rs.getBoolean("taxable"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Produit [codeProduit=" + codeProduit + ", description="
				+ description + ", cout=" + cout + ", qte=" + qte
				+ ", etagere=" + etagere + ", classe=" + classe + ", unite="
				+ unite + "]";
	}
	

}
