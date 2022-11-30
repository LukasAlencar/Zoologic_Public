package multitools;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.Gson;

import model.Usuario;

public class Login {
	private int idUsuario 		= 0;
	private int idNivelUsuario	= 0;
	private String nome			="";
	private String email		="";
	private String msg			="";
	private boolean success		=false;
	
	public Login() {
	
	}
	
	public Login(String email, String senha ) {

		Sanitize sanitize = new Sanitize();
		email = sanitize.mysqlScapeString(email);
		senha = sanitize.mysqlScapeString(senha);
		
		
		ResultSet rSet = new Usuario().select(" email ='"+email+"' AND senha='"+senha+"' ");
		try {
			if(rSet.next()){
				this.setIdUsuario( rSet.getInt("idUsuario") );
				this.setNome(rSet.getString("nome"));
				this.setEmail(rSet.getString("email"));
				this.setIdNivelUsuario( rSet.getInt("idNivelUsuario") );
				this.setSuccess(true);
				this.setMsg("Login Realizado com Sucesso!");				
			}else {
				this.setSuccess(false);
				this.setMsg("Email ou Senha Incorretos!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String toJson() {
		Gson gson = new Gson();
		return( gson.toJson( this , this.getClass())) ;
	}
	
	
	
	public boolean getSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public int getIdNivelUsuario() {
		return idNivelUsuario;
	}

	public void setIdNivelUsuario(int idNivelUsuario) {
		this.idNivelUsuario = idNivelUsuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}