<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>shelter Detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="/js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<div>
    <div>
        <div>
            <div>
                <h4 class="card-title">${sDto.s_title}</h4>
                <p>${sDto.s_date}</p>
                <p>${sDto.s_date2}</p>
                <p>${sDto.s_age}</p>
                <p>${sDto.s_gender}</p>
                <p>${sDto.s_genetic}</p>
                <p>${sDto.s_weight}</p>
                <p>${sDto.s_views}</p>
                <c:choose>
                <c:when test = "${sDto.sysFileName != null}">
                <img src = "${imageUrl}">
                </c:when>
                <c:otherwise>
                	<p>이미지가 없습니다.</p>
                </c:otherwise>
                </c:choose>
                <div class="btn-area">
                    <button class="btn-write" id="upbtn" onclick="update_shelter('${sDto.snum}')">갱신</button>
                    <button class="btn-write" id="delbtn" onclick="delete_shelter('${sDto.snum}')">삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>
<form id="rform">
    <input type="hidden" name="snum" id="snum" value="${sDto.snum}">
    <textarea name="sr_content" rows="3" class="btn" id="sr_content" placeholder="댓글을 적어주세요."></textarea>
    <input type="hidden" name="r_id" id="r_id" value="${mb.id}">
    <input type="button" value="댓글 작성" class="btn" onclick="replyInsert()">
</form>
<table id="rtable">
    <c:forEach var="ritem" items="${rList}">
        <tr>
            <td>${ritem.id}</td>
            <td>${ritem.sr_content}</td>
            <td>
                <fmt:formatDate value="${ritem.sr_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
            </td>
        </tr>
    </c:forEach>
</table>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script src="/js/header.js"></script>
<script>
    let mid = '${mb.type}';
    if(mid === 'admin') {
        $('#upbtn').show();
        $('#delbtn').show();
    } else {
        $('#upbtn').hide();
        $('#delbtn').hide();
    }

    function update_shelter(snum) {
        location.href = '/shelter/update?snum=' + snum;
    }

    function delete_shelter(snum) {
        // 게시글 삭제
        let conf = confirm("게시글을 정말로 삭제하시겠습니까?");
        if(conf === true) {
            location.href = '/shelter/delete?snum=' + snum;
        }
    }

    function replyInsert() {
			var formData = {
                snum: $('#snum').val(),
                sr_content: $('#sr_content').val(),
                id: $('#r_id').val()
            };

        $.ajax({
            method: 'post',
            url: '/shelter/replyInsert',
            data: formData,
        }).done(function (res) {
            console.log("res:", res); // 댓글 정보

            updateReplyList(res);

            $('#rtable tbody').prepend(newReply);

            $('#sr_content').val('');
        }).fail(function (res) {
            console.log("err:", res);
        });
    }
    
    function updateReplyList(res) {
        var table = $('#rtable tbody');

        // 새로운 댓글 행 생성
        var newReply = $('<tr>');
        newReply.append('<td>' + res.id + '</td>');
        newReply.append('<td>' + res.sr_content + '</td>');
        newReply.append('<td>' + res.sr_date + '</td>');
        newReply.append('</tr>');

        // 테이블에 새 행 추가
        table.prepend(newReply);
    }
</script>
</html>
