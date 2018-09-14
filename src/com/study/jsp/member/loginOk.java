package com.study.jsp.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginOk implements Service {

   public loginOk() {
   }

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException
   
   {
      
      request.setCharacterEncoding("UTF-8");

      String id = request.getParameter("id");
      String pw = request.getParameter("pw");

      response.setContentType("text/html; charset=UTF-8");
      PrintWriter writer = response.getWriter();

      MemberDao dao = MemberDao.getInstance();
      int checkNum = dao.userCheck(id, pw);
      if (checkNum == -1) {
 response.setContentType("text/html; charset=UTF-8");
    	  
    	  PrintWriter out = response.getWriter();
    	  out.println("<script>alert('아이디가 존재하지 않습니다.!'); location.href='login.jsp';</script>");
    	  out.flush();
      } else if (checkNum == 0) {
         // html 출력
       	  
    	  PrintWriter out = response.getWriter();
    	  out.println("<script>alert('비밀번호가 틀립니다.!'); location.href='login.jsp';</script>");
    	  out.flush();

      } else if (checkNum == 1) {
         MemberDTO dto = dao.getMember(id);
         // html 출력
         if (dto == null) {
          	  
       	  PrintWriter out = response.getWriter();
       	  out.println("<script>alert('존재하는 회원이 아닙니다.!'); location.href='login.jsp';</script>");
       	  out.flush();

            // html 출력
         } else {

            HttpSession session = request.getSession();
            String name = dto.getName();

            session.setAttribute("id", id);
            session.setAttribute("name", name);
            session.setAttribute("ValidMem", "yes");

            response.sendRedirect("main.jsp");
         }
      }
   }

}