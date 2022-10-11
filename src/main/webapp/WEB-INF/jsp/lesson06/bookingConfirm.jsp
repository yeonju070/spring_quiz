<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<%-- datepicker를 위해 slim 버전이 아닌 jquery를 import한다. --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
<%-- datepicker --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="/css/lesson06/booking.css">
</head>
<body>
	<div class="container">
		<%-- header --%>
		<header class="d-flex justify-content-center align-items-center">
           <div class="display-4">
           		<a href="/lesson06/booking_homepage_view" class="text-dark logo">통나무 팬션</a>
           	</div>
       	</header>
		<nav>
			<ul class="nav nav-fill">
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">팬션소개</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">객실보기</a></li>
                    <li class="nav-item"><a href="/lesson06/booking_confirm_view" class="nav-link text-white font-weight-bold">예약하기</a></li>
                    <li class="nav-item"><a href="/lesson06/booking_list_view" class="nav-link text-white font-weight-bold">예약목록</a></li>
                </ul>
		</nav>
		
		<%-- section --%>
		<section class="contents d-flex justify-content-center">
			<div class="confirm-box">
				<h2 class="font-weight-bold text-center mt-4">예약하기</h2>
				
				<div class="subject my-2 text-dark">이름</div>
				<input id="name" class="form-control" name="name">
				
				<div class="subject my-2 text-dark">예약날짜</div>
				<input id="confirmDate" class="form-control" name="date">
				
				<div class="subject my-2 text-dark">숙박일수</div>
				<input id="confirmDay" class="form-control" name="day">
				
				<div class="subject my-2 text-dark">숙박인원</div>
				<input id="confirmHeadCount" class="form-control" name="headcount">
				
				<div class="subjec my-2 text-dark">전화번호</div>
				<input id="confirmPhoneNumber" class="form-control" name="phoneNumber">
				
				<%-- section button --%>
				<button id="confirmBtn" type="button" class="btn btn-warning w-100 mt-3">예약하기</button>
			</div>
		</section>
		<footer>
			<div class="text-secondary">
				<small>제주특별자치도 제주시 애월읍</small><br>
				<small>사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표 : 김통목</small><br>
				<small>Copyright 2025 tongnamu. All right reserved.</small>
			</div>
		</footer>
	</div>
	<script>
		$(document).ready(function() {
	
			// 예약날짜
			$('input[name=date]').datepicker({
				dateFormat : "yy-mm-dd"
				, minDate: 0	// 오늘부터 선택할 수 있게 설정
			});
			
			// 예약하기 버튼 클릭
			$("#confirmBtn").on('click', function() {
				// 값 가져오기
				let name = $('input[name=name]').val().trim();
				let date = $('input[name=date]').val().trim();
				let day = $('input[name=day]').val().trim();
				let headcount = $('input[name=headcount]').val().trim();
				let phoneNumber = $('input[name=phoneNumber]').val().trim();
				
				// validation
				if (name == '') {
					alert("이름을 입력해주세요.");
					return;
				}
				
				if (date == '') {
					alert("날짜를 입력해주세요.");
					return;
				}

				if (day == '') {
					alert("숙박일을 입력해주세요.");
					return;
				}
				
				if (isNaN(day)) {
					alert("숫자만 입력 가능합니다.");
					return;
				}
				if (headcount == '') {
					alert("숙박 인원을 입력해주세요.");
					return;
				}
				
				if (isNaN(headcount)) {
					alert("숫자만 입력 가능합니다.");
					return;
				}
				
				if (phoneNumber == '') {
					alert("전화번호를 입력해주세요.");
					return;
				}
				
				// ajax -> insert
				$.ajax({
					// request
					type:"POST"
					, url:"/lesson06/add_booking"
					, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
				
					// response
					, success:function(data) {
						if (data.code == 100) {
							alert("예약되었습니다.");
							location.href = "/lesson06/booking_list_view";
						} else {
							alert(data.errorMessage);
						}
					}
					, error:function(e) {
						alert("예약하는데 실패했습니다.");
					}
				});
			});
		});
	</script>
</body>
</html>