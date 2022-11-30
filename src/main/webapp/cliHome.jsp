   	<%
   		
		String senha = (String) session.getAttribute("senha");
		if(senha == null || senha.isEmpty()){
			response.sendRedirect("./login");
		}
		
		int id = (int) session.getAttribute("id");
		Profile profile = new Profile(id);
		
		String caminho = profile.getCaminho();
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


<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="multitools.Profile"%>
<%@page import="java.nio.file.Files"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 
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
<title>Zoo</title>
<style type="text/css">
	#profileImg{
		width: 40px;
		border-radius: 20px;
		margin-top: -8px;
		
	}
	#profileImg:hover{
		cursor: pointer;
	}
	.obs{
		margin-top: 20px;
		font-size: 12px;
		
	}
</style>

<script type="text/javascript">

function buyConfirm(){
	setTimeout(function(){
		$('#popupBuySuccessful').modal("show");
	},2000);
}

$(document).ready(function() {
	
	$("#btnBuy1").click(function(){
		$('#ingressoInput').attr('value', '1');
		$('#popupBuy').modal("show");
	})
	$("#btnBuy2").click(function(){
		$('#ingressoInput').attr('value', '2');
		$('#popupBuy').modal("show");
	})
	$("#btnBuy3").click(function(){
		$('#ingressoInput').attr('value', '3');
		$('#popupBuy').modal("show");
	})
	
	$("#btBuyConfirm").click(function() {
		var frmData = $('#formIngresso').serialize();
		$.ajax({
			url : "respondedorIngresso.jsp",
			data : frmData,
			type : "POST",
			success : function(data) {
				if (data == 1) {
					buyConfirm();
				} else {
					$('#popup').modal("show");
				}
			}
		});
	});
});


