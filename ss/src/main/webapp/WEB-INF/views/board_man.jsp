<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
 <c:forEach item="${boards}" var="Board">
        <table border="1">
            <tr>
                <td>번호 : ${bnum}</td>
                <td>글 제목 : ${b_title}</td>
            </tr>
            <button onclick="location.href='/board_man?code=${board.bnum}'">삭제</button>
        </table>
    </c:forEach>
    <div>
        <c:if test="${currentPage > 1}">
            <a href="?page=${currentPage - 1}">◀</a>
        </c:if>
        
        <c:forEach begin="1" end="${totalPages}" var="pageNum">
            <c:choose>
                <c:when test="${pageNum == currentPage}">
                    <span>${pageNum}</span>
                </c:when>
                <c:otherwise>
                    <a href="?page=${pageNum}">${pageNum}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <c:if test="${currentPage < totalPages}">
            <a href="?page=${currentPage + 1}">▶</a>
        </c:if>
    </div>
    
    <script>
        $(document).ready(function(){
            var modal = $("0");
            var codelInput = $("hos.code");
        })
    </script>
</body>
</html>