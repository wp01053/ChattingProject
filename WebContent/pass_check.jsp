<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function compare() {
		//DB에 저장되어있는 비밀번호?
		if (document.passForm.password.value == '${content_view.password }') {//현재 폼에 입력된 비밀번호
			opener.pass_confirm();

		} else {
			alert('${content_view.bId}');
			alert(document.passForm.password.value);
			alert("비밀번호가 일치하지 않습니다");
		}

	}
</script>
</head>
<%-- pass_check.jsp --%>
<body>
	<center>
		<form name="passForm">
			<table>
				<tr>
					<td bgcolor="#99ccff">비밀번호</td>
					<td><input type="password" name="password" size="10"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="확인"
						onclick="compare()"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>