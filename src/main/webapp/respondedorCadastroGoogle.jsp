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
			
	String email = request.getParameter("email");
	email = (email == null)?"":email;
	
	String nome = request.getParameter("nome");
	nome = (nome == null)?"":nome;
	
	String numero = request.getParameter("telefone");
	numero = (numero == null)?"":numero;
	
	String senha = request.getParameter("sub");
	senha = (senha == null)?"":senha;
	
	String where = "email = '" + email + "'"; 
	
	String strFoto = request.getParameter("foto");

	PrintWriter outt = response.getWriter();
	String caminho = "/Users/hacke/eclipse-workspace/Zoologic/src/main/webapp/uploadBase64/res/2022-10-28T12-35-44.466";
	
	//Criar user
	Usuario usuario = new Usuario( 0, email, nome, numero, caminho, 0, senha, 1);
	int res = usuario.save();

	outt.print(res);
	outt.flush();
%>