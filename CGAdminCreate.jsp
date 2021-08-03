<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>CGAdminCreate</title>
</head>
<body>
<center>
<h1>新增商品種類</h1>
</center>
<form name="login" method="post" action="CGAdminCreateCI.jsp" >
<p align="center">
輸入種類編號：<input type="text" name="CID"><br><br>
輸入種類名稱：<input type="text" name="C_NAME"><br><br>
<input type="submit" value="送出">
<input type="Reset" name="Reset" value="重新選擇">

</p>
</form>
<a id="c4" href="CategoryAdmin.jsp"><p align="center"> 返回商品種類管理頁面 </a>
</body></html>