</script>
</head>
<body>

	<div class="modal fade" id="popup" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Sua sessão foi encerrada!</h5>
								<a href="./logout.jsp">
									<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								</a>
							</div>
							<div class="modal-body">Usuario inativo</div>
							<div class="modal-footer">
								<a href="./logout.jsp"><button type="button"
										class="btn btn-primary">Login</button> </a>
							</div>
						</div>
					</div>
		</div>
		<div class="modal fade" id="popupBuySuccessful" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Reserva realizada com sucesso!</h5>
								<a href="./logout.jsp">
									<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								</a>
							</div>
							<div class="modal-body">Poderá ver mais detalhes sobre a reserva em: ...</div>
							<div class="modal-footer">
								<a href="./myTickets"><button type="button"
										class="btn btn-primary">Ingressos</button> </a>
							</div>
						</div>
					</div>
		</div>
		<div class="modal fade" id="popupBuy" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Confirmar reserva!</h5>
								<a href="./logout.jsp">
									<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								</a>
							</div> 	
							<div class="modal-body">Reserve com um clique!</div>
							<div class="modal-footer">
								<button data-dismiss="modal" id="btBuyConfirm" type="button"
										class="btn btn-primary">Reserve!</button>
							</div>
						</div>
					</div>
		</div>
	<header>
		<div class="container" id="nav-container">
			<nav class="navbar navbar-expand-lg fixed-top">
				<a class="navbar-brand" href="#">
					<img id="logo" alt="ZooLogic" src="img/logo/logo.png"> ZooLogic
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-links" aria-controls="navbar-links"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggle-icon"></span>
				</button>
				
				<div class="collapse navbar-collapse justify-content-end" id="navbar-links">
				 
					<div id="nav-barT" class="navbar-nav">
						<a class="nav-item nav-link" id="home-menu" href="#nav-container">Home</a>
						<a class="nav-item nav-link" id="values-menu" href="#buy">Preços</a>
						<a class="nav-item nav-link" id="about-menu" href="#WeAbout">Sobre nós</a>
						<a class="nav-item nav-link" id="contact-menu" href="#WeAbout">Contatos</a>
						<a class="nav-item nav-link" id="myTicket" href="./myTickets">Ingressos</a>
						<a class="nav-item nav-link" id="contact-menu" href="./logout.jsp">Sair</a>
						<a href="./myProfile" class="nav-item nav-link" ><img id="profileImg" alt="" src="<%=conteudo%>"></a>
						

					</div>
				</div>
			</nav>
		</div>
	</header>
	<main>
		<div class="container-fluid">
			<div id="mainSlider" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#mainSlider" data-slide-to="0" class="active"></li>
					<li data-target="#mainSlider" data-slide-to="1"></li>
					<li data-target="#mainSlider" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img alt="Leão" class="d-block w-100" src="./img/leao.jpg">
						<div class="carousel-caption d-none d-md-block">
							<h2>
								Está procurando ter um dia divertido?
							</h2>
							<p>Veio ao lugar certo, Reserve seu igresso e se divirta!</p>
							<a href="#buy" class="main-btn">Ingressos</a>
						</div>
					</div>
					<div class="carousel-item">
						<img alt="Girafa" class="d-block w-100" src="./img/girafa.jpg">
						<div class="carousel-caption d-none d-md-block">
							<h2>
								Grande variedade de espécies!
							</h2>
							<p>Contamos com mais de 100 espécies!</p>
							<a href="#buy" class="main-btn">Ingressos</a>
						</div>
					</div>
					<div class="carousel-item">
						<img alt="Rinoceronte" class="d-block w-100" src="./img/rinoceronte.jpg">
						<div class="carousel-caption d-none d-md-block">
							<h2>
								Aquário e DinoPark?
							</h2>
							<p>Além do Zoológico, temos um Aquário com mais de 40 espécies<br> E um parque temático de Dinossauros com mais de 3km²</p>
							<a href="#buy" class="main-btn">Ingressos</a>
						</div>
					</div>
				</div>
				<a href="#mainSlider" class="carousel-control-prev" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a href="#mainSlider" class="carousel-control-next" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	
		<div id="buy" class="container mt-5">
			
	
			<div class="form-group row col-12 d-flex justify-content-center mb-5">
				<div id="h1Buy">Reserve Seu ingresso!</div>
			</div>
			
			<form id="formIngresso">
				<input name="id" value="<%=id%>" hidden=true>
				<input id="ingressoInput" name="ingresso" type="text" value="0" hidden="true">
			</form>
			
			<div class="form-group row col-12">
				
				<div class="col-4 item">
					<div>
						<h1 class="h1Planos">
							Primeiro plano:
						</h1>
						<p>
							<strong>R$100,00</strong> <br>Com o nosso primeiro plano você poderá ter acesso ao nosso Zoológico Incrível com mais de 100 animais prontinhos para receber a sua atenção!<br><span class="obs">*Reservas têm a duração de uma semana para ser pagas</span>
						</p>
						<button type="button" id="btnBuy1" class="btn btn-success mt-3 p-2 bd-highlight">Reserve</button>
					</div>
				</div>
				<div class="col-4 item">
					<div>
						<h1 class="h1Planos">
							Segundo plano:
						</h1>
						<p>
							<strong>R$150,00</strong> <br>Com o nosso segundo plano você poderá ter acesso ao Zoológico e ao nosso grande aquário com Peixes Exóticos, Tubarões, e até Mamíferos que amam água!!<br><span class="obs">*Reservas têm a duração de uma semana para ser pagas</span>
						</p>
						<button type="button" id="btnBuy2" class="btn btn-success mt-3 p-2 bd-highlight">Reserve</button>
					</div>
				</div>	
				<div class="col-4 item">
					<div>
						<h1 class="h1Planos">
							Terceiro plano:
						</h1>
						<p>
							<strong>R$170,00</strong> <br>Com o nosso terceiro plano você poderá ter acesso ao Zoológico, Aquário e o temível DinoPark, com Dinossauros de colocar aquele medo!!<br><span class="obs">*Reservas têm a duração de uma semana para ser pagas</span>
						</p>
						<button type="button" id="btnBuy3" class="btn btn-success mt-3 p-2 bd-highlight">Reserve</button>
					</div>
				</div>
			
			</div>
		</div>
		
		<div id="WeAbout" class="container-fluid mt-5 d-flex justify-content-center"> 
			<section class="container d-flex justify-content-center form-group row">
				<div id="h1Buy">Sobre nós!</div>
					<div id="sectionAbout" class="container form-group row">
						<div>
							<strong>Zoologic</strong> <br>Somos uma equipe totalmente dedicada a trazer a sua diversão e lazer, contamos com a nossa equipe adminstrativa que é responsável por garantir a sua presença no nosso ambiente, também contamos com nossa equipe de segurança para que nada fora do normal aconteça tanto com os nossos animaizinhos quanto com vocês, e por fim temos nossa equipe de biólogos que cuidam dos nossos PETs como se fossem seus filhos, dando muito amor e carinho!
						</div>
					</div>
			</section>
		</div>
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