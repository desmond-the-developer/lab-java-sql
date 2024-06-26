import java.sql.Connection; // Import for SQL connections
import java.sql.DriverManager; // Import for managing SQL drivers
import java.sql.ResultSet; // Import for handling result sets
import java.sql.SQLException; // Import for handling SQL exceptions
import java.sql.Statement; // Import for SQL statements
import java.nio.file.Files; // Import for reading files
import java.nio.file.Paths; // Import for handling file paths
import java.io.IOException; // Import for handling IO exceptions

public class DatabaseExecutor {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/airline_db"; // Update with your database URL
        String user = "root"; // Update with your database username
        String password = "password"; // Update with your database password

        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement()) {

            // Execute DDL script to create tables
            String createTablesScript = readSqlFile("sql/create_tables.sql");
            stmt.execute(createTablesScript); // Execute the script
            System.out.println("Tables created successfully."); // Print confirmation

            // Execute script to find the most often booked aircraft by gold status members
            String mostOftenBookedAircraftScript = readSqlFile("sql/most_often_booked_aircraft.sql");
            ResultSet rs = stmt.executeQuery(mostOftenBookedAircraftScript); // Execute query
            while (rs.next()) {
                System.out.println("Most often booked aircraft by gold status members: " + rs.getString("aircraft") + " with " + rs.getInt("booking_count") + " bookings."); // Print result
            }
            rs.close(); // Close the result set
        } catch (SQLException e) {
            System.out.println("An error occurred while executing the SQL scripts: " + e.getMessage()); // Handle SQL exceptions
        } catch (IOException e) {
            System.out.println("An error occurred while reading the SQL script files: " + e.getMessage()); // Handle IO exceptions
        }
    }

    private static String readSqlFile(String filename) throws IOException {
        return new String(Files.readAllBytes(Paths.get(filename))); // Read file content
    }
}
