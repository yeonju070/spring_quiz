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
		<h1>즐겨찾기 추가하기</h1>
			<div class="form-group">
				<label for="name" >제목</label>
				<input type="text" id="name" name="name" class="form-control">
			</div>
			<div class="form-group">
				<label for="url">주소</label>
				<div class="d-flex">
					<input type="text" id="url" name="url" class="form-control">
					<button type="button" id="checkBtn" class="btn btn-info ml-3">중복확인</button>
				</div>
				<small id="urlStatusArea"></small>
			</div>
			<button type="button" id="addBtn" class="btn btn-success w-100">추가</button>
	</div>
	<script>
	$(document).ready(function() {
		
		$('#addBtn').on('click', function(e) {
			e.preventDefault();
			let name = $('#name').val().trim();
			if (name.length < 1) {
				alert("제목을 입력하세요");
				return;
			}
			let url = $('#url').val().trim();
			if (url.length < 1) {
				alert("url을 입력하세요");
				return;
			}
			
			// 중복 완료 확인
			if ($()) {
				
			}
			
			$.ajax({
				type:"post"
				, url:"/lesson06/quiz01/add_internet"
				, data:{"name":name, "url":url}
			
				, success:function(data){
					if (data == "성공") {
						location.href = "/lesson06/quiz01/internet_list_view"
					}
				}
				,error:function(e){
					alert("error:" + e);
				}
			});
		});
		
		$('#checkBtn').on('click', function() {
			$('#urlStatusArea').empty();
			
			let url = $('#url').val().trim();
			
			if (url == '') {
				$('#urlStatusArea').append('<span class="text-danger">주소가 비어있습니다.</span>');
				return;
			}
			
			$.ajax({
				type:"get"
				, url:'/lesson06/quiz02/int_duplication'
				, data:{'url':url}
				, success: function(data) {
					if (data.int_duplication == true) {
						$('#urlStatusArea').append('<span class="text-danger">중복된 url입니다.</span>');
					} else {
						$('#urlStatusArea').append('<span class="text-info">저장 가능한 url입니다.</span>');
					}
				}
				, error: function(e) {
					alert("실패:" + e);
				}
			});
		});
	});
	</script>
</body>
</html>