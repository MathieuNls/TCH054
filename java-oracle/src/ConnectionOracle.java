import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionOracle {

	private static Connection connection = null;

	/**
	 * @param url
	 * @param user
	 * @param password
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public static Connection getConnection(String url, String user, String password) throws SQLException, ClassNotFoundException {

		if (connection == null) {

			Class.forName("oracle.jdbc.driver.OracleDriver");

			System.out.println("Oracle JDBC Driver Registered!");
			
			connection = DriverManager.getConnection(url, user, password);

			/*connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@big-data-2.logti.etsmtl.ca:1521:tch054",
					"equipe65", "wGh1pqqL");*/

		}

		return connection;
	}
	
	/**
	 * @param query
	 * @return
	 * @throws SQLException
	 */
	public static ResultSet sqlQuery(String query) throws SQLException{
		
		Statement statement = connection.createStatement();
		return statement.executeQuery("Select * from produit");
	}
}
