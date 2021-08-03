<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>StoredminCreate</title>
</head>
<body>
<form name="create" method="post" action="StoredminCreateCI.jsp" >
<p align="center">店鋪編號<input type="text" name="SSID"><br>
<br>店鋪名稱<input type="text" name="SSNAME"><br>
<br>負責人<input type="text" name="EEMPLOYEE"><br>
<br>地址<input type="text" name="AADDRESS"><br>
<br>電話<input type="text" name="PPHONE"><br>
<br><br>
<input type="submit"  value="確認">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<input type="Reset" name="Reset" value="重新填寫">
</p>
</form>
<a id="c4" href="StoreAdmin.jsp"><p align="center"> 返回商店管理頁面 </a>
</body></html>
