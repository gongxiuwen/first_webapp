<%@page language="java" import= "java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Data from DB</title>
</head>
<body onload="displayResult()">
<h1>Delete Data from DB</h1>


<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/qcis_admin";
	Connection conn = DriverManager.getConnection(url, "root", "19900914gxw!");	
	PreparedStatement querySta = conn.prepareStatement("select uts_id,user_type,surname,first_name from user");
	ResultSet rset = querySta.executeQuery();
	PreparedStatement deleteSta = conn.prepareStatement("delete from user where uts_id = ?");
	
	int result = 0;
	
	String utsId = new String();
	if(request.getParameter("utsID") != null){
		utsId = request.getParameter("utsID");
	}
	deleteSta.setString(1, utsId);
 	result = deleteSta.executeUpdate();
	
%>
<form name="myForm" action="delete.jsp" method="post">
	<table border="1">
		<tr>
  			 <td>UTS ID</td>
   			 <td><select name="utsID">
   			 		<% while (rset.next()) { %>
   					<option value="<%= rset.getString("uts_id")%>"><%= rset.getString("user_type")%> <%= rset.getString("surname")%> <%= rset.getString("first_name")%></option>
   					<% } %>
   				 </select></td>  
		</tr>
	</table>
	<input type="submit" value="Submit" name="submit" />
	<input type="hidden" name="hidden" value="<%= result%>" />
</form>

<script type="text/javascript">
	function displayResult(){
		if (document.myForm.hidden.value == 1){
			alert("Data Deleted!")
		}
	}
</script>

</body>
</html>