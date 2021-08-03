<%@ page import = "java.sql.*, java.util.*,java.util.Date, java.text.SimpleDateFormat,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>hotprstat</title>
</head>
<body>

	<%
	 String sql="";
	 int temp=0;
	 String rid="";
	 String rname="";
//try {
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
             sql="select C.PID,P.P_NAME,COUNT(C.PID) from CONTENT C,PRODUCT P WHERE  C.PID=P.PID GROUP BY C.PID,P.P_NAME";
             ResultSet rs = conn.createStatement().executeQuery(sql);
			 while(rs.next()){
			  String id=rs.getString("PID");
			  String name=rs.getString("P_NAME");
	          String num = rs.getString("COUNT(C.PID)");
			  int c_num = Integer.parseInt(num);
			  if(c_num>temp){
				  temp=c_num;
				  rid=id;
				  rname=name;
			 }}
			 %>
			 <center>
			 <a style="font-size:20px; color:#FFFFFF; text-align:center;">商品編號:<%=rid%></a><br><br>
			 <a style="font-size:20px; color:#FFFFFF; text-align:center;">名稱:<%=rname%></a><br><br>
			 <a style="font-size:20px; color:#FFFFFF; text-align:center;">被點的次數:<%=temp%></a><br>
			 </center>
			 
	<%}}
    catch (SQLException sExec) {
          out.println("SQL錯誤"+sExec.toString());
    }
//}
//catch (ClassNotFoundException err) {
//   out.println("class錯誤"+err.toString());
//}
%>
</body>
</html>