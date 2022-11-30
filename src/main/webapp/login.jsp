<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login Zoo</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="./img/logo/logo.ico">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css' type='text/css'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://unpkg.com/jwt-decode/build/jwt-decode.js"></script>
<script type="text/javascript">

	function handleCredentialResponse(response) {
		const data = jwt_decode(response.credential);
		$('#emailG').prop('value', data.email);
		$('#nome').prop('value', data.name);
		$('#telefone').prop('value', "");
		$('#foto').prop('value', data.picture);
		$('#sub').prop('value', data.sub);
		
		var frmData = $('#cadastroGoogle').serialize();
		debugger;
		$.ajax({
			url: "respondedorCadastroGoogle.jsp",
			data: frmData,
			type: "POST",
			success: function( data ) {
				debugger;
					var frmData = $("#cadastroGoogle").serialize();
					$.ajax({
						url : "loginServlet",
						data : frmData,
						type : "GET",
						success : function(data) {
							if (data == 1) {
								window.location.href = "./Zoo";
							} else {
								$('#popup').modal("show");
							}
						}
					});
			}
	 	});
		}
	  window.onload = function () {
	    google.accounts.id.initialize({
	      client_id: "yourClient_id",
	      callback: handleCredentialResponse
	    });
	    google.accounts.id.renderButton(
	      document.getElementById("buttonDiv"),
	      { theme: "outline", size: "large" }  // customization attributes
	    );
	  }

	$(document).ready(function() {
		var cont = 1;
		
		$(document).on('keyup', '#body', function(event) {   
		    if (event.which == 20 && cont == 1) {
		    	$('#capsWarning').css('display', 'block');
		    	cont = 0;
		    }else if (event.which == 20 && cont == 0) {
		    	$('#capsWarning').css('display', 'none');
		    	cont = 1;
		    }
		});

		$(document).on('keydown', '#body', function(event) {   
		    if (event.which == 16) {
		    	$('#capsWarning').css('display', 'block');
		    }
		});
		$(document).on('keyup', '#body', function(event) {   
		    if (event.which == 16) {
		    	$('#capsWarning').css('display', 'none');
		    }
		});
		
		
		
		
		$("#btnEnviar").click(function() {
			var frmData = $("#frmLogin").serialize();
			$.ajax({
				url : "loginServlet",
				data : frmData,
				type : "POST",
				success : function(data) {
					if (data == 1) {
						window.location.href = "./Zoo";
					} else {
						$('#popup').modal("show");
					}
				}
			});
		});
		$('#btnPronto').click(function(){
			var img = $('#imgMarvel');
			var personagem = $('#marvel').val();
			debugger;
			if(personagem == "homem aranha"){
				img.attr("src","./img/homemaranha.png");
			}
			if(personagem == "cleber"){
				img.attr("src","./img/cleber.png");
			}
			if(personagem == "homem de ferro"){
				img.attr("src","./img/homemdeferro.png");
			}
			if(personagem == "thanos"){
				img.attr("src","./img/thanos.png");
			}
			if(personagem == "capita marvel"){
				img.attr("src","./img/capita marvel.png");
			}
			if(personagem == "capitao america"){
				img.attr("src","./img/capitao america.png");
			}
			if(personagem == "deadpool"){
				img.attr("src","./img/deadpool.png");
			}
			if(personagem == "feiticeira escarlate"){
				img.attr("src","./img/feiticeira escarlate.png");
			}
			if(personagem == "gaviao arqueiro"){
				img.attr("src","./img/gaviao arqueiro.png");
			}
			if(personagem == "homem formiga"){
				img.attr("src","./img/homem formiga.png");
			}
			if(personagem == "hulk"){
				img.attr("src","./img/hulk.png");
			}
			if(personagem == "pantera negra"){
				img.attr("src","./img/pantera negra.png");
			}
			if(personagem == "thor"){
				img.attr("src","./img/thor.png");
			}
			if(personagem == "wolverine"){
				img.attr("src","./img/wolverine.png");
			}			
		});
	});
	
</script>

<style type="text/css">
.section {
	border-radius: 20px;
	box-shadow: 0px 0px 2px black;
	padding: 20px !important;
}

#imgMarvel{
	width: 321px;
	height: 280px;

}

.capsWarning{
	display: none;
	margin-left: 6px;
    color: red;
    transition: .5s;
}

</style>
</head>
<body id="body">
	<form id="cadastroGoogle">
		<input hidden="true" id="emailG" name="email">
		<input hidden="true" id="nome" name="nome">
		<input hidden="true" id="telefone" name="telefone">
		<input hidden="true" id="foto" name="foto">
		<input hidden="true" id="sub" name="sub">
	</form>
	<div class="container mt-5 d-flex justify-content-center">
		<div class="form-group row col-12 section">
			<div class= "col-6">
				<div class="modal fade" id="popup" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Não foi
									possível realizar o Login</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">Usuario não encontrado!</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Fechar</button>
								<a href="cadastro.jsp"><button type="button"
										class="btn btn-primary">Cadastre-se</button> </a>
							</div>
						</div>
					</div>
				</div>

				<div class="container">
					<h2>Login Zoo</h2>
					<form id="frmLogin">
						<div class="form-group row col-12">
							<label for="email">Email:</label> <input type="email"
								class="form-control" id="email" placeholder="Digite seu  email"
								name="email">
						</div>
						<div class="form-group row col-12">
							<label for="pwd">Password:</label>
							<label  for="pwd"><i id="capsWarning" title="Capslock ativo" class="capsWarning bi bi-exclamation-triangle-fill"></i></label>							
							<input type="password"
								class="form-control" id="senha" placeholder="Digite sua senha:"
								name="senha">
						</div>
						<div class="form-group form-check">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox" name="remember">
								Remember me
							</label>
						</div>
						<button type="button" id="btnEnviar" class="btn btn-primary">Entrar</button>
						<p class="mt-2 ">
							Não possui cadastro? <a href="./Register">Cadastre-se</a>
						</p>
						<div id="buttonDiv"></div> 
					</form>
					<div id="msg"></div>

				</div>


			</div>
			<div class="col-6">
				<div class="col-6 ml-5">
					<img id="imgMarvel" alt="" src="./img/cleber.png">
				</div>
				<div class="form-group row col-12">
					<div class="col-8">
						<input type="text" class="form-control mt-5 ml-5" id="marvel" placeholder="Personagem da Marvel" name="marvel">
						
					</div>
					<div class="col-4">
						<button type="button" id="btnPronto" class="btn btn-primary mt-5 ml-5">Pronto!</button>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>
