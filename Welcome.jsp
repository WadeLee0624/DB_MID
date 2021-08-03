<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>Welcome!</title>
</head>
<body background="PROJ/img/pic2.jpg">
<center>
<%
String a="admin";
if((session.getAttribute("name")).equals(a))
{
	%>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<h1>歡迎，<%=session.getAttribute("Admin_Name") %>你好！</h1>
<center>
<span id="ad"></span>
</center>
	<%
}
else{
%>
<h1>歡迎，<%=session.getAttribute("name") %>你好！</h1>
<center>
<a href='userupdate.jsp?u=<%=session.getAttribute("name")%>'>更改會員資料</a>
<a href="index.jsp">回首頁
</center>
<%
}
%>
</center>


<script>
　　var t=3;//設定跳轉的時間
    var s=3;
　　setInterval("refer()",1000); //啟動1秒定時
	setInterval("fun()",1000); //啟動1秒定時
　　function fun(){
　　　　if(t==0){
　　　　　　location="index.jsp"; //#設定跳轉的鏈接地址
　　　　}
　　　　document.getElementById('show').innerHTML=""+t+"秒後跳轉到我訂.COM"; // 顯示倒計時
　　　　t--; // 計數器遞減
　　}

　　function refer(){
　　　　if(s==0){
　　　　　　location="index.html"; //#設定跳轉的鏈接地址
　　　　}
　　　　document.getElementById('ad').innerHTML=""+s+"秒後跳轉到管理員頁面"; // 顯示倒計時
　　　　s--; // 計數器遞減
　　}
</script>
</body>
</html>