<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("ValidMem") != null) {
%>
<jsp:forward page="main.jsp"></jsp:forward>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<meta name="google-signin-client_id"
	content="369242850987-m3opbslgq2elmfvs793i5asofk6adm0d.apps.googleusercontent.com">

<title>Login Form</title>
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
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		console.log('ID: ' + profile.getId());
		console.log('Name: ' + profile.getName());

		$('#upic').attr('src', profile.getImageUrl());
		$('#uname').html('[ ' + profile.getName() + ' ]');

		document.location.href = "glogin.me?name=" + profile.getName();
	}
</script>
</head>
<body id="login">
	<div class="container">
		<div class="row tm-register-row tm-mb-35">
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-login-l">
				<form action="loginOk.me" method="post"
					class="tm-bg-black p-5 h-100">
					<div class="input-field">
						<input placeholder="Username" id="username" name="id" type="text"
							class="validate"
							value="<%if (session.getAttribute("id") != null)
				out.println(session.getAttribute("id"));%>">
					</div>
					<div class="input-field mb-5">
						<input placeholder="Password" id="password" name="pw"
							type="password" class="validate">
					</div>
					<div>
						<p>
							<input type="submit" value="Login"
								class="waves-effect btn-large btn-large-white px-4 black-text rounded-0">
							<input type="button" value="회원가입"
								class="waves-effect btn-large btn-large-white px-4 black-text rounded-0"
								onclick="javascript:window.location='join.jsp'">
						</p>
					</div>
					<div id="my-signin2" class="g-signin2" data-onsuccess="onSignIn"></div>

				</form>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-login-r">
				<header class="font-weight-light tm-bg-black p-5 h-100">
				<h3 class="mt-0 text-white font-weight-light">Login</h3>
				<p>Class aptent taciti sociosqu ad litora torquent per conubia
					nostra, per inceptos himenaeos.</p>
				<p class="mb-0">Vestibulum neque neque, porttitor quis lacinia
					eu, iaculis id dui. Mauris quis velit lectus.</p>
				</header>
			</div>
		</div>
	</div>
	<footer class="row tm-mt-big mb-3">
	<div class="col-xl-12 text-center">
		<p class="d-inline-block tm-bg-black white-text py-2 tm-px-5">
			Copyright &copy; 2018 JJY</p>
	</div>
	</footer>


</body>
</html>