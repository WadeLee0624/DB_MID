<%@ page import = "java.sql.*, java.util.*,java.util.Date, java.text.SimpleDateFormat,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>MAdminUpdate</title>
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
		
		%>

		<form name="ud" method="post" action="MAdminUpdateCI.jsp" >
		<%
           String ID=request.getParameter("u");
           String data="SELECT * FROM MEMBER WHERE MID='"+ID+"'";
		   ResultSet rs = conn.createStatement().executeQuery(data);
		   while(rs.next()){
	    %>
		    <p align="center"><input type="hidden" name="id" value='<%=rs.getString("MID")%>'><br>
			<br>姓名<input type="text" name="nm" value='<%=rs.getString("NAME")%>'><br>
			<br>密碼<input type="password" name="pwd" value='<%=rs.getString("PWD")%>'><br>
			<br>生日<input type="date" name="bd" value='<%=rs.getDate("BIRTHDATE")%>'><br>
            <br>性別<input type="text" name="gd" value='<%=rs.getString("GENDER")%>'><br>
			<br>住址<input type="text" name="adr" value='<%=rs.getString("ADDRESS")%>'><br>
			<br>電話<input type="text" name="ph" value='<%=rs.getString("PHONE")%>'><br>
			<br>電子信箱<input type="text" name="em" value='<%=rs.getString("EMAIL")%>'><br><br><br>
			<input type="submit"  value="確認">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<br><br><br>
			<a href="MemberAdmin.jsp">回到上一頁</a>
		</form>  
		<%}
		  }
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

