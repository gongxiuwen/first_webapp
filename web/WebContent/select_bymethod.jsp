<%@page language="java" import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Data from DB</title>
</head>
<body>
<h1>Select Data from DB</h1>

 <table  border="1">
		<tr>
			<th>UTS ID</th>
			<th>User Type</th>
			<th>Last Name</th>
			<th>First Name</th>
		</tr>
		
<%! public class DBConnection {

	public Connection connection() {
		Connection conn = null;
		try {
			String url = "jdbc:mysql://localhost:3306/qcis_admin";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "19900914gxw!");

		} catch (SQLException e) {
			e.printStackTrace();
			//return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			//return null;
		}
		return conn;
	}

	public ResultSet query() {
		ResultSet rs = null;
		try {

			Connection conn = connection();
		//	if (conn != null) {
				PreparedStatement querySta = conn.prepareStatement("select * from user");
				rs = querySta.executeQuery();
				
		//	} else
			//	return null;

		} catch (SQLException e) {
			e.printStackTrace();
		//	return null;
		}
		return rs;
	}

} %>
		
<% 
		DBConnection queryDB = new DBConnection();
		ResultSet rset = queryDB.query();
//		if(rset!=null)
		while(rset.next()){
%>
		<tr>
			<td><%= rset.getString("uts_id") %></td>
			<td><%= rset.getString("user_type") %></td>
			<td><%= rset.getString("surname") %></td>
			<td><%= rset.getString("first_name") %></td>
		</tr>
		<% } %>		
</table>
</body>
</html>