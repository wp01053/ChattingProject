<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1"
		align="left">
		<header class="mt-5 mb-5 text-center">
			<h1 class="font-weight-light tm-form-title">
			
			</h1>

		</header>
		<tr>
			<td>번호</td>

		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.bid}</td>
			</tr>
		</c:forEach>
	</table>



</body>
</html>