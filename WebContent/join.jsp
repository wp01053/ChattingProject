<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원가입</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/materialize.min.css">
<link rel="stylesheet" href="css/tooplate.css">
<script language="JavaScript" src=member.js></script>

</head>

<body id="register">
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
				<header class="mb-5">
				<h3 class="mt-0 white-text">회원가입</h3>
				<p class="grey-text mb-4">Class aptent taciti sociosqu ad litora
					torquent per conubia nostra, per inceptos himenaeos.</p>
				<p class="grey-text">Vestibulum neque neque, porttitor quis
					lacinia eu, iaculis id dui. Mauris quis velit lectus.</p>
				</header>
			</div>

			<form action="joinOk.me" name="reg_frm" method="post"
				class="tm-signup-form">
				<tr>
					<div class="input-field">
						<input placeholder="Username" id="username" name="id" type="text"
							class="validate">


					</div>
				</tr>

				<div class="input-field">
					<input placeholder="Password" id="password" name="pw"
						type="password" class="validate">
				</div>
				<div class="input-field">
					<input placeholder="Re-type Password" id="password2"
						name="pw_check" type="password" class="validate">
				</div>
				<div class="input-field">
					<input placeholder="Name" id="name" name="name" type="text"
						class="validate">
				</div>
				<div class="input-field">
					<input placeholder="Email" id="email" name="eMail" type="email"
						class="validate">
				</div>
				<div class="input-field">
					<input placeholder="address" id="address" name="address"
						type="text" class="validate">
				</div>
				<div class="text-right mt-4">
					<input type="button" value="Sign Up" onclick="infoConfirm()"
						class="waves-effect btn-large btn-large-white px-4 tm-border-radius-0">

					<input type="reset"
						class="waves-effect btn-large btn-large-white px-4 tm-border-radius-0"
						value="로그인" onclick="javascript:window.location='login.jsp'">
				</div>


			</form>
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