<html>
<head>
<title>test</title>
</head>
<body>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@140.117.69.58:1521:orcl","Group9","groupgroup999");
	Statement stmt =conn.createStatement();
	String sql="select * from doctor";
	ResultSet rs =stmt.executeQuery(sql);
	try
	{
	if(rs!=null)
	{
	%>
	<table border=1 cellpadding=5><tr><td>id</td><td>姓名</td></tr>
	<%
	while(rs.next())
	{
	%>
		<tr>
		<td><%=rs.getString("did")%></td>
		<td><%=rs.getString("dname")%></td>
		</tr>
	<%
	}
	}
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
	stmt.close();
	rs.close();
	conn.close();
	stmt=null;
	rs=null;
	%>
	</table>
</body>
</html>