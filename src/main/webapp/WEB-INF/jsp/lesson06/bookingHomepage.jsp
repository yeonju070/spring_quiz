<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div id="wrap" class="container">
            <header class="d-flex justify-content-center align-items-center">
                <div class="display-4 menu">
                	<a href="/lesson06/booking_homepage_view" class="text-dark logo">통나무 팬션</a>
                </div>
            </header>
            <nav>
            	<%-- nav 3종 세트(fill, item, link) --%>
                <ul class="nav nav-fill">
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">팬션소개</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">객실보기</a></li>
                    <li class="nav-item"><a href="/lesson06/booking_confirm_view" class="nav-link text-white font-weight-bold">예약하기</a></li>
                    <li class="nav-item"><a href="/lesson06/booking_list_view" class="nav-link text-white font-weight-bold">예약목록</a></li>
                </ul>
            </nav>
            
            <%-- 실시간 예약(section 왼쪽) --%>
            <section class="banner">
                <img src="/img/banner.jpg" alt="banner" width="1110" height="500">
            </section>
            <section class="contents d-flex">
                <section class="content-left col-4 d-flex justify-content-center align-items-center">
                    <div class="display-4 text-white">실시간<br>예약하기</div>
                </section>
                
                <%-- 예약확인(section 가운데) --%>
                <section class="	content-mid col-4">
                    <div class="m-3">
                        <span class="content-check mr-3 text-white">예약 확인</span>
                    </div>
                    <div>
                        <div class="d-flex justify-content-end align-items-center">
                            <div class="subject">이름:</div>
                            <input type="text" id="name" class="form-control input-form">
                        </div>
                        <div class="d-flex mt-2 justify-content-end align-items-center">
                            <span class="subject">전화번호:</span>
                            <input type="text" id="phoneNumber" class="form-control input-form">
                        </div>
                        
                        <div class="d-flex mt-2 justify-content-end align-items-center mt-3">
                            <button type="button" class="btn btn-success submit-btn">조회 하기</button>
                        </div>
                    </div>
                </section>
                
                <%-- 예약문의(section 오른쪽) --%>
                <section class="content-right col-4 d-flex justify-content-center align-items-center">
                    <div class="text-white">
                        <h4 class="font-weight-bold">예약문의:</h4>
                        <h1>
                        	010-<br>0000-1111
                        </h1>
                    </div>
                </section>
            </section>
            
            <%-- footer --%>
            <footer class="d-flex align-items-center">
                <div class="text-secondary">
                    <small>제주특별자치도 제주시 애월읍</small><br>
					<small>사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표 : 김통목</small><br>
					<small>Copyright 2025 tongnamu. All right reserved.</small>
                </div>
            </footer>
        </div>
</body>
</html>