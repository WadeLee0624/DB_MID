<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>MenuAdminCreateCI</title>
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
		   String new_PID=request.getParameter("PID");
		   String new_CID=request.getParameter("CID");
		   String new_P_NAME=new String(request.getParameter("P_NAME").getBytes("ISO-8859-1"),"UTF-8");
		   String new_UNIT_PRICE=new String(request.getParameter("UNIT_PRICE").getBytes("ISO-8859-1"),"UTF-8");
		   String new_P_DESC=new String(request.getParameter("P_DESC").getBytes("ISO-8859-1"),"UTF-8");
     
//Step 4: 執行 SQL 指令	
           sql="INSERT INTO PRODUCT(PID,CID,P_NAME,UNIT_PRICE,P_DESC)";
           sql+="VALUES ('" + new_PID + "', ";
		   sql+="'"+new_CID+"', ";
		   sql+="'"+new_P_NAME+"', ";
		   sql+="'"+new_UNIT_PRICE+"', ";
           sql+="'"+new_P_DESC+"')";     
           conn.createStatement().execute(sql);
//Step 5: 關閉連線
           
		   conn.close();
		   %>
		   <center>
<h1>成功！</h1>
</center>
<script>
　　var t=5;//設定跳轉的時間
　　setInterval("refer()",1000); //啟動1秒定時
　　function refer(){
　　　　if(t==0){
　　　　　　location="index.html";
　　　　}
　　　　document.getElementById('show').innerHTML=""+t+"秒後跳轉到管理員介面"; // 顯示倒計時
　　　　t--; // 計數器遞減
　　　　//本文轉自：
　　}
</script>   	   
		   
<%
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