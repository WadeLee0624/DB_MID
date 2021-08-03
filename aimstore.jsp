<!-- 商店資訊表格 -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language = "java" contentType = "text/html; charset=utf-8"
    pageEncoding = "utf-8"%>

<html>
<head>
<title>店鋪資訊</title>
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
	    sql="SELECT * FROM STORE ORDER BY SID ASC"; 
		
		rs = stmt.executeQuery(sql);
		
%>
<br>
<br>
<p align="center"><table style="text-align:center" border="3" height="600">
<tr>
<td>店鋪編號</td><td>店鋪名稱</td><td>負責人</td><td>地址</td><td>電話</td>
</tr>
<%while(rs.next()){
	String SID = rs.getString("SID");
	String SNAME =rs.getString("S_NAME");
	String EMPLOYEE =rs.getString("EMPLOYEE");
	String ADDRESS =rs.getString("ADDRESS");
	String PHONE = rs.getString("PHONE");%>
<tr>
<td><%=SID%></td><td><%=SNAME%></td><td><%=EMPLOYEE%></td><td><%=ADDRESS%></td>
<td><%=PHONE%></td>
</tr>
<%} %>
***部分店家尚在籌備中，若資訊不全還請見諒***
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