<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매글작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    
<!--     flatpickr -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr@4.6.9/dist/flatpickr.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr@4.6.9/dist/flatpickr.min.css">
    
     <link rel="stylesheet" href="/css/style.css">
	 <style>
		
		#box-align{
			display:block;
			border : 3px solid black;
			position: center;
			width : 500px;
			text-align: center;
			height: 550px;
			margin: 0 auto;
			}
		#text-text{
			margin: 60px;
			border: 1px solid none;
			font-size: 15px;
		}
		#datePicker{
			width: 99px;
		}
		#timePicker{
			width: 99px;
		}
		
		
	 </style>
</head>
<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>

<form method="post" action="/auction/write" enctype="multipart/form-data" id="box-align">
        <div id="text-text">
        <input type="hidden" id="id" name="id" required value="${mb.id}"><br>
		<label for="ac_animal">동물 :</label>
        <input type="text" id="ac_animal" name="ac_animal" required><br>
        <label for="ac_gender" id = "gender">성별 :</label>
        <select name = "ac_gender">
            <option value="암컷">수컷</option>
        	<option value="암컷">암컷</option>
        	<option value="중성">중성</option>
        </select><br>
        <label for="ac_age">나이 :</label>
        <input type="number" id="ac_age" name="ac_age" required><br>
        <label for="minprice">입찰 :</label>
        <input type="text" id="minprice" name="minprice" required><br>
        <label for="toprice">현재 :</label>
        <input type="text" id="toprice" name="toprice" required><br>
		마감시간 : <input type="date" id="datePicker">
		<input type="text" id ="timePicker"><br>
		<input type="hidden" id="dateTimeHidden" name="endtime2">
		<div id="uploader">
			<label for = "attachments"></label>
			<input type = "file" name="attachments" id="attachments" accept=".jpg, .jpeg, .png, .gif" class="form-control">
			</div>
			<br>
		<button type="submit" class="btn btn-primary">완료</button>		
		</div>
		</form>
	<script>
		$(document).ready(function(){
		    const datePicker = flatpickr("#datePicker", {
		        minDate: "today",
		        enableTime: false,
		        maxDate: new Date().fp_incr(14),
		        dateFormat: "Y-m-d",
		        onClose: function () {
		            updateHiddenField();
		        }
		    });
		
		    const timePicker = flatpickr("#timePicker", {
		        enableTime: true,
		        noCalendar: true,
		        dateFormat: "H:i",
		        onClose: function () {
		            updateHiddenField();
		        }
		    });
		
		    function updateHiddenField() {
		        const selectedDate = datePicker.selectedDates[0];
		        const selectedTime = timePicker.selectedDates[0];
		
		        if (selectedDate && selectedTime) {
		            const formattedDateTime = selectedDate.toISOString().slice(0, 10) +
		                " " + selectedTime.toTimeString().slice(0, 8);
		            $('#dateTimeHidden').val(formattedDateTime);
		        }
		    }	    
		});
	</script>
	
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
	</script>
        
        
<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>
<script src="/js/header.js"></script>
</body>
</html>