package com.study.jsp.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class chattCommand implements CService {

	public chattCommand() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		//기억핮... cdao 에서 값 insert 할때 미리 지정된 값은 varchar2형이면 
		// ' ' 붙여주고 excute 에서도 지워줘야함 ... 제발
		String m_count = request.getParameter("m_count");
		String r1 = request.getParameter("r1");
		String bId = (String) session.getAttribute("id");
		String password = request.getParameter("password");

	
		System.out.println(m_count);
		System.out.println(r1);
		System.out.println(bId);
		System.out.println(password);

		CDao dao = CDao.getInstance();
		dao.chatt( m_count, r1, bId, password);

	}

}
