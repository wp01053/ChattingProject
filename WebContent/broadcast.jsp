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
	String password = (String) session.getAttribute("password");
	String CNUM = (String) session.getAttribute("CNUM");
	String BID = (String) session.getAttribute("BID");
	session.setAttribute("CNUM", CNUM);
	session.setAttribute("uid", id);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Chatting</title>
<!--
    Template 2105 Input
	http://www.tooplate.com/view/2105-input
	-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">

<link rel="stylesheet" href="css/tooplate.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function mysubmit(){
//jquery id 받아오기
	var rname = $('#roomname').val();
	//jquery radio button 받아오기

	var m_count = $(":input:radio[name=member_count]:checked").val()
	var r1 = $(":input:radio[name=r1]:checked").val()	
	
	var password = $('#password').val();
	
	document.myform.submit();
	document.location.href="/Jsp28/create.ch?rname=" + rname + "&m_count=" + m_count + "&r1=" + r1 + "&password=" + password;

}


</script>


</head>
<body>



	<!-- 로그인한 상태일 경우와 비로그인 상태일 경우의 chat_id설정 -->
	<%
		if (id != null) {
	%>
	<input type="hidden" value='<%=id%>' id='chat_id' />
	<%
		} else {
	%>
	<input type="hidden" value='<%=session.getId().substring(0, 6)%>'
		id='chat_id' />
	<%
		}
	%>

	<!--     채팅창 -->


	<h1>
		<%=CNUM%>번 방채팅
	</h1>

	<div id="_chatbox" align="center">


		<br /> <input id="inputMessage" type="text" />
		<!-- 채팅 전송 버튼 -->
		<input type="submit" value="send" onclick="send();" />
		<!-- 방 생성 버튼 -->
		<button type="button" data-toggle="modal" data-target="#myModal">Room</button>

	</div>
	<fieldset>
		<div id="messageWindow"
			style="padding: 10px 0; height: 20em; overflow: auto; background-color: #a0c0d7;"></div>
		<div class="container">
	</fieldset>



	<!-- 모달 채팅방 생성 내용 팝업 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel" align="center">방 설정</h4>
				</div>
				<!--  방정보 controller 보내주기 -->
				<form name=myform method="post">
					<div class="modal-body" align="center">
						<input type="text" id="roomname" placeholder="roomname" size=70 />
						<br /> <br /> <input type="radio" name="member_count" value=1>1명&nbsp;
						<input type="radio" name="member_count" value=2>2명&nbsp; <input
							type="radio" name="member_count" value=3>3명&nbsp; <input
							type="radio" name="member_count" value=4>4명&nbsp; <input
							type="radio" name="member_count" value=5>상관없음 <br /> <br />
						<form id='form-id'>
							<input type="radio" name="r1" value="6">공개 <input
								type="radio" name="r1" value=7>비공개
						</form>
						<div id='show-me' style='display: none'>
							<input type="password" id="password" name="password"
								placeholder="password">
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary" onclick="mysubmit()">방
							만들기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	</div>
	<!-- modal script -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<!-- holder.js -->
	<!------------------------하단부 리스트 페이지 분할---------------------------->
	<!-- 방리스트 -->
	<form name="room_In" id="room_In" method="post">
		<td><a href="main.jsp"><input type="button" value="Home"></a>
			<a href="#" onclick="ROOMDEL(<%=CNUM%>)"> <input type="button"
				value="채팅 방 삭제"></a> <a href="list.do"><input type="button"
				value="게시판" /></a> <a href="game.jsp"><input type="button"
				value="game"></a> <a href="baseball.jsp"><input
				type="button" value="baseballgame"></a></td>



	</form>
	<table width="500" cellpadding="0" cellspacing="0" border="1"
		align="left">
		<div width="500">

			<header class="mt-5 mb-5 text-left">
				<h1 class="font-weight-light tm-form-title">
					ID :<%=id%>
				</h1>


			</header>
			<tr>
				<td>방 번호</td>
				<td>방 이름</td>
				<td>방 장</td>

			</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.CNUM}</td>

					<td><a href="roomin.ch?CNUM=${dto.CNUM}&BID=${dto.BID}">${dto.RNAME}</a></td>
					<td>${dto.BID}</td>

				</tr>
				<script>
				function ROOMDEL(CNUM){
				 var msg = prompt( '${dto.CNUM}'+"방을 삭제하시겠습니까 비밀번호를 입력해 주세요" );
					alert("설정한 비밀번호 "+ '${dto.PASSWORD}');
					 alert("입력한 비밀번호 : " + msg);
					if(msg == '${dto.PASSWORD}'){
					alert("삭제완료")
					document.location="delete.ch?CNUM=" + CNUM;
		
					}else if (msg != '${content_view.password}'){
						alert("비밀번호가 일치하지 않습니다.")
					}
	 
				else{
					return false;

					}
				}</script>


			</c:forEach>

		</div>

	</table>

	<br />



