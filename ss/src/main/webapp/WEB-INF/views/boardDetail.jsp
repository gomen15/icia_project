<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css">

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
<script src="/js/jquery-3.7.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery.serializeObject/2.0.3/jquery.serializeObject.min.js" integrity="sha512-DNziaT2gAUenXiDHdhNj6bfk1Ivv72gpxOeMT+kFKXB2xG/ZRtGhW2lDJI9a+ZNCOas/rp4XAnvnjtGeMHRNyg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 카드형태 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">
<title>${boardDto.b_title}</title>
</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>

	<h1>글 상세보기</h1>
	<table border="1">
		<tr>
			<td><img src="${imageUrl}" class="card-img" alt="Product Image"
				width="340" height="300"></td>
			<td>
				<table border="1" style="height: 300px; width: 400px;">
					<tr align="center">
						<td>아이디</td>
						<td>${boardDto.id}</td>
					</tr>
					<tr align="center">
						<td>제목</td>
						<td>${boardDto.b_title}</td>
					</tr>
					<tr align="center">
						<td>내용</td>
						<td>${boardDto.b_content}</td>
					</tr>
					<tr align="center">
						<td>조회수</td>
						<td>${boardDto.b_views}</td>
					</tr>
					<tr align="center">
						<td>날짜</td>
						<td>${boardDto.b_date}</td>
					</tr>
					<tr>
						<td id = "likecount">개추 수 ${boardDto.likes}</td>
						<td>
							<button id = "likes">개추</button>
						</td>
					</tr>
					<tr align="center">
						<td colspan="2"><a href="/board/list">글목록</a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>


	<section>
		<div class="content">
			<!-- 댓글 입력 양식 -->
			<form id="rform">
				<!-- 게시글 정보(글번호), 댓글 내용, 접속자(작성자) -->
				<input type="hidden" name="bnum" id="bnum" value="${boardDto.bnum}">
				<textarea name="r_content" rows="3" class="write-input ta"
					id="r_content" placeholder="댓글을 적어주세요."></textarea>
				<input type="hidden" name="id" id="id" value="${mb.id}"> <input
					type="button" value="댓글 전송" class="btn-write"
					onclick="replyInsert()" style="width: 100%; margin-bottom: 30px;">
			</form>

			<table style="width: 100%;" id="rtable">
			<c:choose>
			<c:when test = "${not empty rList}">
				<c:forEach var="ritem" items="${rList}">
					<tr>
						<td class="p-20">${ritem.id}</td>
						<td class="p-50">${ritem.r_content}</td>
						<td class="p-30">
						<fmt:formatDate
								value="${ritem.r_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
							<c:if test ="${mb.id == ritem.id}">
							<form method = "post" action = "/board/replydelete">
	                        	<input type = "hidden" value = "${ritem.rnum}" name = "rnum">
	                            <input type = "hidden" value = "${ritem.bnum}" name = "bnum">
	                        	<button id="delete">삭제</button>
	                    	</form>
	                    	</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td id = "replyCheck">댓글이 없습니다.</td>
				</tr>
			</c:otherwise>
			</c:choose>
			</table>
		</div>
	</section>

	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
	<script>
	let mbtype = '${mb.type}';
	

    $('#write').click(() => {
        location.href = '/board/write';
    });
    
    $('.delete').click(function(event) {    	
    	if (confirm("삭제하시겠습니까?")) {
    		
    	} else {
    		event.preventDefault();
    	}
    });
    
	function replyInsert() {
		let obj = $('#rform').serializeObject();
		console.log('obj:',obj);
		
		$.ajax({
			method: 'post',
			url: '/board/reply',
			data: obj,
			async: false,
		}).done(function(res) {
			console.log("res:",res); //댓글 리스트
			var tdContent = $('#replyCheck').text();

			// 내용이 비어 있는지 여부를 확인합니다.
			if (tdContent.trim() === "") {
				
			} else {
				$('#replyCheck').hide();
			}
			
			$('#rtable').prepend("</tr>")
						.prepend("<td>" + res.r_date + "</td>")
						.prepend("<td>" + res.r_content + "</td>")
						.prepend("<td>" + res.id + "</td>")
						.prepend("<tr>")
						
			$('#r_content').val('');
		}).fail(function(res) {
			console.log("err:",res);
		}); //ajax end
		console.log("next . . . .");
	}

	$('#likes').click(function() {
		let id = '${mb.id}';
		let bnum = ${boardDto.bnum};
		
		console.log("likes start");
		
		if(id == null || id == '') {
			alert("로그인 해주세요!");
			location.href = "/login";
		} else {
			$.ajax({
				method : 'post',
				url : '/board/likes',
				data : { id : id , bnum : bnum }
			}).done(function(res) {
				alert(res);
				location.href = "/board/detail?bnum="+bnum;
			}).fail(function(err) {
				alert("error");
			})
		}
	})
</script>

<script src="/js/header.js"></script>

</body>
</html>