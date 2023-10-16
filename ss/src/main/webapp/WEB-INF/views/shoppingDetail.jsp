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
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src ="/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<head>
<link rel="stylesheet" href="/css/style.css">
<style>
    table{
        border:none;
    }

    h1{
    	right:50px;
        position: relative;

    }
    
    /*회색바*/
    .box{
        position: relative;
        top:50px;
        width:700px;
        height:710px;
        
    }
   
     /*전체 위치조정, 박스*/
    .card{
        position: relative;
        top:200px;
        left:600px;
        padding-top:20px;
        padding-left:160px;
    
        width:810px;
        height:1600px;
        padding-left:50px;
        border-style :solid
        
    }


     /*상품목록*/
     .list{
        position: relative;
        padding:5px;
        left: 320px;
        background-color: black;
        color: #ffff;
        border-radius: 20px;
        font-size: 18px;
        cursor: pointer; /* 커서 모양 변경 */
        box-shadow: 3px 3px 3px 3px gray;
     }
     /*상품명 선*/
     .item{
        position: relative;
        top:200px;
        width:700px;
        height:2px;
        background-color: gray;
        
        border: gray;
        /* 상품명 칸 */
     }
 
     .checkcart{
        background-color: black;
        color: #ffff;
        border-radius: 10px;
        cursor: pointer; /* 커서 모양 변경 */
     }
     .itembuy{
		background-color: black;
        color: #ffff;
        border-radius: 10px;
        cursor: pointer; /* 커서 모양 변경 */
     }
     /*가격 위치*/
     #price{
        position: relative;
        width: 100px;
        height: 150px;
        margin-left:20px;
        font-size: 30px;
      

     }
    
     
     /* 구매,장바구니 버튼*/
   .buy{
    position: relative;
    margin: 40px;
   }
   .item-price{
    position: relative;
    font-size: 30px;
    
   }

    .itemname{
        position: relative;
        width: 100px;
        height: 150px;
        font-size: 30px;
    }
   
    </style>
</head>
  <header>
        <jsp:include page="header.jsp"></jsp:include>
    </header>
<div class="card" style="box-shadow:3px 3px 3px 3px gray; border-radius: 20px;">
<h1>상품 상세보기</h1><br>
				<img src="${imageUrl}"style="height:600px; width:700px;">
            <table border="1"class="box" style="box-shadow:3px 3px 3px 3px gray; border-radius: 20px;">
			<tr align = "center">
			<td>상품명</td>
			<td>${shoppingDto.item}</td>
			</tr>
			<tr>
            <td>가격:<fmt:formatNumber value="${shoppingDto.price}" pattern="###,###,###" var="formattedPrice" /></td>
			<td>${formattedPrice}</td>
			</tr>
			<tr>
            <br><td>상품내용: <br>${shoppingDto.sh_content}</td>
            </tr>
					<br><tr align ="center" class="buy">
						<td colspan="2">
							<form id = "checkbuy" name = "form1" method="get" action="/shopping/buy">
								<input type ="hidden" name ="id" value ="${mb.id}">
								<input type="hidden" name="item" value="${shoppingDto.item}">
								<input type = "hidden" name = "price" id = "price">
								<input type = "hidden" name = "ea" id = "ea2">
								<input type="submit" class="btn btn-primary" value="구매하기">
							</form>
	                        <form method = "post" action = "/shopping/addcart">
	                        	<input type = "hidden" value = "${shoppingDto.item}" name = "item">
	                        	<input type = "hidden" value = "${mb.id}" name = "id">
	                        	<select name="ea" id="ea">
								  <c:forEach begin="1" end="${shoppingDto.ea}" var="i">
								    <option value="${i}">${i}</option>
								  </c:forEach>
								</select>개
								<input type="submit" class="btn btn-success" id="checkcart" value="장바구니에 담기">
	                        </form>
						</td>
					</tr>
	
		</table>
</div>
<script>
	
    $('#checkcart').click(function(event) {
	    var ea = $('#ea').val(); // 선택한 값 가져오기
	    var price = ${shoppingDto.price}; // 상품 가격 가져오기
	    var total = ea * price; // 계산
	
	    // 계산된 가격을 hidden 필드와 해당 위치의 모든 input 필드에 설정
	    $("#price").val(total);
	    $('#ea2').val(ea);
    	if (confirm("상품을 장바구니에 담곘습니까?")) {
	
    	} else {
    		event.preventDefault();
    	}
    });
    
    $('#checkbuy').click(function(event) {   
	    var ea = $('#ea').val(); // 선택한 값 가져오기
	    var price = ${shoppingDto.price}; // 상품 가격 가져오기
	    var total = ea * price; // 계산
	
	    // 계산된 가격을 hidden 필드와 해당 위치의 모든 input 필드에 설정
	    $("#price").val(total);
	    $('#ea2').val(ea);
    	if (confirm("상품을 구매하시겠습니까?")) {
    		
    	} else {
    		event.preventDefault();
    	}
    });
	// 계산 함수 정의
	
</script>
</body>
</html>