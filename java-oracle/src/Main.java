import java.sql.SQLException;


public class Main {

	public static void main(String[] args) {
		
		try {
			ConnectionOracle.getConnection("jdbc:oracle:thin:@big-data-2.logti.etsmtl.ca:1521:tch054",
						"your_user", "your_password");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Something wrong");
			e.printStackTrace();
		}
		
		Produit p = new Produit("653HYT");
		Sortie s = new Sortie(12850);
		
		System.out.println(p);
		System.out.println(s);

	}

}
