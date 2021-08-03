<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>MAdminCreate</title>
</head>
<body>
<form name="login" method="post" action="MAdminCreateCI.jsp" >
<p align="center">帳號<input type="text" name="MID"><br>
<br>密碼<input type="password" name="PWD"><br>
<br>姓名<input type="text" name="NAME"><br>
<br>生日<input type="date" name="BIRTHDATE"><br>
<br>性別<input type="radio" name="GENDER" value="男"> 男<input type="radio" name="GENDER" value="女"> 女<br>
<br>住址<input type="text" name="ADDRESS"><br>
<br>電話<input type="text" name="PHONE"><br>
<br>電子信箱<input type="text" name="EMAIL"><br><br><br>
<input type="submit"  value="確認">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<input type="Reset" name="Reset" value="重新填寫">
</p>
</form>
<a id="c4" href="MemberAdmin.jsp"><p align="center"> 返回會員管理頁面 </a>
</body></html>
