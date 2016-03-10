import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Sortie {
	
	private int noSortie;
	private Produit produit;
	private Date date;
	private String projet;
	private int qte;
	
	/**
	 * @param noSortie
	 */
	public Sortie(int noSortie){
		String selection = "Select * from sortie "
				+ "where no_sortie='"+noSortie+"'";
		
		System.out.println(selection);
		
		try {

			ResultSet rs = ConnectionOracle.sqlQuery(selection);

			while (rs.next()) {
				
				this.noSortie = rs.getInt("no_sortie");
				this.produit = new Produit(rs.getString("code_produit"));
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * @param noSortie
	 * @param produit
	 * @param date
	 * @param projet
	 * @param qte
	 */
	public Sortie(int noSortie, Produit produit, Date date, String projet,
			int qte) {
		this.noSortie = noSortie;
		this.produit = produit;
		this.date = date;
		this.projet = projet;
		this.qte = qte;
		
		
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Sortie [noSortie=" + noSortie + ", produit=" + produit
				+ ", date=" + date + ", projet=" + projet + ", qte=" + qte
				+ "]";
	}
	
	/**
	 * @param qte
	 * @param connection
	 */
	public void setQte(int qte, Connection connection) {
		
		String update = "Update sortie set quantite = "+ qte
				+ " where no_sortie='" + this.noSortie+ "';";
		
		try {
			Statement statement = connection.createStatement();
			statement.executeQuery(update);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		this.qte = qte;
	}	

}
