package com.study.jsp.chat;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class clistCommand implements CService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

//		String rname = request.getParameter("rname");
//		System.out.println("rname : " + rname);
//		
		CDao dao = new CDao();
		
		ArrayList<CDto> dtos = dao.list();

		request.setAttribute("list", dtos);

	}

}
