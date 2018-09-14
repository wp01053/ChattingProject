package com.study.jsp.command;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stduy.jsp.BDao;
import com.stduy.jsp.BDto;

public class BDownloadCommand implements BCommand {

	@Override

	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String bId = request.getParameter("bId");
		System.out.println(request.getParameter("bId"));
		BDto content_view = BDao.getInstance().contentView(bId);

		String filename = content_view.getFilename();

		System.out.println("2222");

		String uploadFileName = request.getRealPath("/upload") + "/" + filename;
		System.out.println("3333");
		File downFile = new File(uploadFileName);
		System.out.println("22444422");
		if (downFile.exists() && downFile.isFile()) // 다운로드

		{

			try

			{

				long filesize = downFile.length();

				response.setContentType("application/x-msdownload");

				response.setContentLength((int) filesize);

				String strClient = request.getHeader("user-agent");

				if (strClient.indexOf("MSIE 5.5") != -1)

				{

					response.setHeader("Content-Disposition", "filename=" + filename + ";");

				}

				else

				{

					filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");

					// 인코딩 변경과 '+'문자 깨짐 방지 2013 06 10 - 한송이님 감사합니다^^

					response.setHeader("Content-Disposition", "attachment; filename=" + filename + ";");

				}

				response.setHeader("Content-Length", String.valueOf(filesize));

				response.setHeader("Content-Transfer-Encoding", "binary;");

				response.setHeader("Pragma", "no-cache");

				response.setHeader("Cache-Control", "private");

				byte b[] = new byte[1024];

				BufferedInputStream fin = new BufferedInputStream(new FileInputStream(downFile));

				BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());

				int read = 0;

				while ((read = fin.read(b)) != -1)

				{

					outs.write(b, 0, read);

				}

				outs.flush();

				outs.close();

				fin.close();

			} catch (Exception e)

			{

				System.out.println("Download Exception : " + e.getMessage());

			}

		} else

		{

			System.out.println("Download Error : downFile Error [" + downFile + "]");

		}

		return;

	}

}
