package com.study.jsp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stduy.jsp.BDao;
import com.stduy.jsp.BDto;

public class BReplyViewCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bId = request.getParameter("bId");
		BDao dao = BDao.getInstance();
		BDto dto = dao.reply_view(bId);
		request.setAttribute("reply_view", dto);
	}

}