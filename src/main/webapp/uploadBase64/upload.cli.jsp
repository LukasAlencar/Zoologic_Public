<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exemplo de Upload</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
	$(document).ready(function() {
		$("#imgPreview").click(function() {
			$("#inputFile").trigger('click');
		});
		
		$("#inputFile").change(function (event) {
			var file = event.target.files[0];
			var reader = new FileReader();
			reader.readAsDataURL( file );
			reader.onload = function () {
				var imgBase64 = reader.result;
				console.log(imgBase64);
				$("#imgPreview").attr("src",imgBase64);
				$("#foto").val(imgBase64);
				uploadFile();
			};
			reader.onerror = function ( error ) {
				console.log('Error: ', error);
			};
		});
		
  	});
	
	function uploadFile() {
		var frmData = $("#frmUpload").serialize();
		alert(frmData);
		$.ajax({
			url: "upload.srv.jsp",
			data: frmData,
			type: "POST",
			success: function( data ) {
				debugger;
				$("#msg").html( "Retornou:" + data );
			}
		});
	}
  </script>
  <style type="text/css">
  	#imgPreview{
  		background-color: gray;
  	
  	}
  
  </style>
</head>
<body>
	<img id="imgPreview" alt="Carregar Imagem" src="">
	<form id="frmUpload">	
		<input type="hidden" id="foto" name="foto" value="">
	</form>
	<input type="button" id="btnEnviar" value="Enviar Arquivo">
	<input type="file" id="inputFile" name="inputFile" style="display: none;"><br>
	<div id="msg"> </div>
</body>
</html>


<%






%>