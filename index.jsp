<!DOCTYPE HTML>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Food House Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />	
<script src="js/jquery.min.js"> </script>
<!--web-fonts-->
  <link href='http://fonts.useso.com/css?family=Niconne|Playball|Open+Sans:300italic,400italic,600italic,400,300,600,700' rel='stylesheet' type='text/css'>
<!--//web-fonts-->
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
						
						<%
						if(session.getAttribute("name")!= null){
						     out.print(" <li><a href=\"Logout.jsp\">登出</a></li> ");
							 out.print(" <li><a href=\"menu.jsp\">點餐</a></li>");
						}else{
							 
							 out.print(" <li><a href=\"Login.jsp\">登入</a></li> ");
						}

						
						%>
						<li><a href="MenuInformation.jsp">菜單</a></li> 
						<li class="lost"><a href="aimstore.jsp">分店資訊</a></li>
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
	<!--/header-->
</div>
<!--start-slider-->
	<div class="slider-bg">
				<div class="side wow bounceInRight" data-wow-delay="0.7s">
					 <div  id="top" class="callbacks_container">
							<ul class="rslides" id="slider4">
									<li>
										<img src="images/bg2.jpg" class="img-responsive" alt="" />
										<div class="caption1">
										<div class="logo">
											<a href="index.html"><h1>我訂<span>.com</span></h1></a>
										</div>
											<h2>最優質的訂餐服務</h2>	
											<p>We offer the best Services in our website</p>
										</div>
									</li>
									<li>
									<img src="images/bg.jpg" class="img-responsive" alt="" />
									  <div class="caption1">
										<div class="logo">
											<a href="index.html"><h1>我訂<span>.com</span></h1></a>
										</div>
										<h2>黃三益老師</h2>	
											<p> best teacher ever </p>
										</div>
									</li>
									<li>
									<img src="images/bg3.jpg" class="img-responsive" alt="" />
									<div class="caption1">
									<div class="logo">
										<a href="index.html"><h1>我訂<span>.com</span></h1></a>
									</div>
										<h2>資料庫系統管理</h2>
										<p> 最棒的課程與助教</p>
									</div>										
									</li>
								 </ul>
							</div>
						</div>
					</div>	
				<!--- banner Slider starts Here --->
	  			<script src="js/responsiveslides.min.js"></script>
			 <script>
			    // You can also use "$(window).load(function() {"
			    $(function () {
			      // Slideshow 4
			      $("#slider4").responsiveSlides({
			        auto: true,
			        pager: true,
			        nav: true,
			        speed: 500,
			        namespace: "callbacks",
			        before: function () {
			          $('.events').append("<li>before event fired.</li>");
			        },
			        after: function () {
			          $('.events').append("<li>after event fired.</li>");
			        }
			      });
			
			    });
			  </script>
			<!----//End-slider-script---->
				<div class="clearfix"> </div>
</div>
		<!--start-welcome-->
        <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
		<div class="welcome-section">
		   <div class="container">
				 <div class="wel-grid">
				   <div class="col-md-4 welcome-text">
					   <h3>歡迎使用</h3>
					   <h4>我訂.com</h4>
					   <p>連結台灣各地的店舖，快速訂餐與外送<br><br></p>
				   </div>
					<div class="col-md-8 welcome-img">
					   <img src="images/img_03.jpg" class="img-responsive" alt="" />
					</div>
				   <div class="clearfix"> </div>
			   </div>
			    <div class="about-grid">
				   <div class="col-md-4 about-img">
					   <img src="images/img_02.jpg" class="img-responsive" alt="" />
					</div>
					<div class="col-md-8 about-text">
					   <h3></h3>
					   <h4>關於我們</h4>
					   <p>帥氣的資管所研究生<br><br></p>
				   </div>
				   <div class="clearfix"> </div>
			   </div>
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