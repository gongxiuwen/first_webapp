<%@page import="java.io.BufferedReader"%>
<%@page language="java" import ="java.sql.*" %>

<html>
<head>
	<title>Display Data from DB</title>
</head>
<body>
<h1>Display Data from DB</h1>
 
<table border="1">
<thead>
 <tr>
   <th>UTS ID</th>
   <th>User Type</th>
   <th>Last Name</th>
   <th>First Name</th>  
 </tr>
</thead>

<tbody>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/qcis_admin";
	Connection conn = DriverManager.getConnection(url, "root", "19900914gxw!");	
	
	Statement sta = conn.createStatement();
	String sql = "select * from user";
	
	ResultSet rsSet = sta.executeQuery(sql);
	
		while (rsSet.next()) {
		    String uts_id = rsSet.getString("uts_id");
		    String user_type = rsSet.getString("user_type");
		    String surname = rsSet.getString("surname");
		    String first_name = rsSet.getString("first_name");
		   	
		    out.write("<tr>");
		    out.write("<td>" + uts_id + "</td>");
		    out.write("<td>" + user_type + "</td>");
		    out.write("<td>" + surname + "</td>");
		    out.write("<td>" + first_name + "</td>");
		    out.write("</tr>");			
			}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	catch ( ClassNotFoundException e) {
		e.printStackTrace();
	}

%>
</tbody>
</table>
</body>
</html>
