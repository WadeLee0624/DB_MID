<%@ page import = "java.sql.*, java.util.*,java.util.Date, java.text.SimpleDateFormat,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>MenuAdmin</title>
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
             sql="select * from (select ROWNUM ROW_NUM, P.* from (select PRODUCT.PID,PRODUCT.CID,PRODUCT.P_NAME,PRODUCT.UNIT_PRICE,PRODUCT.P_DESC from PRODUCT ORDER BY PRODUCT.PID ASC) P where ROWNUM < 100) WHERE ROW_NUM > 40";
			 
             ResultSet rs = conn.createStatement().executeQuery(sql);
			%>
			<br><br><br><br>
			<p align="center"><table style="text-align:center" border="1">
            <tr>
            <td>商品編號</td><td>種類編號</td><td>商品名稱</td><td>單價</td><td>備註</td><td>功能</td>
            </tr>
            <%while(rs.next()){
	          String PID = rs.getString("PID");
			  String CID = rs.getString("CID");
			  String P_NAME = rs.getString("P_NAME");
			  String UNIT_PRICE = rs.getString("UNIT_PRICE");
			  String P_DESC = rs.getString("P_DESC");%>
            <tr>
            <td><%=PID%></td><td><%=CID%></td><td><%=P_NAME%></td><td><%=UNIT_PRICE%></td>
            <td><%=P_DESC%></td>
			<td>
			<a href='MenuAdminDeleteCI.jsp?d=<%=PID%>'>Delete</a>&nbsp&nbsp&nbsp
			<a href='MenuAdminUpdate.jsp?u=<%=PID%>'>Update</a>
			</td>
            </tr>
            <%}%>
            </p>
			<input type="button" value="新增商品資料" onclick="location.href='MenuAdminCreate.jsp'">&nbsp&nbsp&nbsp&nbsp
			
			
	<%}}
    catch (SQLException sExec) {
          out.println("SQL錯誤"+sExec.toString());
    }
//}
//catch (ClassNotFoundException err) {
//   out.println("class錯誤"+err.toString());
//}
%>
<br><br>
<a href="MenuAdmin.jsp">第一頁</a> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <a href="MenuAdmin2.jsp">第二頁</a> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<a href="MenuAdmin3.jsp">第三頁</a> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <a href="MenuAdmin4.jsp">第四頁</a> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<a href="MenuAdmin5.jsp">第五頁</a>
</body>
</html>