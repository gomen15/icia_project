<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
</head>

<style>
    body {
          font-family: Arial, sans-serif;
          margin: 0;
          padding: 0;
        }
      
        h1 {
          text-align: center;
          font-style: italic;
          color: #333;
          padding-top: 20px;
        }
      
        table {
          margin: 20px auto;
          width: 400px;
          border-collapse: collapse;
          background-color: #fff;
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
      
        table, th, td {
          border: 1px solid #ccc;
        }
      
        th, td {
          padding: 10px;
          text-align: left;
        }
      
        th {
          background-color: #f2f2f2;
        }
      
        tr:nth-child(even) {
          background-color: #f2f2f2;
        }
      
        tr:hover {
          background-color: #ddd;
        }

</style>
<body>
    <header>
        <jsp:include page="header.jsp"></jsp:include>
    </header>
    <br>
    <br>
<h1><i>구매내역</i></h1>

	<c:forEach items = "${shbDto}" var = "shbDto">
		<table border = "1" style = "border-collapse: collapse;">
			<tr>
				<td>구매번호 : ${shbDto.buynum}</td>
			</tr>
			<tr>
				<td>구매자 : ${shbDto.id}</td>
			</tr>
			<tr>
				<td>구매품목 : ${shbDto.item}</td>
			</tr>
			<tr>
				<td>총금액 : ${shbDto.price}</td>
			</tr>
			<tr>
				<td>구매수량 : ${shbDto.ea}</td>
			</tr>
			<tr>
				<td>구매일자 : ${shbDto.buydate}</td>
			</tr>
		</table>
	</c:forEach>
	<script src="/js/header.js"></script>
	
</body>
</html>