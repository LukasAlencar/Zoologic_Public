<%@page import="java.io.PrintWriter"%>
<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	
</body>
</html>


<%
	PrintWriter outt = response.getWriter();
	int id = (int) session.getAttribute("id");
	int result;
	Usuario usu = new Usuario(id);
	try{
		usu.delete(id);
		result = 1;
	}catch(Exception e){
		result = 0;
	}
	
	out.print(result);
	out.flush();

%>