package com.study.jsp.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BLoginCommand implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String name = request.getParameter("name");

		HttpSession session = null;
		session = request.getSession();

		session.setAttribute("name", name);

		session.setAttribute("ValidMem", "yes");

	}

}
