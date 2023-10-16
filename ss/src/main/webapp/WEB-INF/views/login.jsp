<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <title>login</title>
     <link rel="stylesheet" href="/css/header.css">
	
    <script>
		$(() => {
			//로그인 실패 메세지
			let m = '${msg}';
			if(m != '') {
				alert(m)
			}
		})
	</script>
	
    <style> 
		 .logo {
            background-image: url('/images/main_logo.png');
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            min-width: 200px;
            min-height: 80px; 
        }
        .search1 {  
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh; /* 화면 높이에 따른 세로 중앙 정렬 */
            margin: 0;
           
        }  
        
        .logbox{
            position: relative;
            width:600px;
            height:680px;
            border-radius: 20px;
            background-color:rgb(255, 255, 255);
            box-shadow: 5px 5px 5px 5px rgb(150, 149, 149);
            margin-top:40px;
             /*로그인 영어 글씨*/
             text-align: center;
             padding-top:2px;
             font-size:20px;
             left:20px;

        }
        
		#ddd{
	        display: flex;
	        text-align: center;
	        justify-content: center;
	        align-items: center;
        }
        
        /*일반회원 글씨*/
       .box-text{
	        text-align: left;
	        font-size:20px;
	        padding-left: 100px;
	        margin-top:20px;
       }
       
               /*아이디,패스워드 박스*/
       .text-field{
        position: relative;
        background-color: #ffff;
        width:400px;
        height: 50px;
        margin-left:10px;
        margin-top:-40px;
        margin-bottom:25px;
        top:30px;
        border-radius: 30px;
        border:none;/*선테두리 없애는거*/
        box-shadow: inset 7px 2px 10px #babebc, inset -5px -5px 12px #fff;
        /*박스 안 그림자*/
        display: inline-block;
        padding-left:20px;

       }
      
        /*로그인 버튼*/
       .submit-btn{
        position: relative;
        background-color: #0a0a0a;
        width:400px;
        height: 57px;
        margin-left:14px; 
        top:60px;
        border-radius: 30px;
        color:#fff;
        font-size:18px;
        cursor: pointer; /* 커서 모양 변경 */
       }
        /*회원가입*/
       .Loginmembership{
        position: relative;
        top:-30px;
        right:40px;
        cursor: pointer; /* 커서 모양 변경 */
        font-size:15px;
        }
        
        /*비번찾기*/
       #Loginpassword{
        position: relative;
        top:-50px;
        left:40px;
        cursor: pointer; /* 커서 모양 변경 */
        font-size:15px;
       }
    
       .active {
        background-color: #0a0a0a;
        color : white;
       }
     </style>
     
</head>
<body>
<section>

  <!-- 로고 영역 -->
  <div id="praction.html"></div>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>
      <div class="search1">
        <a href = "/"><img class="logo" src="/images/main_logo.png"></a>
 <!-- 로그인 박스 영역 -->
 <div class="logbox">
    <h1>Login</h1>
    <div>------------------</div>
    <button id="normal" class="box-text">일반회원</button>
    <button id="hospital" class="box-text">병원회원</button><br>
    
    <form id = "nor-form" action="/member/login" method="post">
      <input type="text" name="id" class="text-field" placeholder="아이디">
      <input type="password" name="pw" class="text-field" placeholder="비밀번호">
      <button type="submit" value="Login" class="submit-btn" >로그인</button><br><br><br><br><br>
    </form>
    <div class="Loginmembership mem"> <a href = "/member/join">회원가입</a></div>
    <div id="Loginpassword" class="mem">|<a href = "/member/findPw1">비밀번호찾기</a></div>

    <form id = "hos-form" action = "/hos/login" method = "get">
      <input type="text" name="code" class="text-field" placeholder="코드">
      <button type="submit" value="Login" class="submit-btn" >로그인</button><br><br><br><br><br>
    </form>
    <div class="Loginmembership hos" style = "margin-left : 95px;"><a href = "/hos/join">회원가입</a></div>
    </div>
  </div>
</section>
  
  <script src="/js/header.js"></script>
  <script>
    $('#normal').addClass('active');
    $('#hos-form').hide();
    $('.hos').hide();
    $('#normal').click(()=>{
      $('#nor-form').show();
      $('#hos-form').hide();
      $('.mem').show();
      $('.hos').hide();
      $('#normal').addClass('active');
      $('#hospital').removeClass('active');		
    })
    $('#hospital').click(()=>{
      $('#hos-form').show();
      $('#nor-form').hide();
      $('.mem').hide();
      $('.hos').show();
      $('#normal').removeClass('active');
      $('#hospital').addClass('active');
    })
    </script>  
  </body>
</html>