</body>
<!-- radio check button  -> input type text 활성화 -->
<script src="//code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script type='text/javascript'>
	$("input[name='r1']").click(
			function() {
				$('#show-me').css('display',
						($(this).val() === '7') ? 'block' : 'none');
			});
</script>
<!-- script 끝 -->

<script type="text/javascript">

	var textarea = document.getElementById("messageWindow");
	var host = location.host;
	var path = '/' + location.pathname.split('/')[1];
	var wsUrl = 'ws://192.168.0.90:8081/Jsp28/chat';

	var webSocket = new WebSocket(wsUrl);
	var inputMessage = document.getElementById('inputMessage');
	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		$("#messageWindow").html("<p class='chat_content'> <%=id%> 님이 채팅에 참여하였습니다.</p>");
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		
		onMessage(event)
	};
	function onClose(event){
		var content=document.createElement('content');
		
	
		webSocket.send("<%=id%> is DisConnected\n");
	}


	function onMessage(event) {

		var message = event.data.split("|");
		var sender = message[0];
		var content = message[1];
		if (content == "") {

		} else {
			//  /ID 를 입력하면 귀속말 가능
			if (content.match("/")) {
				if (content.match(("/" + $("#chat_id").val()))) {
					var temp = content.replace("/" + $("#chat_id").val(),
							"(귓속말) :").split(":");
					if (temp[1].trim() == "") {
					} else {
						$("#messageWindow").html(
								$("#messageWindow").html()
										+ "<p class='whisper'>"
										+ sender
										+ content.replace("/"
												+ $("#chat_id").val(),
												"(귓속말) :") + "</p>");
					}
				} else {
				}
			} else {
				if (content.match("!")) {
					$("#messageWindow")
							.html(
									$("#messageWindow").html()
											+ "<p class='chat_content'><b class='impress'>"
											+ sender + " : " + content
											+ "</b></p>");
				} else {
				
					$("#messageWindow").html(
							$("#messageWindow").html()+
								 "<p class='chat_content'>" + sender
									+ " : " + content + "</p>");
				}
			}
		}


	}
	function onOpen(event) {
	}
	function onError(event) {
		alert(event.data);
	}
	function send() {
		if (inputMessage.value == "") {
		} else {
			$("#messageWindow").html(
					$("#messageWindow").html() + "<p class='chat_content'>나 : "
							+ inputMessage.value + "</p>");
		}
		webSocket.send(<%=CNUM%> +" "+$("#chat_id").val() + "|" + inputMessage.value);
		inputMessage.value =" ";
	}
	// 모든 브라우저 호환
	$("#inputMessage").keyup(function(e) {
		var code = e.which;
		if (code == 13)
			e.preventDefault();
		if (code == 13) {
			send();
		}
	});
	//     엔터키를 통해 send함
	function enterkey() {
		if (window.event.keyCode == 13) {
			send();
		}
	}
	//  채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
	window.setInterval(function() {
		var elem = document.getElementById('messageWindow');
		elem.scrollTop = elem.scrollHeight;
	}, 3000); //뒤에 숫자는 시간
</script>

</html>
<!-- 
<script>
			function roombtn_click(RNAME)
			{
	
			 var msg = prompt("들어갈 방 번호를 입력하세요")
	 		 alert("입력한 방번호 : " + msg);
	
			 alert("들어갈 방번호"+'${dto.RNAME}');
				if(msg=='${dto.RNAME}'){
				alert("방 입장 완료")
				document.location="roomin.ch?RNAME=" + RNAME;

		
				}else if (msg != '${dto.RNAME}'){
					alert("비밀번호가 일치하지 않습니다.")
				}
			else{
				return false;

			}
		}
</script> -->
