package data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/EM";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    public static void main(String[] args) {
        try {
        
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            
            if (connection != null) {
                System.out.println("Connected to the database.");
                
                connection.close();
            } else {
                System.out.println("Failed to connect to the database.");
            }
        } catch (SQLException e) {
            
            System.err.println("Error connecting to the database: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
