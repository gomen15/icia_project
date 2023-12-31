<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>병원예약</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="/js/jquery-3.7.0.min.js"></script>
     <link rel="stylesheet" href="/css/style.css">
    <style>
        #form {
        	 position: relative;
        top:200px;
        left:700px;
        padding-top:20px;
        padding-left:160px;
    
        width:500px;
        height:500px;
        padding-left:50px;
        border-style :solid
        }
        .line {
         position: relative;
          right:30px;
        }
        .warning {
        	color : red;
        }
    </style>
    
    <script>
		$(() => {
			let m = '${msg}';
			if(m != '') {
				alert(m)
			}
		})
	</script>
</head>
<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>
    <form id="form" action="/reserves_hospital/check" method="POST"  style="box-shadow:3px 3px 3px 3px gray; border-radius: 20px;">
        <legend style = "font-size : 30px; width:90%;">※${hosL.hostitle}※</legend>
        <div class = "line">
        <input type = "hidden" value = "${hosL.code}" name = "code">
        <input type = "hidden" value = "${mb.id}" name = "id">
        <br>동물종류: <input type = "text" name = "dogtype" maxlength="20" required><br>
        ex) 강아지,고양이,도마뱀 등<br>
        <br>예약사유: <select name = "h_pro">
            <option value = "질병">질병</option>
            <option value = "상해">상해</option>
            <option value = "미용">미용</option>
        </select>
        <br>기간선택: <input type="date" id="datePicker" name="datePicker"><br>
        <label for="minSelect">시간선택:</label>
        <select id="minSelect" name="minSelect"></select><br>
        
         <br><div id="timeError" style="color: red; display: none;"></div>
       진료동물: 
        <select name = "animal" id = "animal">
	    <c:if test="${empty pro.animal}">
	        <option id="none">없음</option>
	    </c:if>
        <c:forEach items="${pro.animal}" var="animal">
        	<option>${animal}</option>
        </c:forEach>
        </select>
        <br> <br><div class = "warning">※ 진료동물 선택을 위한 동물 프로필이 존재하지 않을경우 반려동물에 대한 프로필 생성이 필요합니다.</div>
        <br><input type="submit" class="btn btn-success">
         <input type="hidden" id="checkdate" name="checkdate" value="">
        </div>
    </form>
	
    <script>
    // Initialize Flatpickr date picker
    const datePicker = flatpickr("#datePicker", {
        minDate: "today", // Set minimum date to today
        enableTime: false,
        maxDate: new Date().fp_incr(14),
        dateFormat: "Y-m-d",
    });

    const minHour = ${hosL.hoshour};
    const maxHour = ${hosL.hoshour2};
    const minMin = ${hosL.hosmin};
    const maxMin = ${hosL.hosmin2};
    const interval = ${hosL.mincheck};
    
    console.log("minHour:",minHour);

    // Populate minute select options
    const minSelect = document.getElementById("minSelect");
    populateMinuteSelect(minHour);

    // Event listener for date selection
    document.getElementById("datePicker").addEventListener("change", function() {
        populateMinuteSelect();
    });

    const reservedTimes = [
        <c:forEach items="${hoslist}" var="dto" varStatus="status">
            "${dto.checkdate}"<c:if test="${not status.last}">,</c:if>
        </c:forEach>
    ];


    // ...

	// Function to populate minute select options
	function populateMinuteSelect() {
	    minSelect.innerHTML = "";
	
	    const selectedDate = document.getElementById("datePicker").value; // Get selected date
	
	    if (!selectedDate) {
	        return; // If no date is selected, do nothing
	    }
	
	    const startHourInMinutes = minHour * 60 + minMin;
	    const endHourInMinutes = maxHour * 60 + maxMin;
	
	    for (let minutes = startHourInMinutes; minutes <= endHourInMinutes; minutes += interval) {
	        const hour = Math.floor(minutes / 60);
	        const minute = minutes % 60;
	
	        const checkdate = new Date(selectedDate);
	        checkdate.setHours(hour);
	        checkdate.setMinutes(minute);
	
	        const time = (hour < 10 ? "0" : "") + hour + ":" + (minute < 10 ? "0" : "") + minute;
	
	        const yearMonthDay = checkdate.toISOString().substr(0, 10);
	        const reservedTime = yearMonthDay + " " + time + ":00"; // Include seconds
	
	        // Check if the reservedTimes array includes the reservedTime
	        if (!reservedTimes.includes(reservedTime)) {
	            const option = document.createElement("option");
	            option.value = time;
	            option.textContent = time;
	            minSelect.appendChild(option);
	        }
	    }
	}

    document.getElementById("form").addEventListener("submit", function(event) {
        const selectedDate = document.getElementById("datePicker").value;
        const selectedMinInMinutes = minSelect.value.split(":").map(part => parseInt(part)).reduce((acc, val, idx) => idx === 0 ? acc + val * 60 : acc + val, 0);

        if (!selectedDate || isNaN(selectedMinInMinutes)) {
            alert("년월일과 시간을 선택해주세요.");
            event.preventDefault();
            return;
        }

        const selectedHour = Math.floor(selectedMinInMinutes / 60);
        const selectedMin = selectedMinInMinutes % 60;

        const selectedDateTime = new Date(selectedDate);
        selectedDateTime.setHours(selectedHour);
        selectedDateTime.setMinutes(selectedMin);

        const now = new Date();

        const startTime = new Date(selectedDate);
        startTime.setHours(minHour);
        startTime.setMinutes(minMin);
        startTime.setSeconds(0);

        const endTime = new Date(selectedDate);
        endTime.setHours(maxHour);
        endTime.setMinutes(maxMin);
        endTime.setSeconds(0);

        if (selectedDateTime < now || selectedDateTime < startTime || selectedDateTime > endTime) {
            const errorDiv = document.getElementById("timeError");
            if (selectedDateTime > endTime) {
                errorDiv.textContent = "올바른 시간과 날짜를 선택해주세요.";
            } else {
                errorDiv.textContent = "올바른 시간과 날짜를 선택해주세요.";
            }
            errorDiv.style.display = "block";
            setTimeout(function() {
                errorDiv.style.display = "none";
            }, 3000);
            event.preventDefault();
        } else if ($('#animal').val() === "없음") {
            alert('지정된 동물이 존재하지 않습니다.');
            event.preventDefault();
        } else {
            const checkdate = selectedDate + " " + (selectedHour < 10 ? "0" : "") + selectedHour + ":" + (selectedMin < 10 ? "0" : "") + selectedMin + ":00";
            document.getElementById("checkdate").value = checkdate;

            alert("선택된 시간: " + checkdate);
        }
    });
</script>
<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>
<script src="/js/header.js"></script>
</body>
</html>