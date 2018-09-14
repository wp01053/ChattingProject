<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("ValidMem") == null) {
%>

<jsp:forward page="login.jsp" />
<%
	}
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Main page</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="369242850987-m3opbslgq2elmfvs793i5asofk6adm0d.apps.googleusercontent.com">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/materialize.min.css">
<link rel="stylesheet" href="css/tooplate.css">
<script>
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		alert("로그아웃 성공 ");
		auth2.signOut().then(function() {

		});
		document.location.href = "logout.me";
	}
	function onLoad() {
		gapi.load('auth2', function() {
			gapi.auth2.init();
		});
	}
</script>

</head>

<body id="home">


	<div class="container tm-home-mt tm-home-container">
		<div class="row">
			<div class="col-12">
				<div class="tm-home-left">
					<h1 class="tm-site-title">Web Project</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
				<div class="tm-home-left mt-3 font-weight-light">
					<p class="tm-mb-35">
					<form action="logout.me" method="post">
						<%=name%>님 안녕하세요.<br /> <a type="button" href="#"
							onclick="signOut();">로그아웃</a>&nbsp;&nbsp;&nbsp; <input
							type="button" value="정보수정"
							onclick="javascript:window.location='modify.jsp'">

					</form>

				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
				<ul class="list-group tm-home-list tm-bg-black font-weight-light">
					<li class="d-flex justify-content-between align-items-center">
						<a href="profile.jsp" class="tm-white-text">01. Profile</a>
					</li>
					<li class="d-flex justify-content-between align-items-center">
						<a href="chatt.ch" class="tm-white-text">02. Chatting</a>
					</li>
					<li class="d-flex justify-content-between align-items-center">
						<a a href="list.do?page=1" class="tm-white-text">03. Board</a>
					</li>
					<li class="d-flex justify-content-between align-items-center">
						<a href="application.html" class="tm-white-text">04. Q&A</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<footer class="row tm-mt-big mb-3">
	<div class="col-xl-12 text-center">
		<p class="d-inline-block tm-bg-black white-text py-2 tm-px-5">
			Copyright &copy; 2018 JJY</p>
	</div>
	</footer>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad"
		async defer></script>
</body>


</html>