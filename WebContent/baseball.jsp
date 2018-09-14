<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>숫자야구</title>
<script>
	// 변수 선언
	var key1, key2, key3, strike, ball, no1, no2, no3, display;

	// 초기화 함수
	function init() {
		// key1을 0부터 9사이의 값으로 입력
		key1 = Math.round(Math.random() * 9);
		key2 = key1;
		key3 = key1;

		// key2를 key1과는 다른 값중에 0부터 9사이의 값으로 입력
		while (1) {
			if (key2 != key1) {
				break;
			} else {
				key2 = Math.round(Math.random() * 9);
			}
		}

		// key3를 key1, key2와는 다른 값중에 0부터 9사이의 값으로 입력
		while (1) {
			if (key3 != key1 && key3 != key2) {
				break;
			} else {
				key3 = Math.round(Math.random() * 9);
			}
		}

		// 입력박스 no1로 포커스
		document.getElementById("no1").focus();
	}

	// 입력박스에 값이 들어온 경우 입력값 확인
	function check(obj) {
		// 입력박스 no1에 값이 들어온 경우
		if (obj.id == "no1") {
			// 입력값이 숫자인지 확인하여 숫자가 아닌 경우 처리
			if (obj.value.charCodeAt(0) < 48 || obj.value.charCodeAt(0) > 57) {
				obj.value = "";
				obj.value.focus();
			} else {
				// 입력박스 no2로 포커스
				document.getElementById("no2").focus();
			}
		}
		// 입력박스 no2에 값이 들어온 경우
		else if (obj.id == "no2") {
			// 입력값이 숫자인지 확인하여 숫자가 아닌 경우 처리
			if (obj.value.charCodeAt(0) < 48 || obj.value.charCodeAt(0) > 57) {
				obj.value = "";
				obj.value.focus();
			}
			// 입력값이 입력박스 no1과 동일한지 확인하여 동일한 경우 처리
			else if (obj.value == document.getElementById("no1").value) {
				obj.value = "";
				obj.value.focus();
			} else {
				// 입력박스 no3로 포커스
				document.getElementById("no3").focus();
			}
		}
		// 입력박스 no3에 값이 들어온 경우
		else if (obj.id == "no3") {
			// 입력값이 숫자인지 확인하여 숫자가 아닌 경우 처리
			if (obj.value.charCodeAt(0) < 48 || obj.value.charCodeAt(0) > 57) {
				obj.value = "";
				obj.value.focus();
			}
			// 입력값이 입력박스 no1, no2와 동일한지 확인하여 동일한 경우 처리
			else if (obj.value == document.getElementById("no1").value
					|| obj.value == document.getElementById("no2").value) {
				obj.value = "";
				obj.value.focus();
			} else {
				// 결과 확인 함수 호출
				hit();
			}
		}
	}

	// 입력박스에 입력이 완료되면 결과 확인
	function hit() {
		// 변수에 담아 사용하기 편한형태로 처리
		no1 = document.getElementById("no1").value;
		no2 = document.getElementById("no2").value;
		no3 = document.getElementById("no3").value;
		display = document.getElementById("display");

		// 입력박스의 값을 초기화
		document.getElementById("no1").value = '';
		document.getElementById("no2").value = '';
		document.getElementById("no3").value = '';

		// 스트라이크와 볼 변수를 초기화
		strike = 0;
		ball = 0;

		// 입력박스에 아무런 값도 입력하지 않은 경우 입력 오류 출력
		if (no1 == "" || no2 == "" || no3 == "") {
			display.value = no1 + ' ' + no2 + ' ' + no3 + ' ' + ' : '
					+ '입력 오류!' + '\n' + display.value;
		} else {
			// 입력값 no1이 key1과 같은 경우 스트라이크
			if (no1 == key1) {
				strike++;
			}
			// 입력값 no1이 key2과 같은 경우 볼
			if (no1 == key2) {
				ball++;
			}
			// 입력값 no1이 key3과 같은 경우 볼
			if (no1 == key3) {
				ball++;
			}

			// 입력값 no2이 key1과 같은 경우 볼
			if (no2 == key1) {
				ball++;
			}
			// 입력값 no2이 key2과 같은 경우 스트라이크
			if (no2 == key2) {
				strike++;
			}
			// 입력값 no2이 key3과 같은 경우 볼
			if (no2 == key3) {
				ball++;
			}

			// 입력값 no3이 key1과 같은 경우 볼
			if (no3 == key1) {
				ball++;
			}
			// 입력값 no3이 key2과 같은 경우 볼
			if (no3 == key2) {
				ball++;
			}
			// 입력값 no3이 key3과 같은 경우 스트라이크
			if (no3 == key3) {
				strike++;
			}

			// 스트라이크가 3개인 경우
			if (strike == 3) {
				display.value = no1 + ' ' + no2 + ' ' + no3 + ' ' + ' : '
						+ 'HOME RUN!' + '\n' + display.value;
			}
			// 스트라이크와 볼이 1개도 없는 경우
			else if (strike == 0 && ball == 0) {
				display.value = no1 + ' ' + no2 + ' ' + no3 + ' ' + ' : '
						+ 'OUT!' + '\n' + display.value;
			} else {
				display.value = no1 + ' ' + no2 + ' ' + no3 + ' ' + ' : '
						+ strike + ' S ' + ball + ' B ' + '\n' + display.value;
			}
		}

		// 입력박스 no1로 포커스
		document.getElementById("no1").focus();
	}
</script>
</head>
<body onload='init()'>
	<form id='form' name='form'>
		<table>
			<tr>
				<td><textarea id='display' name='display' rows='10' cols='30'
						style='overflow: hidden;'></textarea></td>
			</tr>
			<tr>
				<td><input type='text' id='no1' name='no1' size='1'
					maxlength='1' onkeyup='check(this)'> <input type='text'
					id='no2' name='no2' size='1' maxlength='1' onkeyup='check(this)'>
					<input type='text' id='no3' name='no3' size='1' maxlength='1'
					onkeyup='check(this)'> <input type='button' value='재시작'
					onclick='location.reload()'></td>
			</tr>
		</table>
	</form>
</body>
</html>