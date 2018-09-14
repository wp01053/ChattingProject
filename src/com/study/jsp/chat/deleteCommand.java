package com.study.jsp.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteCommand implements CService {

	public deleteCommand() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("방삭제?");
		String CNUM = request.getParameter("CNUM");
		System.out.println("11");

		String msg = request.getParameter("CNUM");

		CDao dao = CDao.getInstance();

		dao.delete(CNUM);
		System.out.println("2222222333333333333");

	}

}
