<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>Login</title>
</head>
<body background="PROJ/img/pic2.jpg">
<br><br><br><br><br><br><br><br><br><br>
<div  style="position:absolute;left:35%;top:20%; background-color:	#3d598a; height: 300px; width:500px; font-size:18px; color:#FFFFFF;text-align:center; border:outset 4px white;">
<h1>我訂.com 登入</h1>
<br>
<form name="login" method="post" action="LoginCheck.jsp" >
<p align="center">帳號<input type="text" name="MID"><br>
<br>密碼<input type="password" name="PWD"><br><br>
<input type="submit"  value="登入" align="center">
</form>
         
            <a href="Register.jsp" style="color:#FFFFFF;">註冊
			
         
</div>
</body></html>