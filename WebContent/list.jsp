<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if (session.getAttribute("ValidMem") == null) {
%>

<jsp:forward page="login.jsp" />
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
<title>List</title>
<!--
    Template 2105 Input
	http://www.tooplate.com/view/2105-input
	-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/materialize.min.css">
<link rel="stylesheet" href="css/tooplate.css">
<style>
#container {
	
}
</style>
<!-- 
<script>
	function test_key() {
		searchCheck(form);
	}
</script>
<body onkeydown="javascript:if(event.keyCode==13){test_key();}">
 -->
</head>

<body id="survey" class="font-weight-light">


	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<header class="mt-5 mb-5 text-center">
			<h1 class="font-weight-light tm-form-title">
				<a href="main.jsp">Board List</a><br />

			</h1>
			ID :<%=name%>
		</header>
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>조회</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.bId}</td>
				<td>${dto.bName}</td>
				<td><c:forEach begin="1" end="${dto.bIndent}">-</c:forEach> <a
					href="content_view.do?bId=${dto.bId}">${dto.bTitle}</a></td>
				<td>${dto.bDate}</td>
				<td>${dto.bHit}</td>
					
				
			</tr>
		</c:forEach>
	</table>
	<div class="col-xl-12 text-center">
		<tr>

			<td colspan="5">
				<!-- 처음 --> <c:choose>
					<c:when test="${(page.curPage - 1) <1 }">
               [ &lt;&lt; ]
            </c:when>
					<c:otherwise>
						<a href="list.do?option=${option }&search=${search }&page=1">[ &lt;&lt; ] </a>
					</c:otherwise>
				</c:choose> <!-- 이전 --> <c:choose>
					<c:when test="${(page.curPage-1) < 1 }">
               [ &lt; ]
            </c:when>
					<c:otherwise>
						<a href="list.do?option=${option }&search=${search }&page=${page.curPage - 1}">[ &lt; ] </a>
					</c:otherwise>
				</c:choose> <!--  개별 페이지  --> <c:forEach var="fEach" begin="${page.startPage}"
					end="${page.endPage}" step="1">
					<c:choose>
						<c:when test="${page.curPage == fEach }">
               [${fEach}]&nbsp;
            </c:when>
						<c:otherwise>
							<a href="list.do?option=${option }&search=${search }&page=${fEach }">[ ${fEach } ]</a> &nbsp;
            </c:otherwise>
					</c:choose>
				</c:forEach> <!-- 다음 --> <c:choose>
					<c:when test="${(page.curPage + 1 ) > page.totalPage }">
               [ &gt; ]
            </c:when>
					<c:otherwise>
						<a href="list.do?option=${option }&search=${search }&page=${page.curPage + 1}">[ &gt; ]</a>
					</c:otherwise>
				</c:choose> <!-- 끝 --> <c:choose>
					<c:when test="${page.curPage == page.totalPage }">
               [ &gt;&gt; ]
            </c:when>
					<c:otherwise>
						<a href="list.do?option=${option }&search=${search }&page=${page.totalPage }">[ &gt;&gt; ]</a>
					</c:otherwise>
				</c:choose>

			</td>
		</tr>
	</div>
	<br />

	<center>
		<div>
			<a href="write_view.do">글작성</a>
			<div
				class="form-group col-xl-6 col-lg-6 col-md-6 col-12 pr-0 tm-form-group-2-col">


				<div class="tm-bg-black tm-form-block">
					<div class="row mb-4">
						<form action=list.do method="post">

							<div class="input-field">
								<select name="option" id="option">
									<option value="1">제목</option>
									<option value="2">내용</option>
									<option value="3">작성자</option>

								</select> <input name="search" type="text"
									class="validate tm-input-white-bg" placeholder="search"">
								<button type="submit">검색</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		</div>
	</center>

	</div>

	<footer class="row tm-mt-big mb-3">
		<div class="col-xl-12 text-center">
			<p class="d-inline-block tm-bg-black white-text py-2 tm-px-5">
				Copyright &copy; 2018 JJY</p>
		</div>
	</footer>
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/materialize.min.js"></script>
	<script>
		$(document).ready(function() {
			$('select').formSelect();
		});
	</script>

</body>
</html>








<!-- total count   = 및 여러가지 정보들 
	totalCount : ${page.totalCount }
	<br> listCount : ${page.listCount }
	<br> totalPage : ${page.totalPage }
	<br> curPage : ${page.curPage }
	<br> pageCount : ${page.pageCount }
	<br> startPage : ${page.startPage }
	<br> endPage : ${page.endPage }
	<br>
	-->