<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	<c:forEach items="${sList}" var="shelter">
		<div class="container">
			<div class="row">
				<c:if test="${empty sList}">
					<tr>
						<td colspan="7">데이터가 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${!empty sList}">
					<tr>
						<td>${shelter.s_title}</td>
						<td>${shelter.s_date}</td>
						<td>${shelter.s_views}</td>
						
					</tr>

					<%-- </c:forEach> --%>
				</c:if>
				<a href="/shelter/detail?snum=${shelter.snum}" class="btn btn-outline-success">상세보기</a>
			</div>
		</div>
	</c:forEach>

	<a href="/shelter/write" id="write">글쓰기</a>

	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>

<script>
let mid = '${mb.type}';
if(mid === 'admin') {
    $('#write').show();
} else {
    $('#write').hide();
}
</script>
</html>