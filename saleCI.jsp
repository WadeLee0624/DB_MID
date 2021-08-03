<!--下拉選單並填入庫存 -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language = "java" contentType = "text/html; charset=utf-8"
    pageEncoding = "utf-8"%>

<html>
<head>
<title>庫存選單</title>
</head>
<body>
<form name="stock" method="post" action="sale.jsp" >
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
	    sql="SELECT SID FROM STORE ORDER BY SID ASC"; 		
		rs = stmt.executeQuery(sql);
		%>
		<h2>店鋪編號</h2>
        <select name = 'SelectSID'>
        <option value='-1'>請選擇</option>
		<%
		    while (rs.next()){
			String AAA = rs.getString("SID");
			%>
			<option value="<%=AAA%>"><%=AAA%></option>
			<%}%>
			</select>
		<h2>商品編號</h2>
		<select name ='SelectPID'>
        <option value='-1'>請選擇</option>
		<%sql="SELECT PID FROM PRODUCT ORDER BY PID ASC"; 		
		  rs = stmt.executeQuery(sql);
		    while (rs.next()){
			String BBB = rs.getString("PID");
			%>
			<option value="<%=BBB%>"><%=BBB%></option>
		<%}%>
			</select>
	    <h2>請輸入目前庫存量:</h2>
        <input type="text" name="Now_Inventory">
		<br><br><input type="submit"  value="確認">

 
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