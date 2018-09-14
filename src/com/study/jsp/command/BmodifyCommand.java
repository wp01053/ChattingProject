package com.study.jsp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stduy.jsp.BDao;

public class BmodifyCommand implements BCommand {

	public BmodifyCommand() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)

	{
		String bId = request.getParameter("bId");

		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");

		BDao dao = BDao.getInstance();
		dao.modify(bId, bName, bTitle, bContent);

	}

}
