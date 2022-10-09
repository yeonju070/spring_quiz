<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<%-- Ajax를 사용하려면 jquery 원본이 있어야 한다. --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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
				
				<div class="subject-text my-2">이름</div>
				<input id="id" class="form-control">
				
				<div class="subject-text my-2">예약날짜</div>
				<input id="id" class="form-control">
				
				<div class="subject-text my-2">숙박일수</div>
				<input id="id" class="form-control">
				
				<div class="subject-text my-2">숙박인원</div>
				<input id="id" class="form-control">
				
				<div class="subject-text my-2">전화번호</div>
				<input id="id" class="form-control">
				
				<%-- section button --%>
				<button id="confirm-btn" type="button" class="btn btn-warning w-100 mt-3">가입하기</button>
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
</body>
</html>