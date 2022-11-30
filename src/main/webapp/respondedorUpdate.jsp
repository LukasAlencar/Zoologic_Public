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
	
	String id = request.getParameter("id");
	id = (id == null)?"":id;
	
	String nome = request.getParameter("nome");
	nome = (nome == null)?"":nome;
	
	String numero = request.getParameter("telefone");
	numero = (numero == null)?"":numero;
	
	String password = request.getParameter("senha");
	password = (password == null)?"":password;
	
	// Upload foto
	String filename = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", Locale.ENGLISH).format(new Date());
	filename += ".base64";

	filename = filename.replaceAll(":", "-");

	String caminho = "/Users/hacke/eclipse-workspace/Zoologic/src/main/webapp/uploadBase64/res/"+filename ;
	String strFoto = request.getParameter("foto");
	byte[] bytes = strFoto.getBytes();
	Files.write( Paths.get(caminho), bytes);

	Files.readAllBytes(Paths.get(caminho));
	out.print(strFoto);

	
	//Criar user
	Usuario usuario = new Usuario(id, nome, numero, password, caminho);
	usuario.update();
%>