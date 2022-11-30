package model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import multitools.Login;



@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String email = req.getParameter("email");
		String senha = req.getParameter("sub");
		int result;
		PrintWriter out = resp.getWriter();
		
		Login usu = new Login(email, senha);
		loginModel login = new loginModel();
		String res = login.login(email, senha);
		int id = usu.getIdUsuario();
		if(res == "Login Sucessful"){
			result = 1;
			HttpSession session = req.getSession();
			session.setAttribute("senha", senha);
			session.setAttribute("id", id);
		}else {
			result = 0;
			HttpSession session = req.getSession();
			session.setAttribute("senha", null);
		}
		out.print(result);
		out.flush();
		
    }
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		int result;
		PrintWriter out = response.getWriter();
		
		Login usu = new Login(email, senha);
		loginModel login = new loginModel();
		String res = login.login(email, senha);
		int id = usu.getIdUsuario();
		if(res == "Login Sucessful"){
			result = 1;
			HttpSession session = request.getSession();
			session.setAttribute("senha", senha);
			session.setAttribute("id", id);
		}else {
			result = 0;
			HttpSession session = request.getSession();
			session.setAttribute("senha", null);
		}
		out.print(result);
		out.flush();
	}

}
