<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="/js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="/css/style.css">
</head>
<style>
    #hos-align{
        width: 500px;
        margin: 0 auto;
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
	<section>
        <div class="content">
            <div class="board-form">
                <div class="user-info">
                </div>
                <h2 class="login-header">게시글 목록</h2>
                </div>
                <div> <!-- 내용 -->
                    <div id="hos-align">
                        <c:if test="${empty rList}">
                            <div style="width: 100%;">
                                해당 병원의 리뷰가 없습니다.
                            </div>
                        </c:if>
                        <c:if test="${!empty rList}">
                            <table>
                            	<tr style = "background-color : black; color : white; ">
                            		<td>평점</td>
                            		<td>리뷰</td>
                            		<td>작성자</td>
                            	</tr>
	                            <c:forEach var="rating" items="${rList}">
	                                <tr style = "border-bottom : 1px solid black;">
	                                	<td style="border : 1px solid">${rating.rating}</td>
	                                    <td style="border : 1px solid">${rating.review}</td>
	                                	<td style="border : 1px solid">${rating.id}</td>
	                                </tr>
	                            </c:forEach>
                            </table>
                        </c:if>
                    </div>
                </div>
                <form action="/hosRating/write" method="get">
                	<input type="hidden" name="code" value="${code}">
    				<button type="submit">리뷰작성</button>
				</form>
            </div>
    </section>

<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script src="/js/header.js"></script>
</html>