<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="/css/header.css">
     <script src="/js/header.js"></script>
<style>
/*전체화면 고정*/
body{
min-width:1920px;
}
/*카드 글씨 사이즈*/
.card-text{
	font-size:13.5px;
}
/*경매 상자*/
.card{
	potion:center;
	width:600px;
	height:270px;
	margin-top:5px;
	max-width: 500px;
}

/*이미지*/
.putimg {
	width: 200px;
	height: 210px;
	float: left;
	margin:15px;
	max-width: 500px;
	
}


table {
	width: 100%;
	height: 200px;
}

.search-box {
    position: relative;
    top: 18px; /* 상단에 고정 */
    left: 50%;
    transform: translateX(-50%);
    height: 60px;
    width: 100%;
    max-width: 1000px;
    z-index: 999;
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 30px;
    border: 1px solid #999999;
}
/* 검색창 입력 필드 스타일 */
.search-txt {
    margin-top: 20px;
    margin-right: 20px; /* 조정 필요 */
    padding: 0;
    width: 700px; /* 검색창 넓이 */
    border: 1px solid black;
    outline: none;
    font-size: 18px; /* 검색창 안 글씨 크기 */
    line-height: 20px;
    box-sizing: border-box;
}
/* 검색 버튼 스타일 */
#search-btn {
    position: absolute;
    top: 50%;
    right: 19px;
    padding: 12px;
    background-color: #fff;
    color: black;
    border: none;
    outline: none;
    cursor: pointer;
    transform: translateY(-50%);
}
/*입찰 버튼*/   
#search-btn {
  position: absolute;
  top: 50%; /* Adjusted top value to vertically center the button */
  right: 19px;
  padding: 12px;
  background-color: #fff;
  color: black;
  border: 1px solid black;
  outline: none;
  cursor: pointer;
  transform: translateY(-50%); /* Vertically center the button using translation */
}
#non-data{
	display:inline-block;
	border : 3px solid black;
	width: 300px;
	overflow: auto;
	margin : 5px;
}
.card-img{
    position: relative;
    width:150px;
    height:150px;
    top: 0px;	
	}
</style>
<head>
<link rel="stylesheet" href="/css/style.css">

</head>
<body>

	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	
	<div class="container">
		<form class="mb-3" action="/auction/list" method="GET">
			<div class="input-group">
				<input type="text" class="form-control" name="search" placeholder="동물 이름을 입력하시오"
					   value="${Keyword != null ? Keyword : ''}">
				<button class="btn btn-primary" type="submit">검색</button>
			</div>
			</form>
			<a href="/auction/write">글쓰기</a>
		</div>

<!-- 리스트 반복문  -->

<c:forEach items="${AcList}" var="auction" varStatus="status">
	<div id="non-data">
			    <c:choose>
			        <c:when test="${auction.sysFileName != null}">
			            <img src="${auction.sysFileName}"class="card-img" alt="Image"/>
			        </c:when>
					<c:otherwise>
			            <p>No Image Available</p>
			        </c:otherwise>
			    </c:choose>   
               <c:if test="${empty auction}">
											<tr>
												<td colspan="10">데이터가 없습니다</td>
											</tr>
										</c:if>
										<c:if test="${not empty auction}">
											<br>
										<tr>
												<td>${auction.acnum}</td><br>
												<td>${auction.id}</td><br>
												<td>${auction.ac_animal}</td><br>
												<td>${auction.ac_gender}</td><br>
												<td>${auction.ac_age}</td><br>
												<td>${auction.minprice}</td><br>
												<td>${auction.toprice}</td><br>
												<td>${auction.starttime}</td><br>
												<td>${auction.endtime}</td>
												<td>${auction.endtime2}</td>
											</tr>
									
										</c:if>
               						 <button  type="button"onclick="location.href='/auction/bid?acnum=${auction.acnum}'" class="btn btn-outline-success">입찰</button>
									</div>
									</c:forEach>
	<footer>
		<jsp:include page="footer.jsp"  ></jsp:include>
	</footer>

	<script>
	document.querySelector('#writeBtn').addEventListener('click', ()=> {
		location.href = '/write'
	})
	</script>
</body>
</html>