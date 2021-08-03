<!--這是用來做查詢庫存的，利用輸入SID來顯示商店名稱
另外用表列出各項PID、產品名稱、以及所剩庫存量-->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
<html>
<head>
<title>sale</title>
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
		stmt = conn.createStatement();
        if(conn.isClosed())
           out.println("連線建立失敗");
	    else {
			

//Step 3: 選擇資料庫 
           String search_SID=request.getParameter("w");
%>
<h1 align="center">店家編號:<%=search_SID%></h1>

<tr>   
     <%
//Step 4: 執行 SQL 指令	
           sql="SELECT S.SID,T.S_NAME,P.PID,P.P_NAME,S.INVENTORY ";
		   sql+="FROM SALE S, PRODUCT P,STORE T ";
		   sql+="WHERE S.SID ='"+search_SID+"' ";
		   sql+="AND S.SID=T.SID AND S.PID=P.PID ORDER BY PID ASC";
		   
		   rs = stmt.executeQuery(sql);
           %>
<p align="center"><table style="text-align:center" border="3" height="600"><thead>
<td>商品編號</td><td>商品名稱</td><td>庫存量</td>
</tr>
<%while(rs.next()){
	String SID = rs.getString("SID");
	String PID =rs.getString("PID");
	String PNAME =rs.getString("P_NAME");
	String INVENTORY = rs.getString("INVENTORY");%>
<tr>
<td><%=PID%></td><td><%=PNAME%></td><td><%=INVENTORY%></td>
</tr>
<%} %>  
</table><span id='table_page'></span>
<a id="c4" href="saleCI.jsp"><p align="center"> 新增/修改庫存 </a>
		   
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