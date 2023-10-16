<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
    <button id="membtn">유저관리</button>
    <button id="hosbtn">병원관리</button>
    <div class="btn-area">
        <div class="paging">${paging}</div>
    </div>
    <script>
        $(document).ready(function(){
        $("#membtn").click(function(){
            location.href = "admin/memberList";
        });
        $("#hosbtn").click(function(){
            location.href = "admin/hosList"
        });
    });
    </script>
</body>
</html>