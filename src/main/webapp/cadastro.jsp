<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="icon" type="image/x-icon" href="./img/logo/logo.ico">
<style type="text/css">


	#btnEnviar{
		width: 300px;
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
	
	

</style>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
  
  	$(document).ready(function(){
  		
  		$("#divImg").click(function() {
			$("#inputFile").trigger('click');
		});
  		
  		
  		$("#inputFile").change(function (event) {
  			$('#pImg').css('display', 'none');
  			var file = event.target.files[0];
  			var reader = new FileReader();
  			reader.readAsDataURL( file );
  			reader.onload = function () {
  				var imgBase64 = reader.result;
  				console.log(imgBase64);
  				$("#imgPreview").attr("src",imgBase64);
  				$("#foto").val(imgBase64);
  			};
  			reader.onerror = function ( error ) {
  				console.log('Error: ', error);
  			};
  		});
  		
  		
  		
  		$("#btnEnviar").click(function() {
  			if($('#check1').prop('checked') == true){
				var frmData = $("#formCadastro").serialize();
				$.ajax({
					url: "respondedorCadastro.jsp",
					data: frmData,
					type: "POST",
					success: function( data ) {
						debugger;
						if(data == 1){
							$('#popup').modal("show");
						}else{
							$('#popupError').modal("show");
						}
					}
				});
  			}else{
  				alert("Preencha os campos obrigatórios");
  				$('#check1').addClass('required');
  			}
		});
  		
  		
  	});
  
  
  
  </script>
</head>

