package com.study.jsp.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class roominCommand implements CService {

	public roominCommand() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("roomincommand 창 들어왔ㄸ음");
		HttpSession session = request.getSession();
		

		String CNUM = request.getParameter("CNUM");
		session.setAttribute("CNUM", CNUM);
		request.setAttribute("CNUM", CNUM);

	}

}
