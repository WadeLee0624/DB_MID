<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>add</title>
</head>
<body>
<form  method="post" action="insertofdelete.jsp">
<%
String[] deletedish = request.getParameterValues("deletedish");
String on_check[] = (String[])session.getAttribute("on_check");
String num[] = (String[])session.getAttribute("num");
String[] new_on_check = new String[on_check.length-deletedish.length];
String[] new_num = new String[on_check.length-deletedish.length];
int c =0;


for (int i =0;i<deletedish.length;i++){
	for (int j =0;j<on_check.length;j++){
	if (on_check[j].equals(deletedish[i])){
	}else{
		new_on_check[c] = on_check[j] ;
		new_num[c] = num[j];
		c++;
	}}
}

session.removeAttribute("on_check");
session.removeAttribute("num");

session.setAttribute("on_check", new_on_check);
session.setAttribute("num", new_num);

response.sendRedirect("insertof.jsp");


%></table></form>
</body>
</html>