<body style="margin-top: 25vh">
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
	<div class="modal fade" id="popupError" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Tente novamente!</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	Email já cadastrado!
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	        <a href="login.jsp"><button type="button" class="btn btn-primary">Ir para Login</button> </a>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="container mt-4 d-flex justify-content-center align-items-center">
		<form id="formCadastro">
			<div class = "form-group row col-12">
				<div class="col-4">
					<label for="email">Email:</label>
					<input type="email" class="form-control" placeholder="Email" id="email" name="email">
				 </div>
				 <div class="col-4">
					<label for="name">Nome:</label>
					<input type="text" class="form-control" placeholder="Nome" id="name" name="nome">
				 </div>
				  <div class="col-4">
				  	<label for="numero">Telefone:</label>
					<input type="number" class="form-control" placeholder="Numero" id="telefone" name="telefone">
				  </div>  

			</div>
			
				
			<div class="form-group row col-12">
				<div class="col-4">
					<div class="">
						<div class="form-check mt-4">
						  <input class="form-check-input required" type="checkbox" id="check1" name="option1" value="something" required>
						  <label class="form-check-label">Concorda com nossos termos?</label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="checkbox" id="check2" name="option2" value="something" checked>
						  <label class="form-check-label">Deseja receber newsletter no seu email?</label>
						</div>
						<button type="button" id="btnEnviar" class="btn btn-primary mt-3 p-2 bd-highlight">Cadastrar</button>
					</div>
				</div>
				  <div class="col-6">
						<div>
							<div id="terms" class="card card-body scrollspy-example" data-offset="0" data-spy="scroll">
								<strong>Termos e condições gerais de uso do site Zoologic</strong><br><br> Os serviços do Zoologic são fornecidos pela pessoa física com a seguinte Razão Social/nome: Lucas Kauan Parente Alencar, inscrito no CPF sob o nº 144.059.234-93, titular da propriedade intelectual sobre software, website, aplicativos, conteúdos e demais ativos relacionados à plataforma Zoologic.<br><br> 1. Do objeto<br><br> A plataforma visa licenciar o uso de seu software, website, aplicativos e demais ativos de propriedade intelectual, fornecendo ferramentas para auxiliar e dinamizar o dia a dia dos seus usuários.<br><br> A plataforma caracteriza-se pela prestação do seguinte serviço: Reserva de ingressos de Zoológico FICTÍCIO.<br><br> 2. Da aceitação<br><br> O presente Termo estabelece obrigações contratadas de livre e espontânea vontade, por tempo indeterminado, entre a plataforma e as pessoas físicas ou jurídicas, usuárias do site.<br><br> Ao utilizar a plataforma o usuário aceita integralmente as presentes normas e compromete-se a observá-las, sob o risco de aplicação das penalidades cabíveis.<br><br> A aceitação do presente instrumento é imprescindível para o acesso e para a utilização de quaisquer serviços fornecidos pela empresa. Caso não concorde com as disposições deste instrumento, o usuário não deve utilizá-los.<br><br> 3. Do acesso dos usuários<br><br> Serão utilizadas todas as soluções técnicas à disposição do responsável pela plataforma para permitir o acesso ao serviço 24 (vinte e quatro) horas por dia, 7 (sete) dias por semana. No entanto, a navegação na plataforma ou em alguma de suas páginas poderá ser interrompida, limitada ou suspensa para atualizações, modificações ou qualquer ação necessária ao seu bom funcionamento.<br><br> 4. Do cadastro<br><br> O acesso às funcionalidades da plataforma exigirá a realização de um cadastro prévio e, a depender dos serviços ou produtos escolhidos, o pagamento de determinado valor.<br><br> Ao se cadastrar o usuário deverá informar dados completos, recentes e válidos, sendo de sua exclusiva responsabilidade manter referidos dados atualizados, bem como o usuário se compromete com a veracidade dos dados fornecidos.<br><br> O usuário se compromete a não informar seus dados cadastrais e/ou de acesso à plataforma a terceiros, responsabilizando-se integralmente pelo uso que deles seja feito.<br><br> Menores de 18 anos e aqueles que não possuírem plena capacidade civil deverão obter previamente o consentimento expresso de seus responsáveis legais para utilização da plataforma e dos serviços ou produtos, sendo de responsabilidade exclusiva dos mesmos o eventual acesso por menores de idade e por aqueles que não possuem plena capacidade civil sem a prévia autorização.<br><br> Mediante a realização do cadastro o usuário declara e garante expressamente ser plenamente capaz, podendo exercer e usufruir livremente dos serviços e produtos.<br><br> O usuário deverá fornecer um endereço de e-mail válido, através do qual o site realizará todas as comunicações necessárias.<br><br> Após a confirmação do cadastro, o usuário possuirá um login e uma senha pessoal, a qual assegura ao usuário o acesso individual à mesma. Desta forma, compete ao usuário exclusivamente a manutenção de referida senha de maneira confidencial e segura, evitando o acesso indevido às informações pessoais.<br><br> Toda e qualquer atividade realizada com o uso da senha será de responsabilidade do usuário, que deverá informar prontamente a plataforma em caso de uso indevido da respectiva senha.<br><br> Não será permitido ceder, vender, alugar ou transferir, de qualquer forma, a conta, que é pessoal e intransferível.<br><br> Caberá ao usuário assegurar que o seu equipamento seja compatível com as características técnicas que viabilize a utilização da plataforma e dos serviços ou produtos.<br><br> O usuário poderá, a qualquer tempo, requerer o cancelamento de seu cadastro junto ao site Zoologic. O seu descadastramento será realizado o mais rapidamente possível, desde que não sejam verificados débitos em aberto.<br><br> O usuário, ao aceitar os Termos e Política de Privacidade, autoriza expressamente a plataforma a coletar, usar, armazenar, tratar, ceder ou utilizar as informações derivadas do uso dos serviços, do site e quaisquer plataformas, incluindo todas as informações preenchidas pelo usuário no momento em que realizar ou atualizar seu cadastro, além de outras expressamente descritas na Política de Privacidade que deverá ser autorizada pelo usuário.<br><br> 5. Dos preços<br><br> A plataforma se reserva no direito de reajustar unilateralmente, a qualquer tempo, os valores dos serviços ou produtos sem consulta ou anuência prévia do usuário.<br><br> Os valores aplicados são aqueles que estão em vigor no momento do pedido.<br><br> Os preços são indicados em reais e não incluem as taxas de entrega, as quais são especificadas à parte e são informadas ao usuário antes da finalização do pedido.<br><br> Na contratação de determinado serviço ou produto, a plataforma poderá solicitar as informações financeiras do usuário, como CPF, endereço de cobrança e dados de cartões. Ao inserir referidos dados o usuário concorda que sejam cobrados, de acordo com a forma de pagamento que venha a ser escolhida, os preços então vigentes e informados quando da contratação. Referidos dados financeiros poderão ser armazenados para facilitar acessos e contratações futuras.<br><br>6. Do cancelamento<br><br> O usuário poderá cancelar a contratação dos serviços de acordo com os termos que forem definidos no momento de sua contratação. Ainda, o usuário também poderá cancelar os serviços em até 7 (sete) dias após a contratação, mediante contato com o Zoologic, de acordo com o Código de Defesa do Consumidor (Lei no. 8.078/90).<br><br> O serviço poderá ser cancelado por:<br><br> a) parte do usuário: nessas condições os serviços somente cessarão quando concluído o ciclo vigente ao tempo do cancelamento;<br><br> b) violação dos Termos de Uso: os serviços serão cessados imediatamente.<br><br> 7. Do suporte<br><br> Em caso de qualquer dúvida, sugestão ou problema com a utilização da plataforma, o usuário poderá entrar em contato com o suporte, através do email alencarkauan12@gmail.com.<br><br> Estes serviços de atendimento ao usuário estarão disponíveis nos seguintes dias e horários: seg à sex das 10h às 18h.<br><br> 8. Das responsabilidades<br><br> É de responsabilidade do usuário:<br><br> a) defeitos ou vícios técnicos originados no próprio sistema do usuário;<br><br> b) a correta utilização da plataforma, dos serviços ou produtos oferecidos, prezando pela boa convivência, pelo respeito e cordialidade entre os usuários;<br><br> c) pelo cumprimento e respeito ao conjunto de regras disposto nesse Termo de Condições Geral de Uso, na respectiva Política de Privacidade e na legislação nacional e internacional;<br><br> d) pela proteção aos dados de acesso à sua conta/perfil (login e senha).<br><br> É de responsabilidade da plataforma Zoologic:<br><br> a) indicar as características do serviço ou produto;<br><br> b) os defeitos e vícios encontrados no serviço ou produto oferecido desde que lhe tenha dado causa;<br><br> c) as informações que foram por ele divulgadas, sendo que os comentários ou informações divulgadas por usuários são de inteira responsabilidade dos próprios usuários;<br><br> d) os conteúdos ou atividades ilícitas praticadas através da sua plataforma.<br><br> A plataforma não se responsabiliza por links externos contidos em seu sistema que possam redirecionar o usuário ao ambiente externo a sua rede.<br><br> Não poderão ser incluídos links externos ou páginas que sirvam para fins comerciais ou publicitários ou quaisquer informações ilícitas, violentas, polêmicas, pornográficas, xenofóbicas, discriminatórias ou ofensivas.<br><br> 9. Dos direitos autorais<br><br> O presente Termo de Uso concede aos usuários uma licença não exclusiva, não transferível e não sublicenciável, para acessar e fazer uso da plataforma e dos serviços e produtos por ela disponibilizados.<br><br> A estrutura do site ou aplicativo, as marcas, logotipos, nomes comerciais, layouts, gráficos e design de interface, imagens, ilustrações, fotografias, apresentações, vídeos, conteúdos escritos e de som e áudio, programas de computador, banco de dados, arquivos de transmissão e quaisquer outras informações e direitos de propriedade intelectual da razão social Zoologic, observados os termos da Lei da Propriedade Industrial (Lei nº 9.279/96), Lei de Direitos Autorais (Lei nº 9.610/98) e Lei do Software (Lei nº 9.609/98), estão devidamente reservados.<br><br> Este Termos de Uso não cede ou transfere ao usuário qualquer direito, de modo que o acesso não gera qualquer direito de propriedade intelectual ao usuário, exceto pela licença limitada ora concedida.<br><br> O uso da plataforma pelo usuário é pessoal, individual e intransferível, sendo vedado qualquer uso não autorizado, comercial ou não-comercial. Tais usos consistirão em violação dos direitos de propriedade intelectual da razão social Zoologic, puníveis nos termos da legislação aplicável.<br><br> 10. Das sanções<br><br> Sem prejuízo das demais medidas legais cabíveis, a razão social Zoologic poderá, a qualquer momento, advertir, suspender ou cancelar a conta do usuário:<br><br> a) que violar qualquer dispositivo do presente Termo;<br><br> b) que descumprir os seus deveres de usuário;<br><br> c) que tenha qualquer comportamento fraudulento, doloso ou que ofenda a terceiros.<br><br> 11. Da rescisão<br><br> A não observância das obrigações pactuadas neste Termo de Uso ou da legislação aplicável poderá, sem prévio aviso, ensejar a imediata rescisão unilateral por parte da razão social Zoologic e o bloqueio de todos os serviços prestados ao usuário.<br><br> 12. Das alterações<br><br> Os itens descritos no presente instrumento poderão sofrer alterações, unilateralmente e a qualquer tempo, por parte de Zoologic, para adequar ou modificar os serviços, bem como para atender novas exigências legais. As alterações serão veiculadas OU pelo site Zoologic e o usuário poderá optar por aceitar o novo conteúdo ou por cancelar o uso dos serviços, caso seja assinante de algum serviço.<br><br> Os serviços oferecidos podem, a qualquer tempo e unilateralmente, e sem qualquer aviso prévio, ser deixados de fornecer, alterados em suas características, bem como restringido para o uso ou acesso.<br><br> 13. Da política de privacidade<br><br> Além do presente Termo, o usuário deverá consentir com as disposições contidas na respectiva Política de Privacidade a ser apresentada a todos os interessados dentro da interface da plataforma.<br><br> 14. Do foro<br><br> Para a solução de controvérsias decorrentes do presente instrumento será aplicado integralmente o Direito brasileiro.<br><br> Os eventuais litígios deverão ser apresentados no foro da comarca em que se encontra a sede da empresa.<br><br>
							</div>
						</div>
				</div>
				<p id ="msg">
				
				</p>
				  <div id="uploadImg" class="col-2">
				  	
					<div id="divImg"><img onload="this.style.display = 'block'" onerror="this.style.display = 'none'" id="imgPreview" alt="Carregar Imagem" src=""> 
						<p id="pImg">
				  			Carregar imagem
				  		</p>	
				  	</div>
						
						<input type="hidden" id="foto" name="foto" value="">
						<input type="file" id="inputFile" name="inputFile" style="display: none;"><br>
					<div id="msg"></div>
					
				  </div>  
			</div>
			<div class="form-group row col-12">
				<div class="col-12">
					<p>Já possui uma conta? <a href="./login" class="link-primary">Ir para Login</a></p>
				</div>
				
			</div>
					
			  
			
		</form>


	</div>
</body>
</html>