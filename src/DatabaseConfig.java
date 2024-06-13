import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseConfig {

    private static final String PROPERTIES_FILE = "/application.properties";
    private static String url, username, password, driver;

    static{
        try(InputStream in = DatabaseConfig.class.getResourceAsStream(PROPERTIES_FILE)){
            Properties properties = new Properties();
            properties.load(in);

            url = properties.getProperty("db.url");
            username = properties.getProperty("db.username");
            password = properties.getProperty("db.password");
            driver = properties.getProperty("db.driver");

            Class.forName(driver);
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }
}
