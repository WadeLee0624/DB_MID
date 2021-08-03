<!--Storeadminupdate-->
<%@ page import = "java.sql.*, java.util.*,java.util.Date, java.text.SimpleDateFormat,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>商家資料更新</title>
</head>
<body>
<%
String sql="";
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
   try {
//Step 2: 建立連線 	
        String url = "jdbc:oracle:thin:@140.117.69.58:1521:ORCL";    
        String user = "Group8";
        String password = "group888";
        Connection  conn = DriverManager.getConnection(url, user, password);
		PreparedStatement ps=null;
		Statement statement = null;
        if(conn.isClosed())
           out.println("連線建立失敗");
	    else {
		
		%>
		<form name="SAU" method="post" action="StoreadminupdateCI.jsp" >
		<%
           String SSID=request.getParameter("d");
            sql="SELECT * FROM STORE WHERE SID='"+SSID+"'";
		   ResultSet rs = conn.createStatement().executeQuery(sql);
		   while(rs.next()){
	    %>
		    <p align="center"><input type="hidden" name="id" value='<%=rs.getString("SID")%>'><br>
			<br>姓名<input type="text" name="nm" value='<%=rs.getString("S_NAME")%>'><br>
		    <br>負責人<input type="text" name="ep" value='<%=rs.getString("EMPLOYEE")%>'><br>
			<br>住址<input type="text" name="adr" value='<%=rs.getString("ADDRESS")%>'><br>
			<br>電話<input type="text" name="ph" value='<%=rs.getString("PHONE")%>'><br><br><br>
			
			<input type="submit"  value="確認">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<br><br><br>
			<a href="StoreAdmin.jsp">回到上一頁</a>
		</form>  
		<%}
		  }
}
    catch (SQLException sExec) {
          out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}  %>
		
</body>
</html>

