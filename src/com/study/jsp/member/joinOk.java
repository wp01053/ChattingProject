package com.study.jsp.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class joinOk implements Service {

   public joinOk() {
   }

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException

   {
      System.out.println("joinOk");
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter writer = response.getWriter();
      HttpSession session = request.getSession();

      String id = (String) session.getAttribute("id");

      MemberDao dao = MemberDao.getInstance();
      MemberDTO dto = new MemberDTO();

      dto.setId(request.getParameter("id"));
      dto.setPw(request.getParameter("pw"));
      dto.setName(request.getParameter("name"));
      dto.seteMail(request.getParameter("eMail"));
      dto.setAddress(request.getParameter("address"));

      dto.setrDate(new Timestamp(System.currentTimeMillis()));

      if (dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXISTENT) {
    	  response.setContentType("text/html; charset=UTF-8");
    	  
    	  PrintWriter out = response.getWriter();
    	   
    	  out.println("<script>alert('아이디가 이미 존재합니다.'); location.href='join.jsp';</script>");
    	   
    	  out.flush();


      } else {
         int ri = dao.insertMember(dto);
         if (ri == MemberDao.MEMBER_JOIN_SUCCESS) {
           
          response.setContentType("text/html; charset=UTF-8");
       	  
       	  PrintWriter out = response.getWriter();
       	   
       	  out.println("<script>alert('회원가입 완료 로그인을 해주세요'); location.href='login.jsp';</script>");
       	   
       	  out.flush();

         } else {
            writer.println("회원가입에 실패했습니다");
            writer.close();
         }
      }
   }

}