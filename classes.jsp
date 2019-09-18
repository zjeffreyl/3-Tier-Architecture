<%@ page import="java.sql.*"%>
<html>
<head>
<title>JDBC Connection example</title>
</head>
<body>
<h1>JDBC Connection example</h1>
<%
	String db = "root";
	String user = "root"; // assumes database name is the same as username
	Class.forName("com.mysql.jdbc.Driver");
	try {
	java.sql.Connection con;
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?autoReconnect=true&&useSSL=false", "root", "root");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("use cs157a");
	rs = stmt.executeQuery("select * from classes");
	while(rs.next())
	{
		out.println("ID: " + rs.getInt(1) + " | CLASS: " + rs.getString(2) + " " +
		rs.getInt(3) + " " + rs.getString(4) + " | IINSTRUCTOR: " + 
		rs.getString(5) + " | TIME: " + rs.getString(6) + " - " + 
		rs.getString(7) + " ON " + rs.getString(8));
		out.println("<br>");
	}
	con.close();
	}
	catch(SQLException e) {
	out.println("SQLException caught: " +e.getMessage());
	}
%>
</body>
</html>