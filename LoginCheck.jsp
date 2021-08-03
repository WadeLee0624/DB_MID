<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>LoginCheck</title>
</head>
<body>
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
			

			String n1=request.getParameter("MID");//登錄用户名
            String n2=request.getParameter("PWD");//登錄密碼

            if(n1!=null&&n2!=null){  //已有用户登錄 數據庫查詢

             sql="select * from MEMBER where MID='"+n1+"' and PWD='"+n2+"'";
             ResultSet rs = conn.createStatement().executeQuery(sql);   
			 out.println("登入失敗,帳號或密碼錯誤");                            //如果沒抓到半筆就會在這裡停住,顯示左列訊息
             while(rs.next()){                                                  //如果抓到了,則會在此進入while迴圈                 
             if((rs.getString(8)).equals(n2)){    
               String n3=rs.getString("NAME");			 
               session.setAttribute("name",n1);   //jsp自帶session保存消息 再跳轉後通過session.getAttribute("name")  獲得保存消息
			   session.setAttribute("Admin_Name",n3);
               response.sendRedirect("Welcome.jsp");
			   
             }else {
				 out.println("登入失敗,帳號或密碼錯誤");
              
               }
             }
			 conn.close();
			}

		   }
    }
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

	
	
	
	
	