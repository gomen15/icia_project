<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="/css/header.css">
    <style>
    	.logo {
            background-image: url('/images/main_logo.png');
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            min-width: 200px;
            min-height: 80px; 
        }
        #search1 {  
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
           
        }  
    
        .card {
            display: flex;
            top : 25px;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
            max-width: 400px; /* 카드 전체의 최대 너비 조절 */
            margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
            border: 1px solid #ccc; /* 카드 테두리 설정 */
            padding: 20px;
        }

        .card-image {
            max-width: 200px;
            max-height: 300px;
            margin-right: 20px; /* 이미지와 텍스트 사이 여백 조절 */
        }

        .card-text {
            flex-grow: 1; /* 텍스트 영역이 남은 공간을 모두 차지하도록 설정 */
        }

        #btn {
            text-align: center; /* 버튼 가운데 정렬 */
            display: block; /* 버튼을 블록 레벨 요소로 변환하여 가운데 정렬 적용 */
            margin: 20px auto 0; /* 버튼 상단 여백 및 가운데 정렬 */
        }
    </style>
</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	
	<div id="search1">
		<a href = "/"><img class="logo" src="/images/main_logo.png"></a>
	</div>
    <div class="card">
        <img src="${imageUrl}" class="card-image">
        <div class="card-text">
            <div>코드: ${hos.code}</div>
            <div>병원명: ${hos.hostitle}</div>
            <div>병원번호: ${hos.hosphone}</div>
            <div>병원주소: ${hos.hosaddr}</div>
            <div>시작시간: <span id="start-time"></span></div>
            <div>종료시간: <span id="end-time"></span></div>
            <div>예약단위: ${hos.mincheck}</div>
            <div>병원종류: ${hos.hostype}</div>
        </div>
        <div><a href="/profile/hos/update" id="btn">수정</a></div>
    </div>
	<script>
		function formatWithLeadingZero(number) {
			return (number < 10 ? "0" : "") + number;
		}
		
		var hoshour = ${hos.hoshour};
		var hosmin = ${hos.hosmin};
		var hoshour2 = ${hos.hoshour2};
		var hosmin2 = ${hos.hosmin2};
		
		document.getElementById("start-time").textContent = formatWithLeadingZero(hoshour) + ":" + formatWithLeadingZero(hosmin);
		document.getElementById("end-time").textContent = formatWithLeadingZero(hoshour2) + ":" + formatWithLeadingZero(hosmin2);
	</script>
	<script src="/js/header.js"></script>
</body>
</html>