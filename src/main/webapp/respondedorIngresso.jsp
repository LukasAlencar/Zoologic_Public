<%@page import="java.io.PrintWriter"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mail.SendMail"%>
<%@page import="model.Usuario"%>
<%@page import="model.loginModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBQuery"%>
<%@page import="java.nio.file.Files"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DBQuery db = new DBQuery();
	PrintWriter outt = response.getWriter();	

	String ingresso = request.getParameter("ingresso");
	
	int ingressoI = Integer.parseInt(ingresso);
	
	String id = request.getParameter("id");
	id = (id == null)?"":id;
	
	int id1 = Integer.parseInt(id);
	
	//Criar user
	Usuario usuario = new Usuario(id1, ingressoI);
	usuario.update2();
	
	outt.print(1);
	outt.flush();
	

%>