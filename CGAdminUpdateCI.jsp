<%@ page import = "java.sql.*, java.util.*,java.util.Date, java.text.SimpleDateFormat,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>CGAdminUpdateCI</title>
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
			

//Step 3: 選擇資料庫 
		String a = request.getParameter("id");
		String b = new String(request.getParameter("nm").getBytes("ISO-8859-1"),"UTF-8");
//Step 4: 執行 SQL 指令	
	    if(a!=null&&b!=null){
		String query = "UPDATE CATEGORY SET C_NAME=? WHERE CID='"+a+"'";
        ps=conn.prepareStatement(query);
		ps.setString(1,b);
		ps.executeUpdate();
		response.sendRedirect("CategoryAdmin.jsp");
		//out.println(d);
        conn.close();
		ps.close();
//Step 5: 關閉連線
           	   
		  
		   
		} 
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
</body>
</html>

