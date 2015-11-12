<%@page  language="java" import = "java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Data into DB</title>
</head>
<body onload="displayResult()">
<h1>Insert Data into DB</h1>
<%

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/qcis_admin";
	Connection conn = DriverManager.getConnection(url,"root","19900914gxw!");
	String sql = "insert into user(uts_id,user_type,surname,first_name) values(?,?,?,?)";
	PreparedStatement sta = conn.prepareStatement(sql);	
	
	int result = 0;
	
	if(request.getParameter("submit") != null){
		
		String utsId = new String();
		String userType = new String();
		String lastName = new String();
		String firstName = new String();
		
		if(request.getParameter("utsID") != null){
			utsId = request.getParameter("utsID");
		}
		if(request.getParameter("userType") != null){
			userType = request.getParameter("userType");
		}
		if(request.getParameter("lastName") != null){
			lastName = request.getParameter("lastName");
		}
		if(request.getParameter("firstName") != null){
			firstName = request.getParameter("firstName");
		}
		
		sta.setString(1,utsId);
		sta.setString(2,userType);
		sta.setString(3,lastName);
		sta.setString(4,firstName);
		
		result = sta.executeUpdate();
	}
    
%>
<form name="myForm" action="insert.jsp" method="post">
	<table border="1">
		<tr>
			<th>UTS ID</th> <td><input type="text" name="utsID" value="" size="30"/></td>
		</tr>
		<tr>
			<th>User Type</th> <td><input type="text" name="userType" value="" size="30"/></td>
		</tr>
		<tr>
			<th>Last Name</th> <td><input type="text" name="lastName" value="" size="30"/></td>
		</tr>
		<tr>
			<th>First Name</th> <td><input type="text" name="firstName" value="" size="30"/></td>
		</tr>
	</table>
	<input type="reset" value="Clear" name="clear" />
	<input type="submit" value="Submit" name="submit" />
	<input type="hidden" name="hidden" value="<%= result %>" />
</form>
<script type="text/javascript">
	function displayResult(){
		if (document.myForm.hidden.value == 1){
			alert("Data inserted!");
		}
	}
</script>
</body>
</html>