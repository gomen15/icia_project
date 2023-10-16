<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
 	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src ="/js/jquery-3.7.0.min.js"></script>
<!-- 카드형태 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<link rel="stylesheet" href="/css/style.css">

</head>
<body>

    <header>
        <jsp:include page="header.jsp"></jsp:include>
    </header>
    
    <h1>게시판</h1>
    
    <div align="center">
        <button class="write">글쓰기</button>
 		
    </div>
    
    <!-- 리스트 반복문  -->
	<div class="row">
	<div class="row justify-content-center">
	    <c:forEach items="${bList}" var="board">
	        <div class="col-md-3 mb-4">
	        <form action = "/board/list?bnum=${board.bnum}" method = "post">
	            <div class="board">
	                <div class="row no-gutters">
	                    <div class="col-md-4">
	                        <c:choose>
	                            <c:when test="${board.sysFileName != null}">
	                                <a href = "/board/detail?bnum=${board.bnum}"><img src="${board.sysFileName}" class="card-img" alt="Product Image"></a>
	                            </c:when>
	                            <c:otherwise>
	                                <p class="board-text">이미지가 없습니다!</p>
	                            </c:otherwise>
	                        </c:choose>
	                    </div>
	                    <div class="col-md-6">
	                        <div class="board-body">
	                            <h5 class="board-title">게시글 ${board.bnum} </h5>
	                            <p class="board-id">아이디 ${board.id} </p>
	                            <p class="board-text">제목 <a href = "/board/detail?bnum=${board.bnum}">${board.b_title}</a></p>
	                            <p class="board-text">날짜 ${board.b_date}
	                            <p class="board-text">조회수 ${board.b_views} </p>
	                            <p class="board-text">개추 ${board.likes} </p>
	                        </div>
	                   </div>
	                   </div>
	                   </div>
	                   </form>
	                   <c:if test="${board.id == mb.id}">     
	                        <form method = "post" action = "/board/delete">
	                        	<input type = "hidden" value = "${board.bnum}" name = "bnum">
	                        	<button class="delete">삭제</button>
	                    	</form>
	                   </c:if>    
	                    </div>
	                     </c:forEach>
	                </div>
	                
</div>	
    <footer>
        <jsp:include page="footer.jsp"></jsp:include>
    </footer>

<script>

// $('.delete').click(() => {
//     function delete_board(bnum) {
//         let conf = confirm("정말 삭제하겠습니까?");
//         if (conf == true) {
//             // 해당 bnum 값에 대한 게시글을 null 값으로 업데이트하는 쿼리문
//             $.ajax({
//                 type: "POST", // 또는 "GET"
//                 url: "/board/update", // 업데이트를 처리할 서버 URL
//                 data: {
//                     bnum: bnum // 업데이트 대상 bnum 값
//                 },
//                 success: function(response) {
//                     // 업데이트 성공 시 실행할 코드
//                     location.href = '/board/write'; // 업데이트 후의 이동 경로
//                 },
//                 error: function(error) {
//                     // 업데이트 실패 시 실행할 코드
//                     alert("게시글 업데이트에 실패했습니다.");
//                 }
//             });
//         }
//     }

    
    $('.write').click(() => {
        location.href = '/board/write';
    });
    
    $('.delete').click(function(event) {    	
    	if (confirm("삭제하시겠습니까?")) {
    		
    	} else {
    		event.preventDefault();
    	}
    });
</script>

<script src="/js/header.js"></script>

</body>
</html>
