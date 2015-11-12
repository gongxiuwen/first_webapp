package db;

import java.sql.*;

public class DBConnection {

	public Connection connection() {
		try {
			String url = "jdbc:mysql://localhost:3306/qcis_admin";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(url, "root", "19900914gxw!");

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}
	}

	public ResultSet query() {
		try {

			Connection conn = connection();
			if (conn != null) {
				PreparedStatement querySta = conn
						.prepareStatement("select * from user");
				ResultSet rs = querySta.executeQuery();
				return rs;
			} else
				return null;

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

}
