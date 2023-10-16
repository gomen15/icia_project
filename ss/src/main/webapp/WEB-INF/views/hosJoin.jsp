<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="/css/header.css">

<style>
	#form{
		position: relative;
		width:700px;
		height: 400px;
		top:180px;
		left:590px;
		padding-top:20px;
		padding-left:20px;
		border-style:double;
		box-shadow: 4px 4px 4px 4px gray;
		background-color: rgb(255, 255, 255);
		border-radius:10px;
	}/*입력란*/
	#code{
	height: 30px;
	border:gray;
	border-radius:20px;
	box-shadow: 2px 2px 2px 2px rgb(195, 192, 192) inset;
	}
	#name2{
	height: 30px;
	border:gray;
	border-radius:20px;
	box-shadow: 2px 2px 2px 2px rgb(195, 192, 192) inset;
	}
	#hosphone1{
	height: 30px;
	border:gray;
	border-radius:20px;
	box-shadow: 2px 2px 2px 2px rgb(195, 192, 192) inset;
	}
	#hosphone2{
	height: 30px;
	border:gray;
	border-radius:20px;
	box-shadow: 2px 2px 2px 2px rgb(195, 192, 192) inset;
	}
	#hosaddr2{
	height: 30px;
	border:gray;
	border-radius:20px;
	box-shadow: 2px 2px 2px 2px rgb(195, 192, 192) inset;
	}
	
	/*연락처 010고르는거*/
	#hosphone{
		border-radius:10px;
	}
	/*코드확인버튼*/
	#codeCheck{
		color:#ffff;
		border-radius:10px;
		background-color: black;
		box-shadow: 4px 4px 4px 4px rgb(173, 171, 171);
		cursor: pointer; /* 커서 모양 변경 */
	}
	/*지역 고르는거*/
	#hosaddr{
		border-radius:10px;
	}
	/*병원 고르는거*/
	#hos{
		border-radius:10px;
	}
	/*가입 버튼*/
	#submit{
		background-color: black;
		color:#888888;
		border-radius:10px;
		cursor: pointer; /* 커서 모양 변경 */
	}
</style>
    <script>
		$(() => {
			//로그인 실패 메세지
			let m = '${msg}';
			if(m != '') {
				alert(m)
			}
		})
	</script>
