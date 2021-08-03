<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<%
	session.removeAttribute("name");
	session.removeAttribute("Admin_Name");
	response.sendRedirect("index.jsp");
	%>