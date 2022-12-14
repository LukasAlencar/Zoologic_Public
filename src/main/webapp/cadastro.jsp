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
  				alert("Preencha os campos obrigat??rios");
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
	        Sua senha ser?? enviada no e-mail registrado!
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
	      	Email j?? cadastrado!
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
								<strong>Termos e condi????es gerais de uso do site Zoologic</strong><br><br> Os servi??os do Zoologic s??o fornecidos pela pessoa f??sica com a seguinte Raz??o Social/nome: Lucas Kauan Parente Alencar, inscrito no CPF sob o n?? 144.059.234-93, titular da propriedade intelectual sobre software, website, aplicativos, conte??dos e demais ativos relacionados ?? plataforma Zoologic.<br><br> 1. Do objeto<br><br> A plataforma visa licenciar o uso de seu software, website, aplicativos e demais ativos de propriedade intelectual, fornecendo ferramentas para auxiliar e dinamizar o dia a dia dos seus usu??rios.<br><br> A plataforma caracteriza-se pela presta????o do seguinte servi??o: Reserva de ingressos de Zool??gico FICT??CIO.<br><br> 2. Da aceita????o<br><br> O presente Termo estabelece obriga????es contratadas de livre e espont??nea vontade, por tempo indeterminado, entre a plataforma e as pessoas f??sicas ou jur??dicas, usu??rias do site.<br><br> Ao utilizar a plataforma o usu??rio aceita integralmente as presentes normas e compromete-se a observ??-las, sob o risco de aplica????o das penalidades cab??veis.<br><br> A aceita????o do presente instrumento ?? imprescind??vel para o acesso e para a utiliza????o de quaisquer servi??os fornecidos pela empresa. Caso n??o concorde com as disposi????es deste instrumento, o usu??rio n??o deve utiliz??-los.<br><br> 3. Do acesso dos usu??rios<br><br> Ser??o utilizadas todas as solu????es t??cnicas ?? disposi????o do respons??vel pela plataforma para permitir o acesso ao servi??o 24 (vinte e quatro) horas por dia, 7 (sete) dias por semana. No entanto, a navega????o na plataforma ou em alguma de suas p??ginas poder?? ser interrompida, limitada ou suspensa para atualiza????es, modifica????es ou qualquer a????o necess??ria ao seu bom funcionamento.<br><br> 4. Do cadastro<br><br> O acesso ??s funcionalidades da plataforma exigir?? a realiza????o de um cadastro pr??vio e, a depender dos servi??os ou produtos escolhidos, o pagamento de determinado valor.<br><br> Ao se cadastrar o usu??rio dever?? informar dados completos, recentes e v??lidos, sendo de sua exclusiva responsabilidade manter referidos dados atualizados, bem como o usu??rio se compromete com a veracidade dos dados fornecidos.<br><br> O usu??rio se compromete a n??o informar seus dados cadastrais e/ou de acesso ?? plataforma a terceiros, responsabilizando-se integralmente pelo uso que deles seja feito.<br><br> Menores de 18 anos e aqueles que n??o possu??rem plena capacidade civil dever??o obter previamente o consentimento expresso de seus respons??veis legais para utiliza????o da plataforma e dos servi??os ou produtos, sendo de responsabilidade exclusiva dos mesmos o eventual acesso por menores de idade e por aqueles que n??o possuem plena capacidade civil sem a pr??via autoriza????o.<br><br> Mediante a realiza????o do cadastro o usu??rio declara e garante expressamente ser plenamente capaz, podendo exercer e usufruir livremente dos servi??os e produtos.<br><br> O usu??rio dever?? fornecer um endere??o de e-mail v??lido, atrav??s do qual o site realizar?? todas as comunica????es necess??rias.<br><br> Ap??s a confirma????o do cadastro, o usu??rio possuir?? um login e uma senha pessoal, a qual assegura ao usu??rio o acesso individual ?? mesma. Desta forma, compete ao usu??rio exclusivamente a manuten????o de referida senha de maneira confidencial e segura, evitando o acesso indevido ??s informa????es pessoais.<br><br> Toda e qualquer atividade realizada com o uso da senha ser?? de responsabilidade do usu??rio, que dever?? informar prontamente a plataforma em caso de uso indevido da respectiva senha.<br><br> N??o ser?? permitido ceder, vender, alugar ou transferir, de qualquer forma, a conta, que ?? pessoal e intransfer??vel.<br><br> Caber?? ao usu??rio assegurar que o seu equipamento seja compat??vel com as caracter??sticas t??cnicas que viabilize a utiliza????o da plataforma e dos servi??os ou produtos.<br><br> O usu??rio poder??, a qualquer tempo, requerer o cancelamento de seu cadastro junto ao site Zoologic. O seu descadastramento ser?? realizado o mais rapidamente poss??vel, desde que n??o sejam verificados d??bitos em aberto.<br><br> O usu??rio, ao aceitar os Termos e Pol??tica de Privacidade, autoriza expressamente a plataforma a coletar, usar, armazenar, tratar, ceder ou utilizar as informa????es derivadas do uso dos servi??os, do site e quaisquer plataformas, incluindo todas as informa????es preenchidas pelo usu??rio no momento em que realizar ou atualizar seu cadastro, al??m de outras expressamente descritas na Pol??tica de Privacidade que dever?? ser autorizada pelo usu??rio.<br><br> 5. Dos pre??os<br><br> A plataforma se reserva no direito de reajustar unilateralmente, a qualquer tempo, os valores dos servi??os ou produtos sem consulta ou anu??ncia pr??via do usu??rio.<br><br> Os valores aplicados s??o aqueles que est??o em vigor no momento do pedido.<br><br> Os pre??os s??o indicados em reais e n??o incluem as taxas de entrega, as quais s??o especificadas ?? parte e s??o informadas ao usu??rio antes da finaliza????o do pedido.<br><br> Na contrata????o de determinado servi??o ou produto, a plataforma poder?? solicitar as informa????es financeiras do usu??rio, como CPF, endere??o de cobran??a e dados de cart??es. Ao inserir referidos dados o usu??rio concorda que sejam cobrados, de acordo com a forma de pagamento que venha a ser escolhida, os pre??os ent??o vigentes e informados quando da contrata????o. Referidos dados financeiros poder??o ser armazenados para facilitar acessos e contrata????es futuras.<br><br>6. Do cancelamento<br><br> O usu??rio poder?? cancelar a contrata????o dos servi??os de acordo com os termos que forem definidos no momento de sua contrata????o. Ainda, o usu??rio tamb??m poder?? cancelar os servi??os em at?? 7 (sete) dias ap??s a contrata????o, mediante contato com o Zoologic, de acordo com o C??digo de Defesa do Consumidor (Lei no. 8.078/90).<br><br> O servi??o poder?? ser cancelado por:<br><br> a) parte do usu??rio: nessas condi????es os servi??os somente cessar??o quando conclu??do o ciclo vigente ao tempo do cancelamento;<br><br> b) viola????o dos Termos de Uso: os servi??os ser??o cessados imediatamente.<br><br> 7. Do suporte<br><br> Em caso de qualquer d??vida, sugest??o ou problema com a utiliza????o da plataforma, o usu??rio poder?? entrar em contato com o suporte, atrav??s do email alencarkauan12@gmail.com.<br><br> Estes servi??os de atendimento ao usu??rio estar??o dispon??veis nos seguintes dias e hor??rios: seg ?? sex das 10h ??s 18h.<br><br> 8. Das responsabilidades<br><br> ?? de responsabilidade do usu??rio:<br><br> a) defeitos ou v??cios t??cnicos originados no pr??prio sistema do usu??rio;<br><br> b) a correta utiliza????o da plataforma, dos servi??os ou produtos oferecidos, prezando pela boa conviv??ncia, pelo respeito e cordialidade entre os usu??rios;<br><br> c) pelo cumprimento e respeito ao conjunto de regras disposto nesse Termo de Condi????es Geral de Uso, na respectiva Pol??tica de Privacidade e na legisla????o nacional e internacional;<br><br> d) pela prote????o aos dados de acesso ?? sua conta/perfil (login e senha).<br><br> ?? de responsabilidade da plataforma Zoologic:<br><br> a) indicar as caracter??sticas do servi??o ou produto;<br><br> b) os defeitos e v??cios encontrados no servi??o ou produto oferecido desde que lhe tenha dado causa;<br><br> c) as informa????es que foram por ele divulgadas, sendo que os coment??rios ou informa????es divulgadas por usu??rios s??o de inteira responsabilidade dos pr??prios usu??rios;<br><br> d) os conte??dos ou atividades il??citas praticadas atrav??s da sua plataforma.<br><br> A plataforma n??o se responsabiliza por links externos contidos em seu sistema que possam redirecionar o usu??rio ao ambiente externo a sua rede.<br><br> N??o poder??o ser inclu??dos links externos ou p??ginas que sirvam para fins comerciais ou publicit??rios ou quaisquer informa????es il??citas, violentas, pol??micas, pornogr??ficas, xenof??bicas, discriminat??rias ou ofensivas.<br><br> 9. Dos direitos autorais<br><br> O presente Termo de Uso concede aos usu??rios uma licen??a n??o exclusiva, n??o transfer??vel e n??o sublicenci??vel, para acessar e fazer uso da plataforma e dos servi??os e produtos por ela disponibilizados.<br><br> A estrutura do site ou aplicativo, as marcas, logotipos, nomes comerciais, layouts, gr??ficos e design de interface, imagens, ilustra????es, fotografias, apresenta????es, v??deos, conte??dos escritos e de som e ??udio, programas de computador, banco de dados, arquivos de transmiss??o e quaisquer outras informa????es e direitos de propriedade intelectual da raz??o social Zoologic, observados os termos da Lei da Propriedade Industrial (Lei n?? 9.279/96), Lei de Direitos Autorais (Lei n?? 9.610/98) e Lei do Software (Lei n?? 9.609/98), est??o devidamente reservados.<br><br> Este Termos de Uso n??o cede ou transfere ao usu??rio qualquer direito, de modo que o acesso n??o gera qualquer direito de propriedade intelectual ao usu??rio, exceto pela licen??a limitada ora concedida.<br><br> O uso da plataforma pelo usu??rio ?? pessoal, individual e intransfer??vel, sendo vedado qualquer uso n??o autorizado, comercial ou n??o-comercial. Tais usos consistir??o em viola????o dos direitos de propriedade intelectual da raz??o social Zoologic, pun??veis nos termos da legisla????o aplic??vel.<br><br> 10. Das san????es<br><br> Sem preju??zo das demais medidas legais cab??veis, a raz??o social Zoologic poder??, a qualquer momento, advertir, suspender ou cancelar a conta do usu??rio:<br><br> a) que violar qualquer dispositivo do presente Termo;<br><br> b) que descumprir os seus deveres de usu??rio;<br><br> c) que tenha qualquer comportamento fraudulento, doloso ou que ofenda a terceiros.<br><br> 11. Da rescis??o<br><br> A n??o observ??ncia das obriga????es pactuadas neste Termo de Uso ou da legisla????o aplic??vel poder??, sem pr??vio aviso, ensejar a imediata rescis??o unilateral por parte da raz??o social Zoologic e o bloqueio de todos os servi??os prestados ao usu??rio.<br><br> 12. Das altera????es<br><br> Os itens descritos no presente instrumento poder??o sofrer altera????es, unilateralmente e a qualquer tempo, por parte de Zoologic, para adequar ou modificar os servi??os, bem como para atender novas exig??ncias legais. As altera????es ser??o veiculadas OU pelo site Zoologic e o usu??rio poder?? optar por aceitar o novo conte??do ou por cancelar o uso dos servi??os, caso seja assinante de algum servi??o.<br><br> Os servi??os oferecidos podem, a qualquer tempo e unilateralmente, e sem qualquer aviso pr??vio, ser deixados de fornecer, alterados em suas caracter??sticas, bem como restringido para o uso ou acesso.<br><br> 13. Da pol??tica de privacidade<br><br> Al??m do presente Termo, o usu??rio dever?? consentir com as disposi????es contidas na respectiva Pol??tica de Privacidade a ser apresentada a todos os interessados dentro da interface da plataforma.<br><br> 14. Do foro<br><br> Para a solu????o de controv??rsias decorrentes do presente instrumento ser?? aplicado integralmente o Direito brasileiro.<br><br> Os eventuais lit??gios dever??o ser apresentados no foro da comarca em que se encontra a sede da empresa.<br><br>
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
					<p>J?? possui uma conta? <a href="./login" class="link-primary">Ir para Login</a></p>
				</div>
				
			</div>
					
			  
			
		</form>


	</div>
</body>
</html>