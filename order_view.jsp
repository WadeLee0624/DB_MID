<!DOCTYPE HTML>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>Menu</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Food House Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />	
<link href="css/menu.css" rel='stylesheet' type='text/css' />		
<script src="js/jquery.min.js"> </script>
<!--web-fonts-->
  <link href='http://fonts.useso.com/css?family=Niconne|Playball|Open+Sans:300italic,400italic,600italic,400,300,600,700' rel='stylesheet' type='text/css'>
<!--//web-fonts-->

<style>
#DIV2{


background-image:url(images/bbb.jpg);　//插入背景圖片
border:1px #ccc solid;
background-size:cover
}


</style>
</head>
<body>
	<!--start-header-->
	<div id="home" class="header">
			<!--logo-->
			<div class="header-top">
			<div class="container">
		<!--top-nav-->
			<div class="top-nav">
					<span class="menu"> </span>
					<ul>
						<li><a class="active" href="index.jsp">Home</a></li> 
						<li><a href="about.html">關於</a></li>   
						<li><a href="menu.jsp">點餐</a></li> 
						<li class="lost"><a href="order_view.jsp"><%
if(session.getAttribute("name")!= null){
String member = (String)session.getAttribute("name");
Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
  
//Step 2: 建立連線 	
        String url = "jdbc:oracle:thin:@140.117.69.58:1521:ORCL";    
        String user = "Group8";
        String password = "group888";
        Connection  conn = DriverManager.getConnection(url, user, password);
		String sql="SELECT NAME from MEMBER  WHERE MID = '"+member+"'";
		Connection con=DriverManager.getConnection(url,"Group8","group888");
		 Statement stmt = con.createStatement(
           ResultSet.TYPE_SCROLL_INSENSITIVE,
           ResultSet.CONCUR_READ_ONLY
            );
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next())
                {	
                 out.println(rs.getString(1)+" 會員您好");	 
                }

}else{
	out.print("訪客您好");
}

%></a></li>
						<li><a href="MenuInformation.jsp">菜單</a></li> 
						<li class="lost"><a href="aimstore.jsp">分店資訊</a></li>
						<div class="clearfix"> </div>
					</ul>
				</div>
				<div class="clearfix"> </div>
		<!-- script-for-menu -->
				<script>
					$(document).ready(function(){
						$("span.menu").click(function(){
							$(".top-nav ul").slideToggle(200);
						});
					});
				</script>
		</div>
	<!--End-top-nav-script-->
				<div class="clearfix"> </div>
		</div>
		<div class="head-bg">
					<div class="logo three">
							<a href="index.html"><h1>FOOD<span>House</span></h1></a>
					</div>
		</div>
		<!--/header-->
	</div>
		<div class="menu-section">
		     <div id="DIV2" style="height:600px">		 
			 <%
String member = (String)session.getAttribute("name");

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
			
			Statement stmt1 = con.createStatement(
           ResultSet.TYPE_SCROLL_INSENSITIVE,
           ResultSet.CONCUR_READ_ONLY
            );
			
		   Statement stmt2 = con.createStatement(
           ResultSet.TYPE_SCROLL_INSENSITIVE,
           ResultSet.CONCUR_READ_ONLY
            );
			
		   Statement stmt3 = con.createStatement(
           ResultSet.TYPE_SCROLL_INSENSITIVE,
           ResultSet.CONCUR_READ_ONLY
            );
           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄 		   
		                  
           
