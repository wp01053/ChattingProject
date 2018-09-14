<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Survey Questionnaire Form by Tooplate</title>
<!--
    Template 2105 Input
	http://www.tooplate.com/view/2105-input
	-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/materialize.min.css">
<link rel="stylesheet" href="css/tooplate.css">
</head>
<script>
	function form_check() {
		document.modify_form.submit();
	}
</script>
<body id="survey" class="font-weight-light">
	<div class="container tm-container-max-800">
		<div class="row">
			<div class="col-12">
				<header class="mt-5 mb-5 text-center">
					<h1 class="font-weight-light tm-form-title">
						<a href="main.jsp">Modify
					</h1>
				</header>
				<form name="modify_form" action="modify.do" method="post">
					<div class="tm-bg-black tm-form-block">
						<div class="row mb-4">
							<input type="hidden" name="bId" value="${content_view.bId}">
							<div class="col-xl-6">
								<p>번호</p>
								<div class="input-field">
									<tr>
										<td>- ${content_view.bId}</td>
									</tr>
								</div>
							</div>
							<div class="col-xl-6">
								<p>조회수</p>
								<div class="input-field">
									<tr>
										<td>- ${content_view.bHit}</td>
									</tr>
								</div>
							</div>

							<div class="col-xl-6">

								<tr>
									<td>이름</td>
									<td><input type="text" name="bName"
										value="${content_view.bName }"></td>
								</tr>
							</div>
							<div class="col-xl-6">
								<tr>
									<td>제목</td>
									<td><input type="text" name="bTitle"
										value="${content_view.bTitle }"></td>
								</tr>
							</div>
							<div class="col-xl-6">
								<tr>
									<td>내용</td>
									<td><input type="text" name="bContent"
										value="${content_view.bContent }"></td>
									<br />
								</tr>
							</div>
							<br />
							<div class="col-xl-6">
								<tr>
									<td colspan="2"><a href="javascript:form_check();">수정
											완료</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
										<a href="content_view.do?bId=${content_view.bId }">취소</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
										<a href="list.do?page=<%=session.getAttribute("cpage")%>">목록보기</a>&nbsp;</td>
								</tr>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>



</body>
</html>