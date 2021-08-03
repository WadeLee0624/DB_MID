<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>列出所有留言</title>
</head>
<body>

<%


try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    try {
//Step 2: 建立連線 	
        String url="jdbc:oracle:thin:@140.117.69.58:1521:ORCL";
        String sql="";
        Connection con=DriverManager.getConnection(url,"Group8","group888");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   

//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
                    
		   Statement stmt = con.createStatement(
           ResultSet.TYPE_SCROLL_INSENSITIVE,
           ResultSet.CONCUR_READ_ONLY
            );
           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄 
		   
		   
           sql="select * from STORE   ";
		   
		   
		   ResultSet rs=stmt.executeQuery(sql);
		   out.print("<form id=\"order_type\" method=\"post\" action=\"type.jsp\"> <select  name=\"store\" id=\"type_select\" form=\"order_type\" onchange=\"this.form.submit()\"><OPTION  SELECTED>選擇店家</option> ");
//  逐筆顯示, 直到沒有資料(最多還是5筆)
           while(rs.next())
                {	
                 out.println("<option value=\""+rs.getString(1)+"\">"+rs.getString(2)+"</option><br>");	 
                }
		 

//Step 6: 關閉連線
          con.close();
      }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤");		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤");
}
%>

</body>
</html>