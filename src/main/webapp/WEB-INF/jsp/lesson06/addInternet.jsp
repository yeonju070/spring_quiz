<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가하기</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" id="title" class="form-control"><br>
		</div>
		<div class="form-group">
			<label for="url">주소</label>
			<input type="text" id="url" class="form-control">
			<button type="button" id="addBtn" class="btn btn-success btn-block mt-3">추가</button>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("#addBtn").on('click', function(e) {
				
				let title = $("#title").val().trim();
				let url = $("#url").val().trim();
				
				if (title == '') {
					alert("제목을 입력해주세요.");
					return;
				}
				
				if (url == "") {
					alert("주소를 입력해주세요.");
					return;
				}
				
				if (url.startsWith("http") == false && url.startsWith("https") == false) {
					alert("주소 형석이 잘못되었습니다.");
					return;
				}
				
				// 서버에 인서트 요청 AJAX
				$.ajax({

					// request
					type : "POST"
					, url : "/lesson06/quiz01/add_internet"
					, data : {"title":title, "url":url}
				
					// response
					, success : function(data) {	// data 파라미터는 요청에 대한 응답값이다.
						// alert(data);
						if (data == "성공") {
							location.href = "/lesson06/quiz01/get_internet_view"
						} else {
							alert("입력 실패");
						}
					}
					, error:function(request, status, error) {
						alert("에러")	;
					}
				});
			});
		});
	</script>
</body>
</html>