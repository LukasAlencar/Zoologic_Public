	<%@page import="model.Usuario"%>
<%
		String psw = (String) session.getAttribute("senha");
		if(psw == null || psw.isEmpty()){
			response.sendRedirect("./login.jsp");
		}
	%>

<%@page import="java.nio.file.Path"%>
<%@page import="multitools.Profile"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
	    int id = (int) session.getAttribute("id");
		Profile usu = new Profile(id);
		int ticket = usu.getIngresso();
		String caminho = usu.getCaminho();
		String conteudo = "";
	    
		Path local = Paths.get(caminho);
		try{
			byte [] conteudoBytes = Files.readAllBytes(local);
			conteudo = new String(conteudoBytes);
		}
		catch(Exception e){
	    }
		if(conteudo == ""){
			conteudo = "./img/logo/icoProfile.png";
		}
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="icon" type="image/x-icon" href="./img/logo/logo.ico">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="static/js/script.js" defer></script>
<title>Profile</title>
<style type="text/css">
#profileImg{
		width: 40px;
		border-radius: 20px;
		margin-top: -8px;
		
	}
	#profileImg:hover{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
$(document).ready(function(){

	
	if($('#whichTicket').val() == 1){
		$('#ticketId').attr('src', './img/ingresso1.png');
	}
	if($('#whichTicket').val() == 2){
		$('#ticketId').attr('src', './img/ingresso2.png');
	}
	if($('#whichTicket').val() == 3){
		$('#ticketId').attr('src', './img/ingresso3.png');
	}
	
});
	



</script>
<style type="text/css">
	#btnEnviar{
		width: 200px;
		height: 60px;
	
	}
	#terms{
		height: 150px;
		overflow-y: scroll;
	
	}


	#termsCheck{
		margin-left: 20px;
	
	}
	#imgPreview{
	  	width: 100%;
	  	height: 100%;	
	  	border-radius: 10px;
	  	transition: 0.5s;
	}
	
	#imgPreview:hover{
	  	opacity: 70%;
	}

	#divImg{
		position: relative;
		margin: 0px -50px 0px 0px;
		width: 150px;
	  	height: 150px;
		background-color: gray;
		border-radius: 10px;
		border-style: solid;
		border-color: black;
		transition: 0.5s;
	}
	
	#divImg:hover{
		background-color: #474A51;
		cursor: pointer;
	
	}
	
	div p{
	  position:absolute;
	  top:50%;
	  left:50%;
	  transform:translate(-50%,-50%);
	  font-weight: bolder;
	}	
	.alingI{
		margin: 10px 15px;
	}
	
	select {
		margin-top: 32px;
	
	}
	
	h2{
		color: #FFF;
		margin-bottom: 40px;
	}
	.red{
		color: red;
		text-transform: uppercase;
		font-weight: 400;
		font-size: 20px;
		transition: .3s;
	}
	
	 .red:hover{
		color: #8B0000;
		text-decoration: none;
	}
	
	</style>

</head>
<body>
				<div class="modal fade" id="popup" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Prontinho!</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">Alterações feitas com sucesso!</div>
							<div class="modal-footer">
								<button aria-label="Close" data-dismiss="modal" type="button"
										class="btn btn-primary">Ok</button>
							</div>
						</div>
					</div>
				</div>
				
				<div class="modal fade" id="popupDelete" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Prontinho!</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">Usuario deletado com sucesso!</div>
							<div class="modal-footer">
								<button aria-label="Close" data-dismiss="modal" type="button"
										class="btn btn-primary">Ok</button>
							</div>
						</div>
					</div>
				</div>
	<header>
		<div class="container" id="nav-container">
			<nav class="navbar navbar-expand-lg fixed-top">
				<a class="navbar-brand" href="./Zoo">
					<img id="logo" alt="ZooLogic" src="img/logo/logo.png"> ZooLogic
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-links" aria-controls="navbar-links"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggle-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end" id="navbar-links">
					<div id="nav-barT" class="navbar-nav">
						<a class="nav-item nav-link" id="home-menu" href="./Zoo#nav-container">Home</a>
						<a class="nav-item nav-link" id="values-menu" href="./Zoo#buy">Preços</a>
						<a class="nav-item nav-link" id="about-menu" href="./Zoo#WeAbout">Sobre nós</a>
						<a class="nav-item nav-link" id="contact-menu" href="./Zoo#WeAbout">Contatos</a>
						<a class="nav-item nav-link" id="contact-menu" href="./logout.jsp">Sair</a>
						<a href="./myProfile" class="nav-item nav-link" ><img id="profileImg" alt="" src="<%=conteudo%>"></a>
					</div>
				</div>
			</nav>
		</div>
		<div class="modal fade" id="popup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Obrigado por se cadastrar!</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        Sua senha será enviada no e-mail registrado!
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	        <a href="login.jsp"><button type="button" class="btn btn-primary">Ir para Login</button> </a>
	      </div>
	    </div>
	  </div>
	</div>
	</header>
	<main>
		<div class="container-fluid d-flex justify-content-center">
				<img id="ticketId" alt="" src="./img/ingresso0.png">
				
		</div>
		<div class="container-fluid d-flex justify-content-center" >
			<a class="btn btn-light mb-3" href="./pdfs/ingresso<%=ticket%>.pdf" download>Exportar</a>
		</div>
		<input id="whichTicket" hidden="true" value="<%=ticket%>">
		
	</main>
	<footer class="text-center text-white" style="background-color: #f1f1f1;">
	  <!-- Grid container -->
	  <div id="footerDiv" class="container pt-4">
	    <!-- Section: Social media -->
	    <section class="mb-4">
	      <!-- Gmail -->
	      <a
	        class="btn btn-link btn-floating btn-lg text-dark m-1"
	        href="mailto:alencarkauan12@gmail.com"
	        target="_blanck"
	        role="button"
	        data-mdb-ripple-color="dark"
	        ><i class="bi bi-envelope-fill"></i></a>
	
	      <!-- Instagram -->
	      <a
	        class="btn btn-link btn-floating btn-lg text-dark m-1"
	        href="https://instagram.com/lucass.kauan"
	        target="_blanck"
	        role="button"
	        data-mdb-ripple-color="dark"
	        ><i class="bi bi-instagram"></i></a>
	
	      <!-- Linkedin -->
	      <a
	        class="btn btn-link btn-floating btn-lg text-dark m-1"
	        href="https://www.linkedin.com/in/lucas-alencar-b539241ba/"
	        target="_blanck"
	        role="button"
	        data-mdb-ripple-color="dark"
	        ><i class="bi bi-linkedin"></i></a>
	      <!-- Github -->
	      <a
	        class="btn btn-link btn-floating btn-lg text-dark m-1"
	        href="https://github.com/LukasAlencar"
	        target="_blanck"
	        role="button"
	        data-mdb-ripple-color="dark"
	        ><i class="bi bi-github"></i></a>
	      
	    </section>
	    <!-- Section: Social media -->
	  </div>
	  <!-- Grid container -->
	
	  <!-- Copyright -->
	  <div class="text-center text-dark p-3" style="background-color: rgba(0, 0, 0, 0.2);">
	    © 2022 Copyright:
	    <a class="text-dark" target="_blanck" href="https://github.com/LukasAlencar">Lucas Alencar</a>
	  </div>
	  <!-- Copyright -->
	</footer>
</body>
</html>

