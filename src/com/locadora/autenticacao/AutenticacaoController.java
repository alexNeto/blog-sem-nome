package com.locadora.autenticacao;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.locadora.usuario.Usuario;

@WebServlet("/autenticacao")
public class AutenticacaoController extends HttpServlet {

	/**
	* 
	*/
	private static final long serialVersionUID = -4293549827107647532L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nomeUsuario = request.getParameter("nomeUsuario");
		String senha = request.getParameter("senha");
		Map<String, String> messages = new HashMap<String, String>();

		if (nomeUsuario == null || nomeUsuario.isEmpty()) {
			messages.put("username", "Please enter username");
		}

		if (senha == null || senha.isEmpty()) {
			messages.put("password", "Please enter password");
		}

		if (messages.isEmpty()) {
//			Usuario usuario = usuarioService.find(nomeUsuario, senha);

			if (usuario != null) {
				request.getSession().setAttribute("usuario", usuario);
				response.sendRedirect(request.getContextPath() + "/home");
				return;
			} else {
				messages.put("login", "Unknown login, please try again");
			}
		}

		request.setAttribute("messages", messages);
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

}