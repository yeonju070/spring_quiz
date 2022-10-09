<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<%-- Ajax를 사용하려면 jquery 원본이 있어야 한다. --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 목록</h1>
		
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${internetList}" var="internet">
				<tr>
					<td>${internet.id}</td>
					<td>${internet.name}</td>
					<td>${internet.url}</td>
					<td>
						<%-- (1) name 이벤트, value 속성을 이용해서 동적으로 id 보내기 --%>
						<%-- <button type="button" name="delBtn" class="btn btn-danger" value="${favorite.id}">삭제</button> --%>
						
						<%-- (2) data를 이용해서 태그에 data를 임시 저장해놓기 --%>
						<button type="button" class="del-btn btn btn-danger" data-internet-id="${internet.id}">삭제</button>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
	$(document).ready(function() {
		// (1) name 이벤트, value 속성을 이용해서 동적으로 id 보내기
		/* $('td').on('click', 'button[name=delBtn]', function(e) {
			//let id = $(this).attr('value');
			let id = e.target.value;
			alert(id);
		}); */
		
		// (2) data를 이용해서 태그에 data를 임시 저장해놓기
		//    태그: data-internet-id     data- 그 뒤부터는 이름을 지어준다. (꼭 하이픈 형식, 대문자 절대 X)
		//  스크립트: $(this).data('internet-id');
		$('.del-btn').on('click', function() {
			let internetId = $(this).data('internet-id');
			//alert(internetId);
			
			// AJAX -> 삭제할 id db
			$.ajax({
				// request
				type:"DELETE"
				, url:"/lesson06/delete_internet"
				, data:{"id":internetId}
			
				// response
				, success:function(data) { // json string => object
					if (data.code == 100) {
						location.reload(true);
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("삭제 실패했습니다. 관리자에게 문의해주세요.");
				}
			});
		});
	});
	</script>
</body>
</html>