<!--修改庫存後所進入的頁面-->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>sale</title>
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
        if(conn.isClosed())
           out.println("連線建立失敗");
	    else {
			

//Step 3: 選擇資料庫 
           String new_Inventory=request.getParameter("Now_Inventory");
           String aim_SID=request.getParameter("SelectSID");
		   String aim_PID=request.getParameter("SelectPID");
     
//Step 4: 執行 SQL 指令	
           sql="BEGIN INSERT INTO SALE(SID,PID,INVENTORY)";
           sql+="VALUES('"+aim_SID+"', ";
		   sql+="'"+aim_PID+"', ";
		   sql+="'"+new_Inventory+"'); ";
		   sql+="EXCEPTION WHEN dup_val_on_index THEN "; 
		   sql+="UPDATE SALE SET INVENTORY="+new_Inventory+" ";
		   sql+="WHERE "+aim_SID+"=SID AND "+aim_PID+"=PID;end;";
		  

           conn.createStatement().execute(sql);
%><h1>庫存輸入成功！！！<h1><%
//Step 5: 關閉連線
		   conn.close();
		   }
}   
     catch (SQLException sExec) {
         out.println("SQL錯誤"+sExec.toString());%> 
		 <br><h1>庫存更改失敗！！！<h1>
		 請確認您已選擇店鋪編號及商品編號，並填入庫存數量
		 <%} 
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
<a id="c4" href="saleCI.jsp"><p align="center"> 返回庫存輸入頁面 </a>
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