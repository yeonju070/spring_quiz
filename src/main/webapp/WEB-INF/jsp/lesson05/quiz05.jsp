<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/css/lesson05/quiz05.css">
</head>
<body>
	<div class="container">
		<section class="contents d-flex">
			<nav class="bg-primary col-2">
				<div class="logo d-flex justify-content-center">
					<img src="https://blog.kakaocdn.net/dn/TxmeD/btqCKArBvPm/2tzfJfINwg0WWmCzC4jKW0/img.jpg" width="100">
				</div>
			    <ul class="nav flex-column">
			        <li class="nav-item font-weight-bold"><a href="#" class="nav-link text-white">날씨</a></li>
			        <li class="nav-item font-weight-bold"><a href="#" class="nav-link text-white">날씨입력</a></li>
			        <li class="nav-item font-weight-bold"><a href="#" class="nav-link text-white">테마날씨</a></li>
			        <li class="nav-item font-weight-bold"><a href="#" class="nav-link text-white">관측 기후</a></li>
			    </ul>
			</nav>
			<section class="content col-10 bg-success">
				<h1>과거 날씨</h1>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="weatherHistory" var="weather">
							<tr>
								<td>
									<fmt:formatDate var="date" value="${weather.date}" pattern="yyyy년 MM월 dd일" />
									<span>${date}</span>
								</td>
								<td>
									<c:choose>
										<c:when test="${weather.weather} eq '비'">
											<img src="rainy.jpg" width="30">
										</c:when>
										<c:when test="${weather.weather} eq '흐림'">
											<img src="cloudy.jpg" width="30">
										</c:when>
										<c:when test="${weather.weather} eq '맑음'">
											<img src="sunny.jpg" width="30">
										</c:when>
										<c:otherwise>
											<img src="partlyCloudy.jpg" width="30">
										</c:otherwise>
									</c:choose>
								</td>
								<td>${weather.temperatures}℃</td>
								<td>${weather.precipitation}mm</td>
								<td>${weather.microDust}</td>
								<td>${weather.windSpeed}km/h</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</section>
		<footer class="bg-warning d-flex">
			<div class="col-2">
				<img alt="기상청로고" src="https://www.weather.go.kr/w/resources/image/photo/img_flower_photo_none.gif" width="100">
			</div>
			<div class="col-10">
				<span class="text-secondary">(07062) 서울 동작구 여의대방로 16길 61</span><br>
				<span class="text-secondary">Copyright@2020 KMA. All Right RESERVED.</span>
			</div>
		</footer>
	</div>
</body>
</html>