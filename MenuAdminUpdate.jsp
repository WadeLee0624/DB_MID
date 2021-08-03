<%@ page import = "java.sql.*, java.util.*,java.util.Date, java.text.SimpleDateFormat,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>MenuAdminUpdate</title>
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
		SimpleDateFormat sdfor = new SimpleDateFormat("yyyy-MM-dd");
        if(conn.isClosed())
           out.println("連線建立失敗");
	    else {
		
		%>

		<form name="ud" method="post" action="MenuAdminUpdateCI.jsp" >
		<%
           String ID=request.getParameter("u");
           String data="SELECT * FROM PRODUCT WHERE PID='"+ID+"'";
		   ResultSet rs = conn.createStatement().executeQuery(data);
		   while(rs.next()){
	    %>
		    <p align="center"><input type="hidden" name="id" value='<%=rs.getString("PID")%>'><br>
			<br><input type="hidden" name="cd" value='<%=rs.getString("CID")%>'><br>
			<br>商品名稱<input type="text" name="nm" value='<%=rs.getString("P_NAME")%>'><br>
			<br>單價<input type="text" name="up" value='<%=rs.getString("UNIT_PRICE")%>'><br>
            <br>備註<input type="text" name="pd" value='<%=rs.getString("P_DESC")%>'><br><br><br>
			<input type="submit"  value="確認">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<br><br><br>
			<a href="MenuAdmin.jsp">回到上一頁</a>
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

