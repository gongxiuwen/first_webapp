<%@page import = "java.sql.* , database.*" %>
<html>
<head>
<title>Delete Data from DB</title>
</head>
<body>
<h1>Delete Data from DB</h1>
<%
DBOperation db = new DBOperation();
ResultSet rs = db.queryDB();
String utsID = null;
int result = 0;

if (request.getParameter("utsID")!= null){ 
	utsID = request.getParameter("utsID");
	result = db.deleteDB(utsID);
}
%>

<form name="MyForm" action="delete_bycall.jsp" method="post">
	<table border = "1">
		<tr>
			<td>UTS ID</td>
			<td>
				<select name="utsID">
					<% while(rs.next()){ %>
					<option value="<%=rs.getString("uts_id")%>"><%=rs.getString("uts_id")%>: <%=rs.getString("surname")%> <%=rs.getString("first_name")%></option>
					<%}%>
				</select>
			</td>
		</tr>		
	</table>
	<input type="submit" name="Submit" value="submit" />
	<input type="hidden" name="Hidden" value="<%= result %>"/>
</form>

<script>
	if (document.MyForm.Hidden.value == 1){ //note capital Hidden is the name of hidden input;
		alert("Data Deleted!");
	}
</script>
</body>
</html>