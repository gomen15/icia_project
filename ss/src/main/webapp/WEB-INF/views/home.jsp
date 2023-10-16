<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="/css/header.css">
     <script src = "/js/jquery-3.7.0.min.js"></script>
    <style> 
    #topMenu{
                     
                     height: 30px; /* topMenu의 높이를 30px로 설정(제대로 설정 안하면 아래 내용이 깨짐)*/
                     width: 950px; /*topMenu의 넓이를 850px로 설정(제대로 설정 안하면 브라우져 넓이가 좁아지면 깨짐)*/
					 margin: 0 auto;
       }

 #topMenu ul li {                       /*topMenu의 ID를 가진 태그 안에 <ul> 태그 안에 <li> 태그의 스타일을 지정*/
                                     list-style: none;           /* <li> 태그는 위의 이미지처럼 목록을 나타내는 점을 없앤다 */
                                     color: rgb(14, 13, 13);               /*글씨 색을 흰색으로 설정*/
                                     float: left;                /*<li>태그들이 왼쪽에 흐르게 설정(그러면 아래있는 내용은 오른쪽으로 옴)*/
                                     line-height: 30px;          /* 글씨가 가운데로 오도록 설정하기 위해 한줄의 높이를 30px로 설정*/
                                     vertical-align: middle;     /*세로 정렬을 가운데로 설정(위의 line-height와 같이 설정 필요함)*/
                                     text-align: center;         /*글씨 정렬을 가운데로 설정*/
                             }


#topMenu .menuLink {                               /* topMenu 아이디를 가진 태그 안에 있는 menuLink 클래스 태그들의 스타일 설정*/
                                     text-decoration:none;                      /* 링크(<a> 태그)가 가지는 기본 꾸밈 효과(밑줄 등)을 없앰*/
                                     color: rgb(11, 10, 10);                             /*폰트색을 흰색으로 설정*/
                                     display: block;                            /*링크를 글씨가 있는 부분 뿐만아니라 전체 영역을 클릭해도 링크가 걸리게 설정*/
                                     width: 150px;                              /*메뉴링크의 넓이 설정*/
                                     font-size: 13px;                           /*폰트 사이즈 12px로 설정*/
                                     font-weight: bold;                         /*폰트를 굵게*/
                                     font-family: "Trebuchet MS", Dotum, Arial; /*기본 폰트 적용, 시스템 폰트를 종류별로 순서대로*/
                                     margin-left:20px;
                             }


 #topMenu .menuLink:hover {            /*topMenu 아이디를 가진 태그 안에 menuLink클래스를 가진 태그에 마우스가 over되면 스타일 설정*/
                                     color: rgb(137, 88, 31);                   /* 글씨 색을 붉은색으로 설정*/
                                     background-color: #e0e5ea;   /* 배경색을 조금 더 밝은 회색으로 설정*/
                             }

/*슬라이더*/
 #slider {
  margin: 0 auto;
  width: 1000px;
  max-width: 200%;
}

#slider input[type=radio] {
  display: none;
}

#slider label {
  cursor: pointer;
  text-decoration: none;
}

#slides {
  padding: 10px;/*하얀색 선*/
  border: 2px solid #605f5f;/*슬라이드 얆은 박스 테두리*/
  background:2px soild #fbfafa;/*슬라이드 박스 테두리*/
  position: relative;
  z-index: 2;
  
 
}
#overflow {
  width: 100%;
  overflow: hidden;
}

#slide1:checked ~ #slides .inner{
  margin-left: 0;
}
#slide2:checked ~ #slides .inner{
  margin-left: -100%;
}
#slide3:checked ~ #slides .inner{
  margin-left: -200%;
}
#slide4:checked ~ #slides .inner{
  margin-left: -300%;
}
#slide5:checked ~ #slides .inner{
  margin-left: -400%;
}

#slides .inner {
  transition: margin-left 800ms cubic-bezier(0.0770, 0.000, 0.175, 1.000);
  width: 500%; /* 아이템 수 * 100*/
  line-height: 0;
  height: 200px;
  margin-right:10000px;
} 
/*슬라이드안 글씨*/
#slides .slide {
  width: 20%; /*100 / 아이템 수*/
  float: left;
  display: flex;
  justify-content:center;
  align-items:center;
  height:100%;
  color:#fafafa;
}
/*슬라이드 색깔*/
#slides .slide_1{
    background: url("/images/slider1.png");
    background-size : 1000px 200px;
  
}
#slides .slide_2{
    background: url("/images/slider2.png");
    background-size : 1000px 200px;
   
}
#slides .slide_3{
  background: url("/images/slider3.png");
  background-size : 1000px 200px;
}
#slides .slide_4{
  background: url("/images/slider4.png");
  background-size : 1000px 200px;
}

#slides .slide_5{
  background: url("/images/slider5.png");
  background-size : 1000px 190px;
}


.slide-content {
  padding: 0px;
}

#controls {
  margin: -130px 0 0 0;
  width: 100%;
  height: 50px;
  z-index: 3;
  position: relative;
 
  
}

#controls label svg {
    fill: #000;
    color: #000;
}


