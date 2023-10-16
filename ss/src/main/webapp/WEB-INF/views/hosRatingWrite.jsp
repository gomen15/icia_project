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
<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>
    
<form action="/hosRating/write" method="post">
	<input type="hidden" value="${id}" name="id">
	<input type="hidden" value="${code}" name="code">
	<input type="text" name="review">
	<select name="rating">
		<option value="1">1점</option>
		<option value="2">2점</option>
		<option value="3">3점</option>
		<option value="4">4점</option>
		<option value="5">5점</option>
		<option value="6">6점</option>
		<option value="7">7점</option>
		<option value="8">8점</option>
		<option value="9">9점</option>
		<option value="10">10점</option>
	</select>
	<button type="submit">작성</button>
</form>

<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script src="/js/header.js"></script>
</html>