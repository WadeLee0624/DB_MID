<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>MenuAdminDeleteCI</title>
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
        if(conn.isClosed())
           out.println("連線建立失敗");
	    else {
			

//Step 3: 選擇資料庫 
           String ID=request.getParameter("d");
     
//Step 4: 執行 SQL 指令	
           sql="DELETE PRODUCT WHERE PID='"+ID+"'";   
           conn.createStatement().executeUpdate(sql);
//Step 5: 關閉連線
           response.sendRedirect("MenuAdmin.jsp");
		   conn.close();
		   }
}
   catch (SQLException sExec) {
         out.println("SQL錯誤"+sExec.toString());
   }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
<center>
<span id="show"></span>
</center>
</body>
</html>