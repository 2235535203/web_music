package sql_connect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DBUtil1 {
	// table
	public static final String TABLE_USERS= "users";
	//public static final String TABLE = "table_user_info";
 
	// connect to MySql database
	public static Connection getConnect() {
		String url = "jdbc:mysql://localhost:3306/music_db?&useSSL=false&serverTimezone=GMT%2B8"; // 数据库的Url
		Connection connecter = null;
		try {
			Class.forName("com.mysql.jdbc.Driver"); // java反射，固定写法
			connecter = (Connection) DriverManager.getConnection(url, "root", "lyp82nlf");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
		}
		return connecter;
	}
}



