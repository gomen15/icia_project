<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약목록</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="/js/jquery-3.7.0.min.js"></script>
     <link rel="stylesheet" href="/css/style.css">
     <script>
		$(() => {
			let m = '${msg}';
			if(m != '') {
				alert(m)
			}
		})
	</script>
	
	<style>
	h2{
	position:relative;
	margin-left:-75px;
	}
		.center-div {
    
        width:700px;
        height:600px;
        padding-left:50px;
        border-style :solid;
         position:relative;
         left:650px;
         top:100px;
		}
		thead{
		 position:relative;
		width:200px;
		left:70px;
		}
		tbody{
		witdh:100px;
		}
		.listhos{
		position:relative;
		left:75px;
		}
	</style>
</head>
<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>

    <div>
    <div class="center-div">
        <br><h2>예약 목록</h2><br><br>
        <table>
            
                <tr>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약일시</th>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;병원 이름</th>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;애완동물</th>
                    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약 사유</th>
                </tr>
            </table>
            <table>
            <tbody>
            <c:choose>
	            <c:when test ="${!empty rsList}">
	                <c:forEach items="${rsList}" var="dto">
	                    <tr>
	                        <td>&nbsp;&nbsp;&nbsp;${dto.checkdate}</td><td><td>
	                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.hostitle}</td><td><td>
	                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.animal}</td><td><td>
	                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.h_pro}</td>
	                        <td>
	                			<form action="/reserves_hospital/cancel" method="post" class="listhos">
	                    			<input type="hidden" name="code" value="${dto.code}">
	                    			<input type="hidden" name="checkdate" value="${dto.checkdate}">
	                    			<button type="submit" class="btn btn-primary" id = "confirm">예약 취소</button>
	                			</form>
	            			</td>
	                    </tr>
	                </c:forEach>
	            </c:when>
                <c:otherwise>
                	<tr>
                		<td colspan = "4">예약된 데이터가 없습니다.</td>
                	</tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
    </div>
    
<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>
<script>
$(document).ready(function() {
    // 예약 취소 버튼 클릭 시 확인 대화상자 띄우기
    $("#confirm").click(function(event) {
        event.preventDefault(); // 기본 동작 중단
        var confirmation = confirm("예약을 취소하시겠습니까?");
        
        // 확인 버튼을 눌렀을 경우
        if (confirmation) {
            // 폼 제출
            $(this).closest("form").submit();
        }
    });
});
</script>
<script src="/js/header.js"></script>
</body>
</html>