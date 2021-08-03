<!--這是用來做查詢庫存的，利用輸入SID來顯示商店名稱
另外用表列出各項PID、產品名稱、以及所剩庫存量-->
<%@ page import = "java.sql.*, java.util.*,java.util.Date, java.text.SimpleDateFormat,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
<html>
<head>
<title>order</title>
</head>
<body>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="jquery-tablepage.js"></script>
 
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
		  Connection conn=null;
          Statement stmt=null;
          ResultSet rs=null;
        conn = DriverManager.getConnection(url, user, password);
		SimpleDateFormat sdfor = new SimpleDateFormat("yyyy-MM-dd");
		stmt = conn.createStatement();
        if(conn.isClosed())
           out.println("連線建立失敗");
	    else {
			

//Step 3: 選擇資料庫 
           String search_SID=request.getParameter("q");
%>
<h1 align="center">店家編號:<%=search_SID%></h1>

<tr>   
     <%
//Step 4: 執行 SQL 指令	
           sql="SELECT O.SID,O.OID,O.MID,M.NAME,O.DESTINATION,O.DATETIME,O.O_DESC ";
		   sql+="FROM ORDERFORM O,MEMBER M ";
		   sql+="WHERE O.SID ='"+search_SID+"' ";
		   sql+="AND O.MID=M.MID ORDER BY OID ASC";
		   
		   rs = stmt.executeQuery(sql);
           %>
<p align="center"><table border="3" height="600"><thead>
<td>店家編號</td><td>訂單編號</td><td>會員編號</td><td>會員名稱</td><td>目的地</td><td>訂單日期</td>
<td>訂單備註</td><td>功能</td>
</tr>
<%while(rs.next()){
	String SID = rs.getString("SID");
	String OID =rs.getString("OID");
	String MID =rs.getString("MID");
	String MNAME =rs.getString("NAME");
	String DES = rs.getString("DESTINATION");
	String DATETIME =sdfor.format(rs.getDate("DATETIME"));
	String DESC = rs.getString("O_DESC");
	%>
<tr>
<td><%=SID%></td>
<td><a href="OIDtoContent.jsp?d=<%=OID%>&s=<%=SID%>"><%=OID%></a></td>
<td><%=MID%></td><td><%=MNAME%></td><td><%=DES%></td><td><%=DATETIME%></td>
<td><%=DESC%></td><td><a href='orderdelete.jsp?e=<%=OID%>'>Delete</td>
</tr>
<%} %>  
</table><span id='table_page'></span>
<br><br><h2 align = "center">***點擊訂單編號查看訂單詳情***</h2>	   
<%
//Step 5: 關閉連線
		   conn.close();
		   }
}   
     catch (SQLException sExec) {
         out.println("SQL錯誤"+sExec.toString());%> 
		 <br><h1>庫存查詢失敗！！！<h1>
		 
		 <%} 
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
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