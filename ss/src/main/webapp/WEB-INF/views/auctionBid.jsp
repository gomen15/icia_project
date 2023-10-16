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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<!-- 입찰가입력란 -->
<style>
	#box-align{
		display:block;
		border : 3px solid black;
		position: center;
		width : 500px;
		text-align: center;
		height: auto;
		margin: auto;
		}
	#text-text{
		border: 3px solid red;
	}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>
<div id="box-align">
  <c:choose>
			        <c:when test="${acDto.sysFileName != null}">
			            <img src="${acDto.sysFileName}" />
			        </c:when>
					<c:otherwise>
			            <p>No Image Available</p>
			        </c:otherwise>
			    </c:choose>   
               <c:if test="${empty acDto}">
										</c:if>
										<c:if test="${not empty acDto}">
											<tr>
												<td>번호: ${acDto.acnum}</td><br>
												<td>판매자ID:${acDto.id}</td><br>
												<td>품종:${acDto.ac_animal}</td><br>
												<td>성별:${acDto.ac_gender}</td><br>
												<td>나이:${acDto.ac_age}</td><br>
												<td>최소가:${acDto.minprice}</td><br>
												<td>현재가:${acDto.toprice}</td><br>
												<td>시작시간:${acDto.starttime}</td><br>
												<c:if test="${not empty acDto.endtime}">
												<td>낙찰시간:${acDto.endtime}</td><br>
												</c:if>
												<td>마감시간:${acDto.endtime2}</td>
											</r>
										</c:if>
		
									<form method="post" action="/auction/bid">
									<input type="hidden" name="id" value = "${mb.id}">
									<input type="hidden" name="acnum" value = "${acDto.acnum}">
				                  <input type="number"  name="toprice"id="toprice" placeholder="입찰가 입력">
									 <button id="bidBtn" type="submit" class="btn btn-outline-success">입찰</button><br>
								  </form>
								</div>
							</div>
							<div id="box-align">
							<c:choose>
							<c:when test="${empty abList}">
							<p>입찰자가 존재하지 않습니다.</p>
							</c:when>
							<c:otherwise><br>
							<c:forEach items="${abList}" var = "abList">
								<table border = "1" style = "text-align : center; margin-left : auto; margin-right : auto; display : inline-block;">
									<tr>
										<td>입찰자:${abList.id}</td>
										<td>입찰가:${abList.toprice}</td>
										<td>입찰일:${abList.curtime}</td>
									</tr>	
								</table><br>
							</c:forEach>
							</c:otherwise>
							</c:choose>
						</div>

 <footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>
	<script src="/js/header.js"></script>
	<script>
	$('#bidBtn').click(function(event) {
	    let toprice = parseFloat($('#toprice').val()); // 현재 입력한 입찰가
	    let toprice2 = parseFloat(${acDto.toprice}); // 현재 금액 (acDto.toprice)

	    // 최소 및 최대 입찰 비율 설정
	    let minPercentageDifference = 10; // 최소 5% 이상
	    let maxPercentageDifference = 400; // 최대 200% 이하

	    // 최소 및 최대 입찰가 계산
	    let minBid = toprice2 * (1 + minPercentageDifference / 100);
	    let maxBid = toprice2 * (1 + maxPercentageDifference / 100);

	    if (toprice >= minBid && toprice <= maxBid) {
	        // 입찰이 허용됩니다.
	        // 원하는 작업을 여기에 추가하세요.
	    } else {
	        alert("입찰가가 현재 금액보다 " + minPercentageDifference + "% 이상, " + maxPercentageDifference + "% 이하로 설정되어야 합니다!");
	        event.preventDefault();
	    }
	});
	
	</script>
</body>
</html>