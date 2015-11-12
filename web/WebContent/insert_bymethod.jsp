<%@ page language="java" import = "java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Data into DB</title>
</head>
<body onload="displayResult()">
<h1>Insert Data into DB</h1>

<% /* 1. use jdbc to connect DB; 2. prepare sql statement; 3. process prepared statement by place data for each column in DB*/ %>

<%!
public class operatorDB{ 
	String url = "jdbc:mysql://localhost:3306/qcis_admin";
	Connection conn = null;
	PreparedStatement insertSta = null;
	
	public operatorDB(){

		try {
			
		conn = DriverManager.getConnection(url, "root", "19900914gxw!");
		insertSta = conn.prepareStatement("insert into user(uts_id,user_type,surname,first_name) values(?,?,?,?)");
		} catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	public int insertDB ( String utsId, String userType, String lastName, String firstName ) {
		
		int result = 0;
		
		try {
			
		insertSta.setString ( 1 , utsId );
		insertSta.setString ( 2 , userType );
		insertSta.setString ( 3 , lastName );
		insertSta.setString ( 4 , firstName );
		result = insertSta.executeUpdate();		
		} catch ( SQLException e ) {
			e.getStackTrace ();
		}
		return result;		
	}	
}
%>

<% /* then, transfer filled data in form to DB by call method */ %>
<%
	int result = 0;

	if(request.getParameter("submit") != null){
		
	 	String utsId = new String();
		String userType = new String();
		String lastName = new String();
		String firstName = new String();
		
		if(request.getParameter("uts_id") != null){
			utsId = request.getParameter("uts_id");		
		}
		if(request.getParameter("user_type") != null){
			userType = request.getParameter("user_type");		
		}
		if(request.getParameter("last_name") != null){
			lastName = request.getParameter("last_name");		
		}
		if(request.getParameter("first_name") != null){
			firstName = request.getParameter("first_name");		
		}
		
		operatorDB operator = new operatorDB();
		result = operator.insertDB(utsId, userType, lastName, firstName);
	}

%>
<form name="myForm" action="insertDB.jsp" method="post">
	<table border="1">
		<tr>
			<th>UTS ID</th> <td><input type="text" name="uts_id" value="" size="30"/></td>
		</tr>
		<tr>
			<th>User Type</th> <td><input type="text" name="user_type" value="" size="30"/></td>
		</tr>
		<tr>
			<th>Last Name</th> <td><input type="text" name="last_name" value="" size="30"/></td>
		</tr>
		<tr>
			<th>First Name</th> <td><input type="text" name="first_name" value="" size="30"/></td>
		</tr>
	</table>
	<input type="reset" value="Clear" name="clear" />
	<input type="submit" value="Submit" name="submit" />
	<input type="hidden" name="hidden" value="<%= result %>" />
</form>

<script type="text/javascript">

	function displayResult(){
		if(document.myForm.hidden.value == 1){
			alert("Data Inserted!");			
		}
	}
	
</script>
</body>
</html>