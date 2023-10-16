<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
     <c:forEach items = "${hList}">
        <table border="1">
        <tr>
            <td>코드: ${hos.code}</td>
            <td>병원명: ${hos.hostitle}</td>
            <td>병원번호: ${hos.hosphone}</td>
            <td>병원주소: ${hos.hosaddr}</td>
            <td>영업시간: ${hos.hoshour}:${hos.hosmin} ~ ${hos.hoshour2}:${hos.hosmin2}</td>
            <td>분류: ${hos.hostype}</td>
        </tr>
        <button onclick = "location.href='/hos/delete?code=${hos.code}'">삭제</button>
    </table>    
    </c:forEach>
    
     <div class="container">
        <!-- Button to Open the Modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
            코드발행
        </button>
        
        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">병원코드 발급</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <label for="numberInput">코드</label>
                        <input type="text" id="numberInput">
                        <button type="button" class="btn btn-primary" id="generateButton">병원코드 생성</button>
                        <p id="randomNumber"></p>
                    </div>
                    
                    <!-- Modal Footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    
    <script>
    $(document).ready(function(){
            var modal = $("0");
            var codelInput = $("hos.code");
        })
    
    $(document).ready(function(){
        $("#generateButton").click(function(){
            var userInput = parseInt($("#numberInput").val());
            var randomNum = Math.floor(Math.random() * (userInput - 1 + 1)) + 1;
            $("#randomNumber").text("Random Number: " + randomNum);
        
            let code = $('#code').val();

            $.ajax({
                method : 'POST',
                url : '/admin/codeInsert',
                data : { code : code },
            }).done(function(res){
            if(res === true) {
                alert("코드 발행에 성공했습니다!");
            } else {
                alert("코드 발행에 실패했습니다!");
            }
            }).fail(function(err){
                alert("서버에서 오류가 났어요!");
            })
        });
    });
    </script>
</body>
</html>