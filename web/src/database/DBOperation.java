package database;
import java.sql.*;

public class DBOperation {
	
	
	
	public Connection connectDB(){
		
		Connection conn = null;
		
			try {
					String url = "jdbc:mysql://localhost:3306/qcis_admin";
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(url, "root", "19900914gxw!");
				} catch (ClassNotFoundException e) {
							e.printStackTrace();
				}
					  catch (SQLException e) {
						  	e.printStackTrace();
				}
		return conn;
	}
	
	public ResultSet queryDB(){

		ResultSet rs = null;
		
		try {
			String sql = "select * from user";
			PreparedStatement sta = connectDB().prepareStatement(sql);
			rs = sta.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}

	public int insertDB( String id, String user_type, String last_name, String first_name){
		
		int result = 0;
		
		try {
			String sql = "insert into user(uts_id,user_type,surname,first_name) values(?,?,?,?)";
			PreparedStatement sta = connectDB().prepareStatement(sql);	
			
			sta.setString(1, id);
			sta.setString(2, user_type);
			sta.setString(3, last_name);
			sta.setString(4, first_name);
			
			result = sta.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public int deleteDB(String utsID){
		
		int result = 0;
		String sql = "delete from user where uts_id = ? ";
		try {
			PreparedStatement sta = connectDB().prepareStatement(sql);
			
			sta.setString(1, utsID);
			
			result = sta.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	

}
