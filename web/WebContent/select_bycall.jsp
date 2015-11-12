<%@ page import = "java.sql.*, database.* " %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Data from DB</title>
</head>
<body>
<h1>Display Data from DB</h1>
<table border = "1" >
	<tr>
		<th>UTS ID</th>
  	 	<th>User Type</th>
   		<th>Last Name</th>
   		<th>First Name</th>
	</tr>
	
<%
	DBOperation db = new DBOperation();
	ResultSet rs = db.queryDB();
	while (rs.next()){ 
%>
<tr>
	<td><%= rs.getString("uts_id") %></td>
	<td><%= rs.getString("user_type") %></td>
	<td><%= rs.getString("surname") %></td>
	<td><%= rs.getString("first_name") %></td>
</tr>	
	<% } %>
	
</table>

</body>
</html>