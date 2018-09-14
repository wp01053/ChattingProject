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
<script>
	function onDownload(bId) {

		var o = document.getElementById("ifrm_filedown");
		alert(o);
		o.src = "download.do?bId=" + bId;

	}
	function cmDeleteOpen(bId){
		 var msg = prompt("글을 삭제하시겠습니까 ? 비밀번호를 입력해 주세요")
		alert("설정한 비밀번호 "+'${content_view.password}');
		 alert("입력한 비밀번호 : " + msg);
		if(msg == '${content_view.password}'){
			alert("삭제완료")
			document.location="delete.do?bId=" + bId;
			
			}else if (msg != '${content_view.password}'){
				alert("비밀번호가 일치하지 않습니다.")
			}
		 
		else{
			return false;

		}
	}
	function cmModifyOpen(bId){
		 var msg2 = prompt("글을 수정하려면 비밀번호를 입력하세요.")
		alert("설정한 비밀번호 "+'${content_view.password}');
		 alert("입력한 비밀번호 : " + msg2);
		if(msg2 == '${content_view.password}'){
			
			document.location="modify_view.do?bId=" + bId;
			alert("수정완료")
			}else if (msg != '${content_view.password}'){
				alert("비밀번호가 일치하지 않습니다.")
			}
		 
		else{
			return false;

		}
	}
	
	
</script>

<iframe id="ifrm_filedown"
	style="position: absolute; z-index: 1; visibility: hidden;"></iframe>

</head>
<body id="survey" class="font-weight-light">
	<iframe id="ifrm_filedown"
		style="position: absolute; z-index: 1; visibility: hidden;"></iframe>

	<div class="container tm-container-max-800">
		<div class="row">
			<div class="col-12">
				<header class="mt-5 mb-5 text-center">
					<h1 class="font-weight-light tm-form-title">Board-Content</h1>
				</header>
				<form action="" method="post">
					<div class="tm-bg-black tm-form-block">
						<div class="row mb-4">

							<div class="col-xl-6">
								<p>번호</p>
								<div class="input-field">
									<tr>
										<td>- ${content_view.bId}</td>
									</tr>
								</div>

								<p>조회수</p>
								<div class="input-field">
									<tr>
										<td>- ${content_view.bHit}</td>
									</tr>
								</div>

								<p>이름</p>
								<div class="input-field">
									<tr>
										<td>- ${content_view.bName }</td>
									</tr>
								</div>

								<p>제목</p>
								<div class="input-field">
									<tr>
										<td>- ${content_view.bTitle }</td>
									</tr>
								</div>
								<p>첨부 파일</p>
								<div class="input-field">
									<tr>
										<td>- <a href="#"
											onclick="onDownload('${content_view.bId}')">${content_view.filename}</a>
										</td>
										<img src="upload/${content_view.filename}"
											, accept=".bmp,.gif,.jpg">


									</tr>
								</div>

								<p>내용</p>
							</div>
						</div>

						<div class="row">
							<div class="col-xl-12">
								<textarea class="p-3" id="message" cols="30" rows="3">${content_view.bContent}</textarea>
							</div>
						</div>
						<br />

						<tr>
							<table border="1">
								<a href="#" onclick="cmModifyOpen(${content_view.bId})">수정</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								<a href="list.do?page=<%=session.getAttribute("cpage")%>">목록보기</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								<a href="#" onclick="cmDeleteOpen(${content_view.bId})">삭제</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								<a href="reply_view.do?bId=${content_view.bId}">답변</a>
								</td>
								</tr>
								</div>
								</form>
								<footer class="row tm-mt-big mb-3">
									<div class="col-xl-12 text-center">
										<p class="d-inline-block tm-bg-black white-text py-2 tm-px-5">
											Copyright &copy; 2018 JJY</p>
									</div>
								</footer>
							</table>
					</div>
			</div>
		</div>
</body>
</html>