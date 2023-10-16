<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<style>
	body {
		min-width : 1920px;
	}
</style>

    <script>
		$(() => {
			//삭제 성공, 실패 메세지
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
	
	<form action = "/member/profile/insert" method = "post" enctype="multipart/form-data">
		<input type = "hidden" name = "id" id = "id" value = "${mb.id}">
		<input type = "text" name = "animal" id = "animal" placeholder = "동물종류"><br>
		<input type = "text" name = "p_name" id = "p_name" placeholder = "동물이름"><br>
		<select name = "p_gender" id = "p_gender">
			<option value = "수컷">수컷</option>
			<option value = "암컷">암컷</option>
			<option value = "중성">중성</option>
		</select><br>
		<input type = "number" name = "p_age" id = "p_age" placeholder = "나이"><br>
	    <label for = "attachments">업로드</label>
		<input type = "file" name="attachments" id="attachments" accept=".jpg, .jpeg, .png, .gif">
        <input type = "text" class="upload-name" value="파일선택" readonly><br>
		<input type = "submit" id = "submit">
	</form>
	
	<script>
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
	
		$('#submit').click(function(event) {
			if(confirm("해당 프로필을 추가하시겠습니까?")) {
				if($('#p_age').val() <= 0 || $('#p_age').val() === '') {
					  alert("올바른 동물나이를 입력해주세요.");
					  event.preventDefault();
				}
				if($('#animal').val() === '' || $('#animal').val() === null) {
					alert("올바른 동물종류를 입력해주세요.");
					event.preventDefault();
				}
				if($('#p_name').val() === '' || $('#p_name').val() === null) {
					alert("올바른 동물이름을 입력해주세요.");
					event.preventDefault();
				}
				if($('#id').val() === '' || $('#id').val() === null) {
					alert("로그인이 되어있지 않습니다.");
					event.preventDefault();
					location.href = "/login";
				}
			} else {
				event.preventDefault();
			}
		})
	</script>
	
	<script src="/js/header.js"></script>
</body>
</html>