<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel = "stylesheet" href = "/css/style.css">


<link rel="shortcut icon" href="#">
</head>
<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>
	<div class="wrap">
		<section>
			<div class="content">
				<form action="/member/join" method="post" class="login-form"
					name="jFrm">
					
					<h2 class="login-header">회원 가입</h2><br>
					아이디:<input name="id" type="text" class="login-input" id="id" 
						title="아이디" autofocus placeholder="아이디" maxlength = "20" required><br>
					<div id = "idc" style = "color : red; font-size : 10px;">아이디는 영어와 숫자만 입력 가능합니다.</div><br>
					<input type="button" id="checkId" class="idcheck-btn" style = "margin-bottom : 5px;" value="중복확인"><br>
					
					<input name="pw" type="password" id = "pw" class="login-input" 
						title="비밀번호" placeholder="비밀번호" required><br>
					<input type="checkbox" id="pwbox"> 비밀번호 표시
					<div id = "pwc" style = "color : red; font-size : 10px;">비밀번호는 영어와 숫자와 특수문자를 포함 해야합니다.</div>
						
					<input name="name" id = "name" type="text" class="login-input" title="이름" placeholder="이름" maxlength = "10" required> <br>
					<div id = "nac" style = "color : red; font-size : 10px;">아이디는 한글만 입력 가능합니다.</div>
					
					<input name="birth" id="birth" type="text" class="login-input"  title="생일"
						placeholder="생일" maxlength = "8" required> <br>
					<input type="text" id="email1" class="login-input" title="이메일" placeholder="이메일" maxlength="25" required>@
					<select id="email2">
					  <option value="naver.com">naver.com</option>
					  <option value="gmail.com">gmail.com</option>
					  <option value="daum.net">daum.net</option>
					  <option value="hanmail.net">hanmail.net</option>
					  <option value="기타">기타</option>
					</select>		
					<input type="text" id="email3" value="naver.com" maxlength="15" placeholder="QueenY.kr" readonly required>
					<input type="hidden" name = "email" id="email"><br>
					<div id = "emc" style = "color : red; font-size : 10px;">이메일을 형식에 맞게 작성해주세요.</div>
					
					<input type="hidden" name = "addr" id = "addr">
				    <select id ="addrs">
				    	<option value="서울">서울</option>
				    	<option value="부산">부산</option>
				    	<option value="인천">인천</option>
				    	<option value="대구">대구</option>
				    	<option value="대전">대전</option>
				    	<option value="광주">광주</option>
				    	<option value="울산">울산</option>
				    	<option value="세종">세종</option>
				    	<option value="경기">경기</option>
				    	<option value="충청">충청</option>
				    	<option value="전라">전라</option>
				    	<option value="경상">경상</option>
				    	<option value="강원">강원</option>
				    	<option value="제주">제주</option>
				    </select>
				    <input type="text" id="addr2" placeholder="상세주소" required><br>
				    <div id = "adc" style = "color : red; font-size : 10px;">상세 주소를 입력해주세요.</div>
				    
					연락처:<select id="phone">
						<option value="010">010</option>
					    <option value="02">02</option>
					    <option value="031">031</option>
					    <option value="032">032</option>
					    <option value="042">042</option>
					    <option value="043">043</option>
					    <option value="044">044</option>
					    <option value="051">051</option>
					    <option value="052">052</option>
					    <option value="053">053</option>
					    <option value="054">054</option>
					    <option value="055">055</option>
					    <option value="061">061</option>
					    <option value="062">062</option>
					    <option value="063">063</option>
					    <option value="064">064</option>
					</select>-
					<input type="text" id="phone1" oninput="formatPhoneNumberPart(this); formatPhoneNumber();" maxlength="4" required>-
					<input type="text" id="phone2" oninput="formatPhoneNumberPart(this); formatPhoneNumber();" maxlength="4" required>
				    <input type="hidden" id="Number" name="phone">
				    <div id = "phc" style = "color : red; font-size : 10px;">연락처를 형식에 맞게 입력해주세요.</div>
				    
					<select name = "gender">
						<option value = "남자">남자</option>
						<option value = "여자">여자</option>
						<option value = "비공">비공</option>
					</select>
					
					<input type="hidden" value="nor" name="type"><br>
					<input type="submit" class="login-btn" id="submit" value="가입" disabled><br>
					<div id = "subc" style = "color : red; font-size : 10px;">아이디 중복체크 시 활성화 됩니다.</div>
				</form>
			</div>
		</section>
	</div>
	<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>