#controls label {
  transition: opacity 0.2s ease-out;
   display: none; 
  width: 50px;
  height: 50px;
  opacity: .4;
 
}
#controls label:hover {
  opacity: 1;
}
/* 슬라이드 컨트롤 아이콘 (좌우 화살표)에 대한 스타일 */
#slide1:checked ~ #controls label:nth-child(2),
#slide2:checked ~ #controls label:nth-child(3),
#slide3:checked ~ #controls label:nth-child(4),
#slide4:checked ~ #controls label:nth-child(5),
#slide5:checked ~ #controls label:nth-child(1)
{
 
  float: right;
  margin: 0 -50px 0 0;
  display: block;
  
 
}
#slide1:checked ~ #controls label:nth-child(5),
#slide2:checked ~ #controls label:nth-child(1),
#slide3:checked ~ #controls label:nth-child(2),
#slide4:checked ~ #controls label:nth-child(3),
#slide5:checked ~ #controls label:nth-child(4)

#bullets{
 float: left;
 margin: 0 0 0 -50px;
 display: block;
 transform: rotate(180deg);

 

}

#bullets {
  margin: 180px 0 0;
  text-align: center;
 
}

#bullets label {
  position: relative;
  display: inline-block;
  width: 10px;
  height: 10px;
  border-radius: 100%;
  background: #ccc;
  margin: 0 10px;/* 버튼 간격*/
  top:-80px;
  
}

#slide1:checked ~ #bullets label:nth-child(1),
#slide2:checked ~ #bullets label:nth-child(2),
#slide3:checked ~ #bullets label:nth-child(3),
#slide4:checked ~ #bullets label:nth-child(4),
#slide5:checked ~ #bullets label:nth-child(5)
{
  background: #333;
}
.text1{
  opacity: 0;
}
.text2{
  opacity: 0;
}
.text3{
  opacity: 0;
}
.text4{
  opacity: 0;
}
.text5{
  opacity: 0;
}
     </style>
</head>

<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
      <!-- 메뉴 영역 -->
      <nav id="topMenu" >   
          <ul>
                  <li><a class="menuLink" href="/board/list">게시판</a></li>
                  
               <c:choose>
			        <c:when test="${hos.code != null}">
					<li><a class="menuLink" href="/hospital/myhos">내병원</a></li>
				    </c:when>
			        <c:otherwise>   
			        	<li><a class="menuLink" href="/hospital">동물병원</a></li>
			        </c:otherwise>
			    </c:choose>
                  <li><a class="menuLink" href="/shopping/list">쇼핑</a></li>
                  <li><a class="menuLink" href="/auction/list">경매</a></li>
                  <li><a class="menuLink" href="/shelter/list">유기견 보호소</a></li>
          </ul>
       </nav>
  
  <!-- 슬라이더 영역 -->
  
      <div id="slider" ;>
  
          <input type="radio" name="slider" id="slide1" checked>
          <input type="radio" name="slider" id="slide2">
          <input type="radio" name="slider" id="slide3">
          <input type="radio" name="slider" id="slide4">
          <input type="radio" name="slider" id="slide5">
      
          <div id="slides">
            <div id="overflow">
              <div class="inner">
      
                <div class="slide slide_1">
                  <div class="slide-content">
                  </div>
                </div>
      
                <div class="slide slide_2">
                  <div class="slide-content"> 
                    <img class="ss2" >
                  </div>
                </div>
      
                <div class="slide slide_3">
                  <div class="slide-content">
                    <img class="ss3" >
                  </div>
                </div>
      
                <div class="slide slide_4">
                  <div class="slide-content">
                  </div>
                </div>
      
                <div class="slide slide_5">
                  <div class="slide-content">
                    
                  </div>
                </div>
      
              </div>
            </div>
          </div>
          
          <div id="controls">
            <label for="slide1"><img src="/images/rightarrow.png"></label>
            <label for="slide2"><img src="/images/rightarrow.png"></label>
            <label for="slide3"><img src="/images/rightarrow.png"></label>
            <label for="slide4"><img src="/images/rightarrow.png"></label>
            <label for="slide5"><img src="/images/rightarrow.png"></label>
          </div>
          <div id="bullets">
              <!-- 수정: JavaScript 함수 호출을 위한 onclick 속성 추가 -->
              <label><a href="#" onclick="changeSlide('slide1')" class="text1">Bullet 1</a></label>
              <label><a href="#" onclick="changeSlide('slide2')"class="text2">Bullet 2</a></label>
              <label><a href="#" onclick="changeSlide('slide3')"class="text3">Bullet 3</a></label>
              <label><a href="#" onclick="changeSlide('slide4')"class="text4">Bullet 4</a></label>
              <label><a href="#" onclick="changeSlide('slide5')"class="text5">Bullet 5</a></label>
          </div>
        </div>
  	<script src="/js/header.js"></script>
      <script>
          // bullets 라벨 클릭시 해당 슬라이드 변경하는 script
          function changeSlide(slideId) {
              // 해당 라디오 버튼을 선택
              document.getElementById(slideId).checked = true; 
          }
      </script>
</body>
</html>