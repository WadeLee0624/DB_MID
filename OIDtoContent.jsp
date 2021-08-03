<%@ page import = "java.sql.*, java.util.*,java.util.Date, java.text.SimpleDateFormat,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>訂單詳情</title>
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
		SimpleDateFormat sdfor = new SimpleDateFormat("yyyy-MM-dd");
        if(conn.isClosed())
           out.println("連線建立失敗");
	    else {

           String ID=request.getParameter("d");
		   String SM=request.getParameter("s");
           String data="SELECT O.SID,O.OID,C.PID,P.P_NAME,P.UNIT_PRICE,C.P_NUMBER,P.UNIT_PRICE,P.UNIT_PRICE*C.P_NUMBER AS S ";
		   data+="FROM ORDERFORM O,PRODUCT P,CONTENT C ";
		   data+="WHERE O.SID ='"+SM+"' AND C.OID='"+ID+"' AND O.OID=C.OID AND C.PID=P.PID";
		   ResultSet rs = conn.createStatement().executeQuery(data);
		   int SS = 0;%>

		   
<p align="center"><table border="2">
<br><br>店鋪編號:<%=SM%><br><br>
訂單編號:<%=ID%><br><br>
<tr>
<td>商品編號</td><td>商品名稱</td><td>商品單價</td><td>訂購數量</td><td>商品總價</td>
</tr>
		 <% while(rs.next()){
			   String SID = rs.getString("SID");
			   String OID =rs.getString("OID");
           	   String PID =rs.getString("PID");
	           String PNAME =rs.getString("P_NAME");
			   String PNUM=rs.getString("P_NUMBER");
			   String UNP = rs.getString("UNIT_PRICE");
			   String S = rs.getString("S");
			   int A = Integer.parseInt(rs.getString("S"));
			   SS= SS +A;
	    %>	
<tr>
<td><%=PID%></td><td><%=PNAME%></td><td><%=UNP%></td><td><%=PNUM%></td><td><%=S%></td>
</tr>	    
		 <%}%>
</table>
<br><br><h1 align = "center">訂單總額:TW$ <%=SS%></h1></p>
		  <%}
}
    catch (SQLException sExec) {
          out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}  %>
		
</body>
</html>

