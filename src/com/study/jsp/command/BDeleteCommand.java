package com.study.jsp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stduy.jsp.BDao;

public class BDeleteCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bId = request.getParameter("bId");
		System.out.println("11");
		
		String msg = request.getParameter("msg");
		
		BDao dao = BDao.getInstance();
		
		dao.delete(bId);
	}

}