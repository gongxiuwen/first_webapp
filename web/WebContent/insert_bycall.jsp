<%@ page import = "java.sql.* , database.*" %>

<html>
<head>
<title>Insert Data into DB</title>
</head>
<body>
<form name = "MyForm" action = "insert_bycall.jsp" method = "post">
	 <table border = "1" >
		<tr>
			<th >UTS ID</th>
			<td><input type = "text" name= "utsID" value = "" size = "30" /></td>
		</tr>
		<tr>
			<th>User Type</th>
			<td><input type = "text" name= "userType" value = "" size = "30" /></td>
		</tr>
		<tr>
			<th>Last Name</th>
			<td><input type = "text" name= "lastName" value = "" size = "30" /></td>
		</tr>
		<tr>
			<th>First Name</th>
			<td><input type = "text" name= "firstName" value = "" size = "30" /></td>
		</tr>
 	</table>
 <%
 DBOperation db = new DBOperation();
 int result = 0;
	
 if (request.getParameter("Submit") != null){

    String id = new String();
    String type = new String();
    String last = new String();
    String first = new String();

    if ( request.getParameter("utsID") != null ){
    	id = request.getParameter("utsID");
    }
    if ( request.getParameter("userType") != null ){
    	type = request.getParameter("userType");
    }
    if ( request.getParameter("lastName") != null ){
    	last = request.getParameter("lastName");
    }
    if ( request.getParameter("firstName") != null ){
    	first = request.getParameter("firstName");
    }
	
 	result = db.insertDB(id,type,last,first);
	 
}	
 %>
	<input type = "reset" name = "Clear" value = "clear" />
	<input type = "submit" name = "Submit" value = "submit" />
	<input type = "hidden" name = "Hidden" value = <%= result %> />
</form>

<script type="text/javascript">
	if (document.MyForm.Hidden.value == 1){
		alert("Data Inserted!");
	}

</script>
</body>
</html>