<!-- 商店管理表格 -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language = "java" contentType = "text/html; charset=utf-8"
    pageEncoding = "utf-8"%>

<html>
<head>
<title>選擇欲察看訂單之店家</title>
</head>
<body>
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
	    sql="SELECT SID,S_NAME FROM STORE ORDER BY SID ASC"; 
		
		rs = stmt.executeQuery(sql);
		
%>
<p align="center"><h1 align="center">請選擇欲查看之店家</h1>
<table align="center" style="text-align:center" border="3" height="600">
<tr>
<td>店鋪編號</td><td>店鋪名稱</td><td>連結</td>
</tr>
<%while(rs.next()){
	String SID = rs.getString("SID");
	String SNAME =rs.getString("S_NAME");
%>
<tr>
<td><%=SID%></td><td><%=SNAME%></td><td><a href="sale_searchmode.jsp?w=<%=SID%>">點擊查看</a></td>
</tr>
<%} %>
</p>
<br>
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