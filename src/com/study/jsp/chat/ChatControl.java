package com.study.jsp.chat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChatControl
 */
@WebServlet("*.ch")
public class ChatControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChatControl() {
		super();
		// TODO Auto-generated constructor stub
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
		request.setCharacterEncoding("UTF-8");

		String viewPage = null;
		System.out.println("actionDo");
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);

		String conPath = request.getContextPath();
		System.out.println("conPath : " + conPath);

		String command = uri.substring(conPath.length());
		System.out.println("command : " + command);

		if (command.equals("/create.ch")) {
			System.out.println("--------------");

			CService service = new createCommand();
			service.execute(request, response);
			viewPage = "clist.ch";

		} else if (command.equals("/chatt.ch")) {
			CService service = new chattCommand();
			service.execute(request, response);
			viewPage = "clist.ch";
			System.out.println("--------------");

		}
	

		else if (command.equals("/clist.ch")) {
			CService service = new clistCommand();
			service.execute(request, response);
			viewPage = "broadcast.jsp";
			System.out.println("--------------");

		}

		else if (command.equals("/roomin.ch")) {

			System.out.println("--------------");
			CService service = new roominCommand();

			service.execute(request, response);
			viewPage = "clist.ch";
			System.out.println("--------------");
		} else if (command.equals("/delete.ch")) {
			System.out.println("--------------");
			CService service = new deleteCommand();
			service.execute(request, response);
			viewPage = "clist.ch";
			System.out.println("--------------");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

	}
}