//  逐筆顯示, 直到沒有資料(最多還是5筆)
           sql="SELECT * from ORDERFORM  WHERE MID = '"+member+"'";
		   ResultSet rs=stmt.executeQuery(sql);
           
		   rs=stmt.executeQuery(sql);
		   
           int s = 0;
           while(rs.next())
                {  
			
                 out.print("<table border=\"1\" align=\"center\" width =\"45%\" > ");
				 out.print("<tr><td bgcolor=\"#FFFFFF\" align = center><font  style=\"font-weight:bold\" size=\"4\">訂單編號</font></td><td bgcolor=\"#FFFFFF\" align = center><font  style=\"font-weight:bold\" size=\"4\">訂購店鋪</font></td><td bgcolor=\"#FFFFFF\" align = center width =\"40%\"><font  style=\"font-weight:bold\" size=\"4\">送達地址</font></td><td bgcolor=\"#FFFFFF\" align = center><font  style=\"font-weight:bold\" size=\"4\">訂購日期</font></td>");
                 out.println("<tr><td bgcolor=\"#FFFFFF\" align=\"center\">"+rs.getString(1)+"</td><td bgcolor=\"#FFFFFF\" align=\"center\" >");
				 
				 
				 sql="select * from STORE WHERE SID='"+rs.getString(2)+"' ";
                 ResultSet rs1=stmt1.executeQuery(sql);
			 
		   
		         while(rs1.next())
					{				
					out.print(rs1.getString(2));
					}
		            out.print("</td><td bgcolor=\"#FFFFFF\" align = center>"+rs.getString(4)+"</td><td bgcolor=\"#FFFFFF\" align = center>"+rs.getDate(5)+"</td>"); 
					
					out.print("<tr></td><td bgcolor=\"#FFFFFF\" align = center colspan=\"2\" ><font  style=\"font-weight:bold\" size=\"4\">產品名稱</td><td bgcolor=\"#FFFFFF\" align = center colspan=\"2\"><font  style=\"font-weight:bold\" size=\"4\">數量</td>");
                    
					
				sql="select * from CONTENT WHERE OID='"+rs.getString(1)+"'";
				ResultSet rs2=stmt2.executeQuery(sql);
				 while(rs2.next()){
					 sql="select * from PRODUCT WHERE PID='"+rs.getString(2)+"'";
				     ResultSet rs3=stmt3.executeQuery(sql);
					 while(rs3.next())
					 {								
					 out.print("<tr><td bgcolor=\"#FFFFFF\" colspan=\"2\" align=\"center\">"+rs3.getString(3));
					 }
					 out.print("</td><td bgcolor=\"#FFFFFF\" colspan=\"2\" align=\"center\">"+rs2.getString(3)+"</td><td colspan=\"2\" bgcolor=\"#FFFFFF\"></td>");
				   }
				    out.print("<br>");
				 }
		         out.println("</form></table>");
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
			 </div>
		</div>
	<!--/start-reservations-->
          	<div class= "reservation">
				<div class="container"> 
				     <div class="re-main">
					    <h3>訂餐須知</h3>
						 <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960.</p>
						 <h4>40666-888</h4>
					 </div>
				</div>
			</div>		 
	<!--/end-reservations-->	
<!--/start-footer-->
	<div class= "footer">
		 <div class="container">                                                   
			<div class="col-md-3 footer-grid">
					<div class="logo two">
						<a href="index.html"><h3>FOOD<span>House</span></h3></a>
					</div>
				</div>
				<div class=" col-md-3 footer-grid footer-grid2">
					<div class="bottom-nav">
					       <h4>LEARN</h4>
							<ul>
							<li><a class="active" href="index.html">Home</a></li> 
							<li><a href="about.html">About</a></li>
							<li><a href="menu.html">MENU</a></li> 
							<li><a href="404.html">SERVICES</a></li> 
							<li><a href="portfolio.html">PORTFOLIO</a></li> 
							<li><a href="contact.html">Contact</a></li>
							<div class="clearfix"> </div>
						</ul>
					 </div>
				</div>
				<div class=" col-md-3 footer-grid">
					<div class="Office Address">
				        <h4>ADDRESS</h4>
				       <ul class="bottom-icons">
							<li><a class="home" href="#"><span> </span></a>Lorem ipsy street,Newyork</li>
							<li><a class="mail" href="mailto:info@example.com"><span> </span>123 int@example.com</a></li>
							<li><a class="mbl" href="#"><span> </span></a>+91 000 00 00 00 0</li>	
							<div class="clearfix"> </div>	
						</ul>
					 </div>
				</div>
				<div class="col-md-3 footer-grid">
					<h4>SUPPORT WITH</h4>
				    </div>
			    	<div class="clearfix"> </div>	
				</div>
			</div>
			<div class="copy-right">
			  <div class="container">
					 <p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
			   </div>		

			</div>	
			<!--start-smoth-scrolling-->
			<script type="text/javascript">
								jQuery(document).ready(function($) {
									$(".scroll").click(function(event){		
										event.preventDefault();
										$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
									});
								});
								</script>
							<!--start-smooth-scrolling-->
						<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>