<script>
	$(document).ready(function() {
	  $('#checkId').click(() => {
	    let id = $('#id').val();
	    
	    if($('#id').val() != null && $('#id').val() != '') {
		    $.ajax({
		      method: "POST",
		      url: "/idcheck",
		      data: { id: id },
		    }).done(function(res) {
		      if (res === 0) {
		        alert("사용가능한 아이디입니다.");
		        $('.login-btn').prop('disabled', false);
		        $('#checkId').prop('disabled', true);
		        $('#id').prop('readonly', true);
		      } else {
		        alert("중복된 아이디입니다.");
		      }
		    }).fail(function(err) {
		      alert("서버 작업 중 오류가 발생하였습니다.");
		    });
		  } else {
			  alert("아이디를 입력해주세요!");
		  }
	  });

	  // 전화번호 부분을 합치는 함수
		function formatPhoneNumber() {
		    const prefix = $('#phone').val();
		    const part1 = $('#phone1').val();
		    const part2 = $('#phone2').val();
		
		    const phoneNumber = prefix + "-" + part1 + "-" + part2;
		    $('#Number').val(phoneNumber);
		}
		
		// 정규식을 사용하여 입력값을 숫자로 제한하는 함수
		function formatPhoneNumberPart(input) {
		    input.value = input.value.replace(/\D/g, '');
		}

	  // 아이디에 영어 숫자만 입력되게 하는 정규식
	  $('#id').on('input', function() {
	    const value = $(this).val();
	    const pattern = /^[a-zA-Z0-9]+$/; // 영어와 숫자만 허용하는 정규식
	    if (!pattern.test(value)) {
	      $(this).val(value.replace(/[^a-zA-Z0-9]/g, '')); // 영어와 숫자 이외의 문자 제거
	    }
	  });

	  // 이름에 한글만 입력되게 하는 정규식
	  $('#name').on('input', function() {
	    var inputValue = $(this).val();
	    var filteredValue = inputValue.replace(/[^\uAC00-\uD7AF\u1100-\u11FF\u3130-\u318F\uA960-\uA97F\uAC00-\uD7AF\uAC00-\uD7AF\uAC00-\uD7AF]/g, '');
	    $(this).val(filteredValue);
	  });

	  // 생일에 숫자만 입력되게 하는 함수
	  $('#birth').on('input', function() {
	    var inputValue = $(this).val();
	    var filteredValue = inputValue.replace(/[^\d]/g, ''); // 숫자만 허용
	    $(this).val(filteredValue);
	  });

	  // 이메일 관련 코드
	  $('#email2').change(function() {
	    var selectedValue = $(this).val();
	    if (selectedValue === '기타') {
	      $('#email3').prop('readonly', false).val('');
	    } else {
	      $('#email3').prop('readonly', true).val(selectedValue);
	    }
	  });

	  $('#email1').on('input', function() {
	    var value = $(this).val();
	    var sanitizedValue = value.replace(/[^a-zA-Z0-9]/g, '');
	    $(this).val(sanitizedValue);
	  });

	  $('#email3').on('input', function() {
	    var value = $(this).val();
	    var sanitizedValue = value.replace(/[^a-zA-Z.]/g, '');
	    var dotCount = sanitizedValue.split('.').length - 1;

	    if (dotCount > 1) {
	      var firstDotIndex = sanitizedValue.indexOf('.');
	      sanitizedValue = sanitizedValue.substring(0, firstDotIndex + 1) + sanitizedValue.substring(firstDotIndex + 1).replace(/\./g, '');
	    }

	    $(this).val(sanitizedValue);
	  });

	  // 비밀번호 입력 필드에 대한 정규식 패턴
	  // pwPattern 변수를 이곳에서 정의
	  const pwPattern = /^[a-zA-Z0-9!@#$%^&*()-_=+{}[];:'",.<>?]+$/;

	  // Checkbox의 상태에 따라 비밀번호 필드의 입력 타입 변경
	  $('#pwbox').change(function() {
	    if ($(this).prop('checked')) {
	      $('#pw').attr('type', 'text');
	    } else {
	      $('#pw').attr('type', 'password');
	    }
	  });

	  // pw 값 변경 감지
	  $('#pw').on('input', function() {
	    const value = $(this).val();
	    const sanitizedValue = value.replace(/[^a-zA-Z0-9!@#$%^&*()-_=+{}[];:'",.<>?]+$/, '');
	    $(this).val(sanitizedValue);
	  });

	  // Submit 버튼 클릭 시 서버로 데이터 전송
	  $('#submit').click(function(event) {
	    // 비밀번호 입력 값
	    const pwValue = $('#pw').val();
	
	    // 비밀번호 정규식 검사
	    const pwPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$/;
	    if (!pwPattern.test(pwValue)) {
	      alert('비밀번호는 숫자, 영어, 특수문자를 각각 하나 이상 포함해야 합니다.');
	      event.preventDefault(); // 서버로의 전송 중지
	      return;
	    }
	    
	    // 필요한 입력 요소들
	    var email1 = $('#email1').val();
	    var email3 = $('#email3').val();
	    $('#email').val(email1 + '@' + email3);

	    const phone1 = $('#phone1').val();
	    const phone2 = $('#phone2').val();
	    const addrs = $('#addrs').val();
	    const addr2 = $('#addr2').val();
	    $('#addr').val(addrs + " " + addr2);

	    // phone1과 phone2의 길이 검사
	    if (phone1.length < 3 || phone2.length < 4) {
	      alert('전화번호를 올바르게 입력해주세요.');
	      event.preventDefault(); // 서버로의 전송 중지
	      return;
	    }
	    formatPhoneNumber();
	  });
	});
</script>


<script src="/js/header.js"></script>
</body>
</html>