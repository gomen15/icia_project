<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<head>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <header>
        <jsp:include page="header.jsp" />
    </header>


    <h1>Shelter update</h1>
    <!-- 파일 업로드에서는 enctype(인코딩타입)을 multipart/form-data로 반드시 설정 -->
    <form action="/shelter/update" method="post" enctype="multipart/form-data">
        
    <!-- Title -->
    <label for="s_title">글 제목</label>
    <input type="text" id="s_title" name="s_title" required value="${sDto.s_title}"><br>
    
    <!-- Date -->
    <label for="s_date">시작날짜</label>
    <input type="date" id="s_date" name="s_date" required value="${sDto.s_date}"><br>
    
    <!-- Date2 -->
    <label for="s_date2">안락사예정일</label>
    <input type="date" id="s_date2" name="s_date2" required value="${sDto.s_date2}"><br>
    
    <!-- Age -->
    <label for="s_age">유기애완동물 나이</label>
    <input type="number" id="s_age" name="s_age" required value="${sDto.s_age}"><br>
    
    <!-- Gender -->
	<label for="s_gender">성별</label>
	<select id="s_gender" name="s_gender" required>
    	<option value="암컷">암컷</option>
    	<option value="수컷">수컷</option>
    	<option value="중성">중성</option>
	</select><br>

    <!-- Genetic -->
    <label for="s_genetic">견종</label>
    <input type="text" id="s_genetic" name="s_genetic" required value="${sDto.s_genetic}"><br>
    
    <!-- Weight -->
    <label for="s_weight">애완동물무게(kg단위)</label>
    <input type="text" id="s_weight" name="s_weight" required value="${sDto.s_weight}"><br>
    
    <label for = "attachments">업로드</label>
	<input type = "file" name="attachments" id="attachments" accept=".jpg, .jpeg, .png, .gif"">
    <input type = "hidden" class="upload-name" value="파일선택" readonly><br>    
        <button type="submit">갱신</button>
    </form>

    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
    
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
    </script>
</body>
</html>