</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>

	<form action="/hos/join" method="post" enctype="multipart/form-data" id="form">
		<input type="text" name="code" id="code" placeholder="코드" required>
		<input type="button" id="codeCheck" value="코드확인"><br><br>
		<input type="text" name="hostitle" placeholder="병원명" id="name2" required><br><br>
		연락처:<select id="hosphone">
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
		</select>
		<input type="text" id="hosphone1" oninput="formatPhoneNumberPart(this); formatPhoneNumber();" oninput="formatPhoneNumber()" maxlength="4" required>
		<input type="text" id="hosphone2" oninput="formatPhoneNumberPart(this); formatPhoneNumber();" oninput="formatPhoneNumber()" maxlength="4" required><br>
	    <input type="hidden" id="hosNumber" name="hosphone">
	    <input type="hidden" name = "hosaddr" id = "addr">
	    <select id ="hosaddr">
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
	    <input type="text" id="hosaddr2" placeholder="병원 상세주소" required><br>
	    <h3>영업시간 선택</h3>
	    시작시간:<select name="hoshour" id="hoshour">
			<% for (int i = 0; i < 24; i++) { %>
			    <option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
			<% } %>
	    </select>시
	    <select name="hosmin" id="hosmin">
			<% for (int i = 0; i < 60; i++) { %>
			    <option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
			<% } %>
	    </select>분
	   	종료시간:<select name="hoshour2" id="hoshour2">
			<% for (int i = 0; i < 24; i++) { %>
			    <option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
			<% } %>
	    </select>시
	    <select name="hosmin2" id="hosmin2">
			<% for (int i = 0; i < 60; i++) { %>
			    <option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
			<% } %>
	    </select>분
	    예약단위:<select name="mincheck">
	    	<option value = "15">15</option>
	    	<option value = "30">30</option>
	    	<option value = "45">45</option>
	    	<option value = "60">60</option>	    	
	    </select>분
	    <br>
	    병원종류:<select name="hostype" id="hos">
	    	<option value = "일반">일반</option>
	    	<option value = "특수">특수</option>
	    </select><br>
	    <label for = "attachments">업로드</label>
		<input type = "file" name="attachments" id="attachments" accept=".jpg, .jpeg, .png, .gif">
        <input type = "hidden" class="upload-name" value="파일선택" readonly><br><br><br>
	    <input type="submit" id="submit" value="가입" disabled>
	</form>
	
	<script>
		$('#codeCheck').click(function() {
			$.ajax({
			    type: "POST",
			    url: "/hos/codecheck",
			    data: JSON.stringify({ code: $('#code').val() }), // 데이터를 JSON 형식으로 변환
			    contentType: "application/json"
				}).done(function(res) {
				    if (res.result === true) {
				        alert('확인완료');
				        $('#submit').prop('disabled', false);
				        $('#codeCheck').prop('disabled', true);
				        $('#code').prop('readonly', true);
				   		$('#submit').css('color','white');
				    } else {
				        alert('확인실패');
				        $('#submit').prop('disabled', true);
				        $('#codeCheck').prop('disabled', false);
				    }
				}).fail(function(jqXHR, textStatus, errorThrown) {
				    alert('확인실패');
				    $('#submit').prop('disabled', true);
				    $('#codeCheck').prop('disabled', false);
				});
			});

		$('#attachments').on('change', function() {
			//파일 선택 후 열기 버튼을 누르면 change event 발생
			console.log($('#attachments'));
			let files = $('#attachments')[0].files;
			console.log(files);
			
			let fileName = '';
			if(files.length > 1) {
				fileName = files[0].name + ' 외 ' + (files.length-1) + '개';
			} else if(files.length == 1) {
				fileName = files[0].name;
			} else {
				fileName = "파일 선택";
			}
			$(".upload-name").val(fileName);
		});
		
    	// 전화번호 부분을 합치는 함수
	    function formatPhoneNumber() {
	        const prefix = $('#hosphone').val();
	        const part1 = $('#hosphone1').val();
	        const part2 = $('#hosphone2').val();
	
	        const phoneNumber = prefix + "-" + part1 + "-" + part2;
	        $('#hosNumber').val(phoneNumber);
	    }
	
	    // 정규식을 사용하여 입력값을 숫자로 제한하는 함수
	    function formatPhoneNumberPart(input) {
	        input.value = input.value.replace(/\D/g, '');
	    }
	    
	    $('#submit').click(function(event) {
	        // 필요한 입력 요소들
	        const hosphone1 = $('#hosphone1').val();
	        const hosphone2 = $('#hosphone2').val();
	        const hoshour = $('#hoshour').val();
	        const hosmin = $('#hosmin').val();
	        const hoshour2 = $('#hoshour2').val();
	        const hosmin2 = $('#hosmin2').val();

	        const hosaddr = $('#hosaddr').val();
	        const hosaddr2 = $('#hosaddr2').val();
	        $('#addr').val(hosaddr + " " + hosaddr2);
	        // hosphone1과 hosphone2의 길이 검사
	        if (hosphone1.length < 3 || hosphone2.length < 4) {
	            alert('전화번호를 올바르게 입력해주세요.');
	            event.preventDefault(); // 서버로의 전송 중지
	            return;
	        }

	        // 영업시간 검사
	        if (hoshour > hoshour2 || (hoshour === hoshour2 && hosmin >= hosmin2)) {
	            alert('올바른 영업시간을 선택해주세요.');
	            event.preventDefault(); // 서버로의 전송 중지
	            return;
	        }
	    });
    </script>
    
    <script src="/js/header.js"></script>
</body>
</html>