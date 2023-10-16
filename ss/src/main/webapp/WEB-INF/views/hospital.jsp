<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동물병원 리스트</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="/js/jquery-3.7.0.min.js"></script>
     <link rel="stylesheet" href="/css/style.css">
</head>
<style>
    #searchFrame {
        float: left;
        width: 600px;
        height: 300px;
        border: none;
    }

    .detailFrame {
        margin-left: 610px;
        width: calc(100% - 610px);
        height: 100%;
        border: none;
    }
    
</style>
<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>
    <c:if test="${showAlert}">
        <script>
            alert("로그인이 필요합니다.");
        </script>
    </c:if>
<div class="container">
    <form class="mb-3" action="/hospital" method="GET">
        <div class="input-group">
            <input type="text" class="form-control" name="search" placeholder="병원 이름을 검색하세요"
                   value="${Keyword != null ? Keyword : ''}">
            <button class="btn btn-primary" type="submit">검색</button>
        </div>
    </form>

    <div class="row">
        <c:forEach items="${hosL}" var="hospital">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title"><a href="/hospital/detail?code=${hospital.code}">${hospital.hostitle}</a></h4>
                        <p class="card-text">${hospital.hosphone}</p>
                        <p class="card-text">${hospital.hosaddr}</p>
                        <p class="card-text">
        					<c:choose>
            					<c:when test="${hospital.hoshour < 10}">
                					0${hospital.hoshour}
            					</c:when>
            					<c:otherwise>
                					${hospital.hoshour}
            					</c:otherwise>
        					</c:choose>
        					:
        					<c:choose>
            					<c:when test="${hospital.hosmin < 10}">
                					0${hospital.hosmin}
            					</c:when>
            					<c:otherwise>
                					${hospital.hosmin}
            					</c:otherwise>
        					</c:choose>
        					~
        					<c:choose>
            					<c:when test="${hospital.hoshour2 < 10}">
                					0${hospital.hoshour2}
            					</c:when>
            					<c:otherwise>
                					${hospital.hoshour2}
            					</c:otherwise>
        					</c:choose>
        					:
        					<c:choose>
            					<c:when test="${hospital.hosmin2 < 10}">
                					0${hospital.hosmin2}
            					</c:when>
            					<c:otherwise>
                					${hospital.hosmin2}
            					</c:otherwise>
        					</c:choose>
    					</p>
                        <p class="card-text">${hospital.hostype}</p>
                        <a href="/reserves_hospital?code=${hospital.code}" class="btn btn-primary reserve-btn">예약</a>
                        <a href="/hosRating?code=${hospital.code}" class="btn btn-primary rating-btn">리뷰</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<iframe class="detailFrame" name="detailFrame" frameborder="0"></iframe>



<button id="hosReservesList">예약 목록</button>

<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>
<script>
	$("#hosReservesList").click(function() {
		location.href = "/reserves_List";
	});
	
    $(document).on("click", ".detail-link", function() {
        const detailUrl = $(this).data("detail-url");
        $("iframe.detailFrame").attr("src", detailUrl);
    });
    
//     $(".reserve-btn").click(function() {
//     	var title = ${hos.hostitle};
//         var result = confirm(title+"에 예약하시겠습니까?");
// 		var url = "/reserves_hospital?hostitle=" + title;
//         if(result){
//             location.href=url;
//         }
//     });
</script>
<script src="/js/header.js"></script>
</body>
</html>