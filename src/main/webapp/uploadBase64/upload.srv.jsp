<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


String filename = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", Locale.ENGLISH).format(new Date());
filename += ".base64";

filename = filename.replaceAll(":", "-");

String caminho = "/yourRoute/"+filename ;
String strFoto = request.getParameter("foto");
byte[] bytes = strFoto.getBytes();
Files.write( Paths.get(caminho), bytes);

Files.readAllBytes(Paths.get(caminho));
out.print(strFoto);



%>