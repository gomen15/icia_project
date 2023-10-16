
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<style>
        /* 작은 카드 스타일 */
        .small-card {
          border: 1px solid #ccc;
          padding: 10px;
          margin: 5px;
          width: 200px;
          display: inline-block;
          vertical-align: top;
        }
      
        /* 이미지 스타일 */
        .small-card img {
          width:170px; 
          height: 170px;
          display: block;
        }
      
        /* 카트 제목 스타일 */
        .small-card .card-title {
          font-size: 14px;
          margin-top: 5px;
        }
      
        /* 구매 개수 스타일 */
        .small-card .ea {
          font-size: 12px;
          color: #888;
          margin-top: 5px;
        }
      
        /* 구매하기 버튼 스타일 */
        .small-card .itembuy {
          display: block;
          width: 100%;
          padding: 5px;
          background-color: #007bff;
          color: #fff;
          border: none;
          cursor: pointer;
          font-size: 14px;
          margin-top: 5px;
        }
      
        /* 삭제 버튼 스타일 */
        .small-card .delete {
          background-color: #ff3333;
          color: #fff;
          border: none;
          padding: 3px 8px;
          cursor: pointer;
          font-size: 12px;
          margin-top: 5px;
        }
      </style>


</head>
<body>

	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	<h1>장바구니</h1>
	<br>
	<br>
	    <div class="row">
        <div class="row justify-content-center">
          <c:forEach items="${cartItems}" var="shoppingcart">
            <div class="small-card">
              <div class="card">
                <c:choose>
                  <c:when test="${shoppingcart.sysFileName != null}">
                    <form action="/shopping/detail" method="post">
                      <a href="/shopping/detail?item=${shoppingcart.item}">
                        <img src="${shoppingcart.sysFileName}" class="card-img" alt="Image">
                      </a>
                    </form>
                  </c:when>
                  <c:otherwise>
                    <p class="card-text">이미지가 없습니다!</p>
                  </c:otherwise>
                </c:choose>
                <div class="ea">
                  <div class="card-body">
                    <h5 class="card-title">상품명▷ ${shoppingcart.item}</h5>
                    <h6 name="ea" class="ea">
                      구매 개수 ${shoppingcart.ea} 개
                    </h6>
                  </div>
                  <!-- 수량 조정 form -->
                  <form method="get" action="/shopping/buy">
                    <input type="hidden" name="id" value="${mb.id}">
                    <input type="hidden" name="item" value="${shoppingcart.item}">
                    <input type="hidden" name="ea" value="${shoppingcart.ea}">
                    <input type="hidden" name="price" value="${shopping.price}">
                    <input type="submit" class="btn btn-primary"id="itembuy" value="구매하기">
                  </form>
                  <form method="post" action="/shopping/delcart">
                    <input type="hidden" name="id" class="update_id" value="${mb.id}">
                    <input type="hidden" value="${shoppingcart.item}" name="item">
                    <button class="btn btn-primary"id="delete">삭제</button>
                  </form>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
	<script>
		$('.delete').click(function(event) {
			if (confirm("삭제하시겠습니까?")) {
				alert("삭제 성공했습니다")
			} else {
				event.preventDefault();
			}
		});
	</script>
	<script src="/js/header.js"></script>
</body>
</html>
