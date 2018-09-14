<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	if (session.getAttribute("ValidMem") == null) {
%>


<%
	}
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Reply_View</title>
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

<body id="survey" class="font-weight-light">
	<!-- 배경 -->
	<div class="container tm-container-max-800">
		<!-- body 크기 -->
		<div class="row">
			<div class="col-12">
				<header class="mt-5 mb-5 text-center">
					<h1 class="font-weight-light tm-form-title">
						<a href="index.html">Reply_View</a>
					</h1>
					<p>답변을 작성해 주세요.</p>
				</header>


				<form action="reply.do" method="post">

					<div class="row mb-4">
						<div class="col-xl-6">
							<input type="hidden" name="bId"
								class="validate tm-input-white-bg" value="${reply_view.bId}">
							<input type="hidden" name="bGroup" value="${reply_view.bGroup}">
							<input type="hidden" name="bStep" value="${reply_view.bStep}">
							<input type="hidden" name="bIndent" value="${reply_view.bIndent}">
						</div>
					</div>



					<form action="" method="post">
						<div class="tm-bg-black tm-form-block">
							<div class="row mb-4">
								<div class="col-xl-6">
									<label for="bName" class="white-text mb-4 big">번호</label> <input
										value="${reply_view.bId}" class="validate tm-input-white-bg">
								</div>

								<div class="col-xl-6">
									<label for="bName" class="white-text mb-4 big">조회수</label> <input
										value="${reply_view.bHit}" class="validate tm-input-white-bg">
								</div>

								<div class="col-xl-6">
									<label for="bName" class="white-text mb-4 big">작성자</label> <input
										name="bName" type="text" class="validate tm-input-white-bg" value= <%=name%>>
								</div>

								<div class="col-xl-6">
									<label for="bTitle" class="white-text mb-4 big">제목</label> <input
										name="bTitle" type="text" class="validate tm-input-white-bg"
										value="${reply_view.bTitle } RE ▶">
								</div>


								<div class="col-xl-6">
									<div class="form-group">
										<label for="bName" class="white-text mb-4 big">원문 내용</label> <input
											value="${reply_view.bContent}"
											class="validate tm-input-white-bg">
									</div>

									<div class="form-group">
										<message for="bContent" class="white-text mb-4 big">내용</label>
										<br>
										<textarea class="p-3" name="bContent" id="editor1" cols="80"
											rows="4"></textarea>
									</div>

									<div class="text-center mt-5">
										<button type="submit"
											class="waves-effect btn-large btn-large-white">답변</button>

									</div>
									<div class="text-center mt-5">
										<a href="list.do"><input type="button"
											class="waves-effect btn-large btn-large-white" value="목록 보기">
										</a>
									</div>
								</div>
							</div>
					</form>
				</form>

			</div>
		</div>
		<footer class="row tm-mt-big mb-3">
			<div class="col-xl-12 text-center">
				<p class="d-inline-block tm-bg-black white-text py-2 tm-px-5">
					Copyright &copy; 2018 JJY</p>
			</div>
		</footer>
	</div>

	</form>
</body>
</html>




<!--  
	<table cellpadding="0" cellspacing="0" border="1">
		<form action="write.do" method="post">

		
				<td colspan="6">MVC 게시판 - 글쓰기</td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">글쓴이</div>
				</td>
				<td><input type="text" name="bName" size="50"></td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">제목</div>
				</td>
				<td><input type="text" name="bTitle" size="50"></td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">내용</div>
				</td>
				<td><textarea name="bContent" id="editor1" rows="10" cols="80">
                This is my textarea to be replaced with CKEditor.
               </textarea> <script>
																// Replace the <textarea id="editor1"> with a CKEditor
																// instance, using default configuration.
																CKEDITOR
																		.replace('editor1');
															</script></td>

			</tr>
			<tr>
				<td>
					<div align="center">파일 첨부</div>
				</td>
				<td><input name="BOARD_FILE" type="file" /></td>
			</tr>
			<tr>

				<td colspan="2">
					<div align="center">

						<input type="submit" value="입력">&nbsp;&nbsp; <a
							href="list.do"> <input type="submit" value=" 리스트 "></a>
				</td>
				</div>
			</tr>


		</form>

	</table>
	-->