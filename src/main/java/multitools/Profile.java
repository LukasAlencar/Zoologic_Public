package multitools;


import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.Gson;

import model.Usuario;

public class Profile {
	private int idUsuario 		= 0;
	private String nome			="";
	private String email		="";
	private String msg			="";
	private String senha        ="";
	private String telefone     ="";
	private String caminho      ="";
	private int ingresso	    = 0;
	private boolean success		=false;
	private int googleUser		= 0;
	
	public Profile(){
		
	}
	
	public Profile(int id) {
		
		ResultSet rSet = new Usuario().select(" idUsuario ='"+id+"'");
		try {
			if(rSet.next()){
				this.setIdUsuario( rSet.getInt("idUsuario") );
				this.setNome(rSet.getString("nome"));
				this.setEmail(rSet.getString("email"));
				this.setSenha(rSet.getString("senha"));
				this.setTelefone(rSet.getString("telefone"));
				this.setCaminho(rSet.getString("foto"));
				this.setIngresso( rSet.getInt("idIngresso") );
				this.setGoogleUser(rSet.getInt("googleUser"));
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

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCaminho() {
		return caminho;
	}

	public void setCaminho(String caminho) {
		this.caminho = caminho;
	}

	public int getIngresso() {
		return ingresso;
	}

	public void setIngresso(int ingresso) {
		this.ingresso = ingresso;
	}

	public int getGoogleUser() {
		return googleUser;
	}

	public void setGoogleUser(int googleUser) {
		this.googleUser = googleUser;
	}
	
}
