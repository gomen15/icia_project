<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 상세보기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="/js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	<div class="row">
		<div class="col-md-4 mb-4">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${hosL.hostitle}</h4>
					<p class="card-text">${hosL.hosphone}</p>
					<p class="card-text">${hosL.hosaddr}</p>
					<p class="card-text">
						<c:choose>
							<c:when test="${hosL.hoshour < 10}">
                					0${hosL.hoshour}
            					</c:when>
							<c:otherwise>
                					${hosL.hoshour}
            					</c:otherwise>
						</c:choose>
						:
						<c:choose>
							<c:when test="${hosL.hosmin < 10}">
                					0${hosL.hosmin}
            					</c:when>
							<c:otherwise>
                					${hosL.hosmin}
            					</c:otherwise>
						</c:choose>
						~
						<c:choose>
							<c:when test="${hosL.hoshour2 < 10}">
                					0${hosL.hoshour2}
            					</c:when>
							<c:otherwise>
                					${hosL.hoshour2}
            					</c:otherwise>
						</c:choose>
						:
						<c:choose>
							<c:when test="${hosL.hosmin2 < 10}">
                					0${hosL.hosmin2}
            					</c:when>
							<c:otherwise>
                					${hosL.hosmin2}
            					</c:otherwise>
						</c:choose>
					</p>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
<script src="/js/header.js"></script>
</html>