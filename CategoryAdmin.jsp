<%@ page import = "java.sql.*, java.util.*,java.util.Date, java.text.SimpleDateFormat,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>CategoryAdmin</title>
</head>
<body>
<%
String sql="";
//try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    try {
//Step 2: 建立連線 	
        String url = "jdbc:oracle:thin:@140.117.69.58:1521:ORCL";    
        String user = "Group8";
        String password = "group888";
        Connection  conn = DriverManager.getConnection(url, user, password);
        if(conn.isClosed())
           out.println("連線建立失敗");
	    else {
             sql="select CATEGORY.CID,CATEGORY.C_NAME from CATEGORY ORDER BY CID ASC";
             ResultSet rs = conn.createStatement().executeQuery(sql);
			%>
			<br><br><br><br>
			<p align="center"><table style="text-align:center" border="1">
            <tr>
            <td>種類編號</td><td>種類名稱</td><td>功能</td>
            </tr>
            <%while(rs.next()){
	          String CID = rs.getString("CID");
			  String C_NAME = rs.getString("C_NAME");%>
            <tr>
            <td><%=CID%></td><td><%=C_NAME%></td>
			<td>
			<a href='CGAdminDeleteCI.jsp?d=<%=CID%>'>Delete</a>&nbsp&nbsp&nbsp
			<a href='CGAdminUpdate.jsp?u=<%=CID%>'>Update</a>
			</td>
            </tr>
            <%}%>
            </p>
			<br><br>
			<input type="button" value="新增商品種類資料" onclick="location.href='CGAdminCreate.jsp'">&nbsp&nbsp&nbsp&nbsp
			<br><br>
			
			
	<%}}
    catch (SQLException sExec) {
          out.println("SQL錯誤"+sExec.toString());
    }
//}
//catch (ClassNotFoundException err) {
//   out.println("class錯誤"+err.toString());
//}
%>
</body>
</html>