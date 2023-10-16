<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 상품 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<link rel="stylesheet" href="/css/style.css">
<style>

    h1{
        position: relative;
        left: 120px;

    }
    #item{
        width:170px;
    }
    /*회색바*/
    .box{
        position: relative;
        top:270px;
        left:700px;
        width:1040px;
        height:3px;
        
    }
   
     /*전체 위치조정, 박스*/
    .ss{
        position: relative;
        top:200px;
        left:600px;
        padding-top:20px;
    
        width:810px;
        height:650px;
        border-style :solid;
        padding-right:250px;
    }

    #sh_content{
        height: 200px;
        width: 500px;
    }
     .text{
        position: relative;
        top:20px;
        left:120px;
        
     }
     .on{
        position: relative;
        left: 135px;
        background-color: black;
        color: #ffff;
        border-radius: 10px;
        cursor: pointer; /* 커서 모양 변경 */
     }
     .upload-name{
    
        background-color: black;
        color: #ffff;
        border-radius: 10px;
        
     }
     #item{
        padding-left:10px;
        border: gray;
     }
     #price{
        padding-left:10px;
        border:  gray;
     }
     #ea{
        padding-left:10px;
        border: gray;
     }
    </style>
<script>
let m='${msg}';
if(m!=''){
	alert(m)
}
</script>
</head>


<body>
<div class="wrap">
    <header>
        <jsp:include page="header.jsp"></jsp:include>
    </header>
    <div class="box">
    </div>
  
    <table>
       <div class="ss" style="box-shadow:3px 3px 3px 3px gray; border-radius: 20px;">
    <h1>쇼핑몰 상품 작성</h1>
    
    <form action="/shopping/write" method="post" enctype="multipart/form-data">
        <div class="text">
       
       <label for="item">상품명:</label>
        <input type="text" id="item" name="item" placeholder="상품명" style="box-shadow:3px 3px 3px 3px gray inset; border-radius: 20px;"><br><br>
       

       
        <label for="price">가격:</label>
        <input type="text" id="price" name="price" maxlength = "20" placeholder="가격" style="box-shadow:3px 3px 3px 3px gray inset; border-radius: 20px;"><br><br>
       

        
        <label for="ea">수량:</label>
        <input type="text" id="ea" name="ea" maxlength = "6" placeholder="수량" style="box-shadow:3px 3px 3px 3px gray inset; border-radius: 20px;"><br><br>
       

        
        <label for="sh_content">상품 설명:</label><br>
        <textarea id="sh_content" name="sh_content" rows="4" cols="50" placeholder="설명은 최대 500자 입니다!"style="box-shadow:3px 3px 3px 3px gray inset; border-radius: 10px;"></textarea><br><br>
       
          <label for = "attachments">업로드</label>
		<input type = "file" name="attachments" id="attachments" accept=".jpg, .jpeg, .png, .gif">
        <input type = "hidden" class="btn btn-primary" value="파일선택"><br><br><br>
    </div>
        <input type="submit" class="on" value="작성">
    </form>
</div>
</table>
    <script>
	$('#attachments').on('change', function() {
		//파일 선택 후 열기 버튼을 누르면 change event 발생
		console.log($('#attachments'));
		let files = $('#attachments')[0].files;
		console.log(files);
		
		let fileName = '';
		if(files.length > 1) {
			fileName = files[0].name + ' 외 ' + (files.length-1) + '개';
		} else if(files.length == 1) {
			fileName = files[0].name;
		} else {
			fileName = "파일 선택";
		}
		$(".upload-name").val(fileName);
	});
	
    // 숫자만 입력 가능하도록 정규식을 적용
    $(document).ready(function () {
        $('#price, #ea').on('input', function () {
            // 입력값에서 숫자 이외의 문자를 모두 제거
            $(this).val($(this).val().replace(/[^0-9]/g, ''));
        });
    });
    </script> 
    <script src="/js/header.js"></script>
</div>
</body>
</html>
