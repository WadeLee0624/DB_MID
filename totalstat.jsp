<%@ page import = "java.sql.*, java.util.*,java.util.Date, java.text.SimpleDateFormat,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>totalstat</title>
</head>
<body>

	<%
	 String sql="";
	 int a=0;
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
             sql="select C.OID,P.UNIT_PRICE,C.P_NUMBER from CONTENT C,PRODUCT P WHERE C.PID=P.PID";
             ResultSet rs = conn.createStatement().executeQuery(sql);
			 while(rs.next()){
			  String id=rs.getString("OID");
			  String price=rs.getString("UNIT_PRICE");
	          String num = rs.getString("P_NUMBER");
			  int i_price = Integer.parseInt(price);
			  int i_num = Integer.parseInt(num);
			  int total=i_price*i_num;
			  a=a+total;
              }
			 %>
			 <center>
			 <a style="font-size:60px; color:#FFFFFF; text-align:center;">$<%=a%></a><br><br>
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