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
        top:100px;
        left:600px;
        padding-top:20px;
        padding-left:160px;
    
        width:810px;
        height:650px;
        padding-left:50px;
        border-style :solid
        
    }

    #sh_content{
        height: 200px;
        width: 500px;
    }
     .text{
        position: relative;
		top:20px;
		margin-right:230px;        
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
     .text{
        position: relative;
        left:120px;
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
    <h1>쇼핑몰 상품 수정</h1>
    <form action="/shopping/update" method="post" enctype="multipart/form-data">
        <div class="text"><label for="item">상품명:</label>
        <input type="text" id="item" name="item" value = "${shDto.item}" readonly style="box-shadow:3px 3px 3px 3px gray inset; border-radius: 20px;"><br><br>
        
        <label for="price">가격:</label>
        <input type="text" id="price" name="price" value = "${shDto.price}" maxlength = "20" style="box-shadow:3px 3px 3px 3px gray inset; border-radius: 20px;"><br><br>
        
        <label for="ea">수량:</label>
        <input type="text" id="ea" name="ea" value = "${shDto.ea}" maxlength = "6" style="box-shadow:3px 3px 3px 3px gray inset; border-radius: 20px;"><br><br>
        
        <label for="sh_content">상품 설명:</label><br>
        <textarea id="sh_content" name="sh_content" rows="4" cols="50" style="box-shadow:3px 3px 3px 3px gray inset; border-radius: 20px;">${shDto.sh_content}</textarea><br><br>
        
        <label for = "attachments">업로드</label>
		<input type = "file" name="attachments" id="attachments" accept=".jpg, .jpeg, .png, .gif">
        <input type = "hidden" class="upload-name" value="파일선택" readonly><br>
        <p>※변경할 이미지가 없으시다면 첨부하지 말아주세요.※</p>
    </div>
        <br><input type="submit" class="btn btn-success" value="작성">
      
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
    <footer>
        <jsp:include page="footer.jsp"></jsp:include>
    </footer>
</div>
</body>
</html>