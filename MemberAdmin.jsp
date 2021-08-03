<%@ page import = "java.sql.*, java.util.*,java.util.Date, java.text.SimpleDateFormat,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>MemberAdmin</title>
</head>
<body>
<center>
</center>
<%
String sql="";
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
			 SimpleDateFormat sdfor = new SimpleDateFormat("yyyy-MM-dd");
             sql="select MEMBER.MID,MEMBER.NAME,MEMBER.BIRTHDATE,MEMBER.GENDER,MEMBER.ADDRESS,MEMBER.PHONE,MEMBER.EMAIL,MEMBER.PWD from MEMBER";
             ResultSet rs = conn.createStatement().executeQuery(sql);
			%>
			<br><br><br><br>
			<p align="center"><table style="text-align:center" border="1">
            <tr>
            <td>會員編號</td><td>會員名稱</td><td>生日</td><td>性別</td><td>地址</td><td>手機</td><td>信箱</td><td>密碼</td><td>功能</td>
            </tr>
            <%while(rs.next()){
	          String new_MID = rs.getString("MID");
	          String new_NAME =rs.getString("NAME");
	          String new_BIRTHDATE =sdfor.format(rs.getDate("BIRTHDATE"));
			  String new_GENDER =rs.getString("GENDER");
			  String new_ADDRESS =rs.getString("ADDRESS");
	          String new_PHONE = rs.getString("PHONE");
			  String new_EMAIL =rs.getString("EMAIL");
			  String new_PWD =rs.getString("PWD");%>
            <tr>
            <td><%=new_MID%></td><td><%=new_NAME%></td><td><%=new_BIRTHDATE%></td><td><%=new_GENDER%></td>
            <td><%=new_ADDRESS%></td> <td><%=new_PHONE%></td> <td><%=new_EMAIL%></td> <td><%=new_PWD%></td>
			<td>
			<a href='MAdminDeleteCI.jsp?d=<%=new_MID%>'>Delete</a>&nbsp&nbsp&nbsp
			<a href='MAdminUpdate.jsp?u=<%=new_MID%>'>Update</a>
			</td>
            </tr>
            <%}%>
            </p>
			<input type="button" value="新增會員資料" onclick="location.href='MAdminCreate.jsp'">&nbsp&nbsp&nbsp&nbsp
			<br><br><br><br>

			
			
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