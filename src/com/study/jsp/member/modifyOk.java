package com.study.jsp.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class modifyOk implements Service {

   public modifyOk() {
   }

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException 
   
   {
      request.setCharacterEncoding("UTF-8");
      HttpSession session = request.getSession();

      response.setContentType("text/html; charset=UTF-8");
      PrintWriter writer = response.getWriter();
      String id = (String) session.getAttribute("id");

      MemberDao dao = MemberDao.getInstance();
      MemberDTO dto = new MemberDTO();

      dto.setId(request.getParameter("id"));
      dto.setPw(request.getParameter("pw"));
      dto.setName(request.getParameter("name"));
      dto.seteMail(request.getParameter("eMail"));
      dto.setAddress(request.getParameter("address"));

      dto.setId(id);
      int ri = dao.updateMember(dto);

      if (ri == 1) {
       	  
    	  PrintWriter out = response.getWriter();
    	  out.println("<script>alert('정보수정 완료'); location.href='.jsp';</script>");
    	  out.flush();
         writer.println("정보수정 완료.");
         response.sendRedirect("main.jsp");
         writer.close();

      } else {
         writer.println("정보수정 실패.");
         System.out.println("modifyOk");
         writer.close();

      }

      
   }

}