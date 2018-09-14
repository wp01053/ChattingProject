package com.study.jsp.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.me")
public class FrontCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontCon() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");
		actiondo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost");
		actiondo(request, response);
	}

	private void actiondo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String viewPage = null;
		System.out.println("actionDo");
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);

		String conPath = request.getContextPath();
		System.out.println("conPath : " + conPath);

		String command = uri.substring(conPath.length());
		System.out.println("command : " + command);

		if (command.equals("/loginOk.me")) {
			Service service = new loginOk();

			service.execute(request, response);
			System.out.println("--------------");
		}

		else if (command.equals("/modifyOk.me")) {
			Service service = new modifyOk();
			service.execute(request, response);
			System.out.println("--------------");

		}

		else if (command.equals("/joinOk.me")) {
			Service service = new joinOk();
			service.execute(request, response);
			System.out.println("--------------");

		} else if (command.equals("/glogin.me")) {
			Service service = new BLoginCommand();
			service.execute(request, response);
			response.sendRedirect("main.jsp");
		} else if (command.equals("/logout.me")) {
			System.out.println("11111111111");

			logout(request, response);

			System.out.println("--------------");

		}

	}

	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("222222222");

		HttpSession session = request.getSession();

		session.invalidate();
		response.sendRedirect("login.jsp");
	}

}
