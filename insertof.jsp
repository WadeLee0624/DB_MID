
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
font-weight: bold;
width:1500px;
 height:30px;
background-image:url(images/bbb.jpg);　//插入背景圖片
  background-repeat:no-repeat;
    border:1px #ccc solid;
    background-size:cover;

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
		     <div id="DIV2" style="height:500px"  >
			 <div >
			 <%
String store = (String)session.getAttribute("store");
if(session.getAttribute("on_check") == null & session.getAttribute("num") == null){
String[] on_check = request.getParameterValues("dish");
String[] num= request.getParameterValues("num");



int c = 0;
for (int j=0;j < num.length;j++){
	if(num[j]!= "" ){
	c++ ; 
}}
String[] new_num = new String[c];
c = 0;
for (int q=0;q < num.length;q++){
	if(num[q]!= ""){
	new_num[c] = num[q] ;	
	c++ ; 
}
}
session.removeAttribute("on_check");
session.removeAttribute("num");
session.setAttribute("on_check",on_check);
session.setAttribute("num",new_num);

}else if(request.getParameterValues("dish")== null){}
else{
	String check[];
	String check1[];
	String num[];
	String num1[];
	check = (String[])session.getAttribute("on_check");
    num = (String[])session.getAttribute("num");
	check1 = request.getParameterValues("dish");
    num1 = request.getParameterValues("num");
	
	
		
	//Integer.parseInt(num1[0])+Integer.parseInt(num1[1])
     
	 
	for(int a=0;a<check.length;a++){
		for(int b=0;b<check1.length;b++){
			if(check[a].equals(check1[b])){
				check1[b] = "";
				int temp =Integer.parseInt(num[a])+Integer.parseInt(num1[b]);
				num[a] = String.valueOf(temp) ;
				num1[b] = "";	
			}
			
		}
	}
	 
	int cc = 0;
	for (int w=0;w < check1.length;w++){
		if(check1[w]!= ""  ){
		cc++ ; 
	}}
	String[] new_check1 = new String[cc];
	cc = 0;
	for (int e=0;e < check1.length;e++){
		if(check1[e]!= ""){
		new_check1[cc] = check1[e] ;	
		cc++ ; 
	}} 
	 
	 
	 
	
	int l = 0;
	for (int w=0;w < num1.length;w++){
		if(num1[w]!= ""  ){
		l++ ; 
	}}
	String[] new_num = new String[l];
	l = 0;
	for (int e=0;e < num1.length;e++){
		if(num1[e]!= ""){
		new_num[l] = num1[e] ;	
		l++ ; 
	}}
	int a = check.length+new_check1.length;
	int b = num.length+new_num.length;
	String[] sa = new String[a];
	String[] sb = new String[b];
	
	for (int x=0;x<sa.length;x++){
		  if (x<check.length){
		    sa[x] = check [x];
		}else{
			sa[x] = new_check1[x-check.length];
		}
		
	}
	for (int y=0;y<sa.length;y++){
		  if (y<num.length){
		    sb[y] = num[y];
		}else{
			sb[y] = new_num[y-num.length];
		}
		
	}
	
	session.removeAttribute("on_check");
    session.removeAttribute("num");
	session.setAttribute("on_check",sa);
    session.setAttribute("num",sb);
	
}

	
String on_check[] = (String[])session.getAttribute("on_check");
String num[] = (String[])session.getAttribute("num");

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



           sql="select * from STORE WHERE SID='"+store+"' ";
           ResultSet rs=stmt.executeQuery(sql);
		   
		   while(rs.next())
                {				
                 out.println("<p align=\"center\" >指定店鋪:"+rs.getString(2)+"</p>");
                }
			out.print("</select></form>");
%>

<table border='1' align="center"  width ="38%">
<tr><td bgcolor="#FFFFFF" align="center" width="10%">選擇</td><td bgcolor="#FFFFFF" align="center">品項名稱</td><td bgcolor="#FFFFFF" align="center">數量</td></tr>
<form  method="post" action="insertofdelete.jsp" align="center" >
<%

		
        
        for (int i=0;i<on_check.length;i++){
		out.println("<tr><td bgcolor=\"#FFFFFF\" align =\"center\">");
		out.println("<input TYPE=\"radio\" name=\"deletedish\" VALUE=\""+on_check[i]+"\">");
		out.println("</td><td bgcolor=\"#FFFFFF\"  align=\"center\" >  ");
	 
		sql="select P_NAME from PRODUCT WHERE PID = '"+on_check[i]+"'   ";   
		rs=stmt.executeQuery(sql);
		while(rs.next())
					{	
					out.println(rs.getString(1));	 
					}
	
	out.println("</td><td bgcolor=\"#FFFFFF\" align=\"center\">");
	out.println(num[i]);
	out.println("</td></tr>");	
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



%><tr><td colspan="3"bgcolor="#FFFFFF" align="center" ><input TYPE="submit" value="刪除"  style="width:100px;" ><a href="type.jsp"><button type="button"  style="width:100px;"  >新增</button></a></td></form></table><br>
<div align="center"><form method="post" action="addorder.jsp" >地址:<input type="text" size="30" name="address" style="width:300px;" ><br><br>備註:<input type="textarea"  style="width:300px;height:100px;" name="desc"><br><input TYPE="submit" value="確認訂單"></form></div>
 </div>
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