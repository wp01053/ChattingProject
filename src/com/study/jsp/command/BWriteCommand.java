package com.study.jsp.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.stduy.jsp.BDao;

public class BWriteCommand implements BCommand {

	public BWriteCommand() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)

	{

		MultipartRequest multi = null;

		int sizeLimit = 10 * 1024 * 1024; // 10메가입니다.

		String savePath = request.getRealPath("/upload"); // 파일이 업로드될 실제 tomcat 폴더의 WebContent 기준

		try {
			request.setCharacterEncoding("UTF-8");

			multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

			String bName = multi.getParameter("bName");

			String bTitle = multi.getParameter("bTitle");
			String bContent = multi.getParameter("bContent");
			String filename = multi.getFilesystemName("filename");
			String password =  multi.getParameter("password");

			int count = 0;

			BDao dao = BDao.getInstance();
			dao.write(bName, bTitle, bContent, filename, password);
		} catch (Exception e) {

			e.printStackTrace();

		}

	}

}
