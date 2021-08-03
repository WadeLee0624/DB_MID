<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.* , java.lang.Object.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>add</title>
</head>
<body>
<%

String on_check[] = (String[])session.getAttribute("on_check");
String num[] = (String[])session.getAttribute("num");
String store = (String)session.getAttribute("store");
String member = (String)session.getAttribute("name");
String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");
String desc =new String(request.getParameter("desc").getBytes("ISO-8859-1"),"UTF-8");
out.print(store);
out.print(member);
out.print(address);
out.print(desc);
//oracle.sql.TIMESTAMP new_date =new oracle.sql.TIMESTAMP System.currentTimeMillis());
java.sql.Date  stamp=new java.sql.Date (System.currentTimeMillis());
out.print(stamp);
String sql="";
//Step 1: 載入資料庫驅動程式 
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
  
//Step 2: 建立連線 	
        String url = "jdbc:oracle:thin:@140.117.69.58:1521:ORCL";    
        String user = "Group8";
        String password = "group888";
        Connection  conn = DriverManager.getConnection(url, user, password);
		
         Statement stmt = conn.createStatement(
           ResultSet.TYPE_SCROLL_INSENSITIVE,
           ResultSet.CONCUR_READ_ONLY
            );
        
		if(conn.isClosed())
           out.println("連線建立失敗");	   
         sql="insert into ORDERFORM (SID,MID,DESTINATION,DATETIME,O_DESC) ";
         sql+="VALUES (  ";
		 sql+="'"+store+"', ";   
		 sql+="'"+member+"', ";   
		 sql+="'"+address+"', ";   
		 sql+="TO_DATE('"+stamp+"','YYYY-MM-DD') , ";   
         sql+="'"+desc+"')";     
         
		conn.createStatement().execute(sql);
		
		
		sql="SELECT  OID FROM ORDERFORM WHERE SID ='"+store+"'  AND MID = '"+member+"' AND DESTINATION = '"+address+"' AND DATETIME = TO_DATE('"+stamp+"','YYYY-MM-DD') AND O_DESC ='"+desc+"' ";
	       
				
		ResultSet rs=stmt.executeQuery(sql);
		
		while(rs.next())
                {  
                  
                 for(int o =0 ;o < on_check.length ; o++){
					
					sql="insert into CONTENT (OID,PID,P_NUMBER) VALUES('"+rs.getString(1)+"','"+on_check[o]+"','"+num[o]+"') "; 
                    conn.createStatement().execute(sql);
					out.print(sql);
					 
					 
					 
				 }
				  
                 
			     
				 
				 
                }
				session.removeAttribute("store	");
		     response.sendRedirect("order_view.jsp");
			 
		 
%>

</body>
</html>
