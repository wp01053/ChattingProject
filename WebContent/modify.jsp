<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.study.jsp.member.MemberDTO"%>
<%@page import="com.study.jsp.member.MemberDao"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String id = (String) session.getAttribute("id");
	MemberDao dao = MemberDao.getInstance();
	MemberDTO dto = dao.getMember(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javaScript" src="member.js"></script>
</head>
<body>
	<form action="modifyOk.me" method="get" name="reg_frm">
		아이디 :<%=dto.getId()%>
		비밀번호 : <input tpye="password" name="pw" size="20"><br>
		비밀번호 확인 : <input type="password" name="pw_check" size="20"><br>
		이름 :<%=dto.getName()%><br> 
		메일 : <input type="text" name="eMail" size="20" value="<%=dto.geteMail()%>"><br> 
		
		주소 : <input type="text" name="address" size="50" value="<%=dto.getAddress()%>"><br>
		<input type="button" value="수정" onclick="updateInfoConfirm();">&nbsp;&nbsp;&nbsp;
		<input type="reset" value="취소" onclick="javascript:window.location='main.jsp'">
	</form>


</body>
</html>