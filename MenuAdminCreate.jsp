<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>MenuAdminCreate</title>
</head>
<body>
<center>
<h1>新增商品</h1>
</center>
<form name="login" method="post" action="MenuAdminCreateCI.jsp" >
<p align="center">
輸入商品編號：<input type="text" name="PID"><br><br>
輸入種類編號：<input type="text" name="CID"><br><br>
輸入商品名稱：<input type="text" name="P_NAME"><br><br>
輸入價位：<input type="text" name="UNIT_PRICE"><br><br>
備註：<input type="text" name="P_DESC"><br><br>
<input type="submit" value="送出">
<input type="Reset" name="Reset" value="重新選擇">
</p>
</form>
<a id="c4" href="MenuAdmin.jsp"><p align="center"> 返回商品管理頁面 </a>
</body></html>
