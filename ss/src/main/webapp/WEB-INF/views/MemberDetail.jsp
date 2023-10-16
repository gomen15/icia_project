<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
  .container {
    display: grid; /* 모든 내용을 칸으로 나눠주는것. 1칸 1칸 1칸 이런식으로 총 12칸이 주어진다. */
    grid-template-columns: 6fr 6fr; /* 그리드 12칸을 6칸 6칸 왼쪽 오른쪽으로 나눠라 */
    align-items: center; /* 세로정렬 가운데로 */
    justify-items: center; /* 가로정렬 가운데로 */
    height: 70vh; /* 가운데를 맞춰주는 역할 */
  }
  .form-container {
    grid-column: 1 / 2; /* 1번 열을 기준으로 */
    align-self: center; /* 세로 가운데 정렬 */
  }
  .form-content {
    text-align: center;
  }
  .btn-area {
    display: flex;
    justify-content: center;
    margin-top: 20px;
  }
  .right-content {
    grid-column: 2 / 3;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
  }
  .animal-profile-card {
    border: 1px solid black;
    padding: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    margin-bottom: 10px; /* 카드 사이의 간격 */
  }
  .animal-profile-card img {
    width: 60px;
    height: 60px;
  }
  .profile-details {
    flex-grow: 1;
    margin-left: 10px; /* 내용 왼쪽 여백 */
  }
  .buttons {
    display: flex;
    gap: 10px; /* 버튼 사이의 간격 */
  }
  #insert {
    margin-top: 20px;
    align-self: flex-end; /* 추가 버튼을 오른쪽으로 정렬 */
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

<title>Insert title here</title>
</head>
<body>
<header>
  <jsp:include page="header.jsp"></jsp:include>
</header>
<div class="container">
  <div class="form-container">
    <form action="/member/update" method="get">
      <div class="form-content">
        <table>
          <tr>
            <td>아이디 : ${mb.id}</td>
          </tr>
          <tr>
            <td>이름 : ${mb.name}</td>
          </tr>
          <tr>
            <td>생년월일 : ${mb.birth}</td>
          </tr>
          <tr>
            <td>주소 : ${mb.addr}</td>
          </tr>
          <tr>
            <td>이메일 : ${mb.email}</td>
          </tr>
          <tr>
            <td>전화번호 : ${mb.phone}</td>
          </tr>
        </table>
        <div class="btn-area">
          <input type="submit" class="btn btn-primary" value="수정"><tr>
          <input type="button" class="btn btn-primary" value="돌아가기" onclick="backbtn()">
        </div>
      </div>
    </form>
  </div>
	<div class="right-content">
	  <c:forEach items="${pDto}" var="prof">
	    <div class="animal-profile-card">
	      <c:choose>
	        <c:when test="${empty prof.sysFileName}">
	          <img src="/images/no_image.png">
	        </c:when>
	        <c:otherwise>
	          <img src="${prof.sysFileName}">
	        </c:otherwise>
     	 </c:choose>
	      <div class="profile-details">
	        <c:choose>
	          <c:when test="${empty prof}">
	            <p>프로필이 존재하지 않습니다.</p>
	          </c:when>
	          <c:otherwise>
	            <p>동물종류: ${prof.animal}</p>
	            <p>동물이름: ${prof.p_name}</p>
	            <p>동물성별: ${prof.p_gender}</p>
	            <p>동물나이: ${prof.p_age}</p>
	          </c:otherwise>
	        </c:choose>
	      </div>
	      <div class="buttons">
	        <form method="get" action="/member/profile/update">
	          <input type = "hidden" name = "id" value = "${mb.id}">
	          <input type = "hidden" name = "animal" value = "${prof.animal}">
	          <button class="btn btn-primary" id="update">수정</button>
	        </form>
	        <form method="post" action="/member/profile/delete">
	          <input type = "hidden" name = "id" value = "${mb.id}">
	          <input type = "hidden" name = "animal" value = "${prof.animal}">
	          <button class="btn btn-primary" id="delete">삭제</button>
	        </form>
	      </div>
	    </div>
	  </c:forEach>
	  <button id="insert"class="btn btn-primary">추가</button>
	</div>
</div>
<script>
  function backbtn() {
    history.back();
  }
  
  $('#insert').click(function(event) {
	  if(confirm("프로필을 추가 하시겠습니까?")) {
		  location.href = "/member/profile/insert";
	  } else {
		  event.preventDefault();
	  }
  })
  
  $('#update').click(function(event) {
	  if(confirm("프로필을 수정 하시겠습니까?")) {

	  } else {
		  event.preventDefault();
	  }
  })
  
  $('#delete').click(function(event) {
	  if(confirm("프로필을 삭제 하시겠습니까?")) {
		  
	  } else {
		  event.preventDefault();
	  }
  })
</script>
<script src="/js/header.js"></script>
</body>
</html>