package com.study.jsp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stduy.jsp.BDao;

public class BReplyCommand implements BCommand {

	public BReplyCommand() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)

	{
		String bId = request.getParameter("bId");

		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String bGroup = request.getParameter("bGroup");
		String bStep = request.getParameter("bStep");
		String bIndent = request.getParameter("bIndent");

		BDao dao = BDao.getInstance();
		dao.reply(bId, bName, bTitle, bContent, bGroup, bStep, bIndent);

	}

}
