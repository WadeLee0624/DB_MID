<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language = "java" contentType = "text/html; charset=utf-8"
    pageEncoding = "utf-8"%>

<html>
<head>
<title>種類資訊</title>
</head>
<body>
<center>
<h1>商品種類</h1>
</center>
<%
String sql="";
//try{
//Step 1: 載入資料庫驅動程式 
	Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
	try{
//Step 2: 建立連線 	
        String url = "jdbc:oracle:thin:@140.117.69.58:1521:ORCL";    
        String user = "Group8";
        String password = "group888";
		%>
		<%
		  Connection conn=null;
          Statement stmt=null;
          ResultSet rs=null;%>
		<%
		conn = DriverManager.getConnection(url,user,password);
	    stmt = conn.createStatement();
		if(conn.isClosed())
		  out.println("連線建立失敗");
		else{
//Step 3: 選擇資料庫 		  
	    sql="SELECT ROWNUM, CG.* FROM (SELECT * FROM CATEGORY ORDER BY CID) CG"; 
		
		rs = stmt.executeQuery(sql);
		
%>
<br>
<br>
<p align="center"><table style="text-align:center" border="1">
<tr>
<td>種類編號</td><td>種類名稱</td>
</tr>
<%while(rs.next()){
	String CID = rs.getString("CID");
	String C_NAME = rs.getString("C_NAME");%>
<tr>
<td><%=CID%></td><td><%=C_NAME%></td>
</tr>
<%} %>
</p>
 
<%		
//Step 5: 關閉連線
       
		conn.close();
	}
   }
   catch (SQLException sExec) {
         out.println("SQL錯誤"+sExec.toString());
   }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
%>

</body>
</html>
<%!
     String newline(String str)         //處理換行字元的自訂方法
     {
      int index=0;
      while((index=str.indexOf("\n"))!=-1)
       str=str.substring(0,index)+"<br>"+str.substring(index+1);
      return(str);
     }
%>