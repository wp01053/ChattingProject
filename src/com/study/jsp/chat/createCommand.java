package com.study.jsp.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class createCommand implements CService {

	public createCommand() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

//		rname + "&m_count=" + m_count + "&r1=" + r1;
		HttpSession session = request.getSession();
		String rname = request.getParameter("rname");
		String m_count = request.getParameter("m_count");
		String r1 = request.getParameter("r1");
		String bId = (String) session.getAttribute("id");
		String password = request.getParameter("password");

		System.out.println(rname);
		System.out.println(m_count);
		System.out.println(r1);
		System.out.println(bId);
		System.out.println(password);

		CDao dao = CDao.getInstance();
		dao.create(rname, m_count, r1, bId, password);

	}

}
