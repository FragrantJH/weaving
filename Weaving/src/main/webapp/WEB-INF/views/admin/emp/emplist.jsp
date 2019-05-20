<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		empList();

		empSelect();

		//userDelete();

		//userInsert();

		//userUpdate();

		init();
	});

	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click', function() {
			$('#insertEmp').each(function() {
				this.reset();
			});
		});
	}//init

	//사용자 조회 요청
	function empSelect() {
		//조회 버튼 클릭
		$('body').on('click', '#btnSelect', function() {
			var empNo = $(this).closest('tr').find('#hidden_empNo').val();
			//특정 사용자 조회
			$.ajax({
				url : 'getEmpl/' + empNo,
				type : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : empSelectResult
			});
		}); //조회 버튼 클릭
	}//empSelect

	//사용자 조회 응답
	function empSelectResult(data) {
		var emp = data;
		$('input:text[name="empName"]').val(emp.empName);
		$('input:text[name="password"]').val(emp.password);
		$('input:text[name="deptId"]').val(emp.deptId);
		$('select[name="position"]').val(emp.position).attr("selected",
				"selected");
		$('input:text[name="email"]').val(emp.email);
		$('input:text[name="phone"]').val(emp.phone);
		$('input:text[name="address"]').val(emp.address);
	}//userSelectResult

	//사용자 목록 조회 요청
	function empList() {
		$.ajax({
			url : 'emplist1',
			type : 'GET',
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : empListResult
		});
	}//userList

	//사용자 목록 조회 응답
	function empListResult(data) {
		$("tbody").empty();
		$.each(data, function(idx, item) {
			$('<tr>').append($('<td>').html(item.empNo)).append(
					$('<td>').html(item.empName)).append(
					$('<td>').html(item.positionTitle)).append(
					$('<td>').html(item.deptName)).append(
					$('<td>').html('<button id=\'btnSelect\' data-toggle=\'modal\' data-target=\'#searchModel\'>조회</button>'))
					.append(
							$('<input type=\'hidden\' id=\'hidden_empNo\'>')
									.val(item.empNo)).appendTo('tbody');
		});//each
	}//userListResult
</script>
<style type="text/css">
.submenu {
	display: none;
	background: #ccc;
}

#menuBtn:checked ~ .submenu {
	display: block;
}
</style>
</head>
<body>
	<div class="col-md-12">
		<div class="card">
			<div class="card-header card-header-text card-header-primary">
				<div class="card-text">
					<h4 class="card-title">직원 관리</h4>
				</div>
			</div>
			<table class="table text-center">
				<thead>
					<tr>
						<th class="text-center">사번</th>
						<th class="text-center">이름</th>
						<th class="text-center">직책</th>
						<th class="text-center">부서</th>
					</tr>
				</thead>
				<tbody id="user"></tbody>
			</table>

			<div id="searchModel" class="modal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Information</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="insertEmp" method="post">
								<div class="btn-group">
									<input type="button" class="btn btn-primary" value="등록"
										id="btnInsert" /> <input type="button"
										class="btn btn-primary" value="수정" id="btnUpdate" /> <input
										type="button" class="btn btn-primary" value="초기화" id="btnInit" />
								</div>
								<br> <label for="empName"><b>이름</b></label> <input
									type="text" name="empName" id="empName"><br>
								<br> <label for="password"><b>비밀번호</b></label> <input
									type="text" name="password" id="password"><br>
								<br>
								<!-- 
	<label for="passwordcheck"><b>비밀번호 확인</b></label>
	<input type="text" name="passwordcheck"><br><br>
	 -->
								<!-- 
	<label for="joindate1"><b>입사일</b></label>
	<input type="text" name="joindate1" id="joindate1"><br><br>
	 -->
								<label for="deptId"><b>소속조직</b></label> <input type="text"
									name="deptId" id="deptId"><br>
								<br> <label for="positionTitle"><b>직위</b></label> <select
									name="positionTitle" size="1" id="positionTitle">
									<option value="선택">선택</option>
									<option value="사원">사원</option>
									<option value="대리">대리</option>
									<option value="이사">이사</option>
								</select><br>
								<br> <label for="email"><b>이메일</b></label> <input
									type="text" name="email" id="email"><br>
								<br> <label for="phone"><b>휴대 전화</b></label> <input
									type="text" name="phone" id="phone"><br>
								<br> <label for="address"><b>자택주소</b></label> <input
									type="text" size="20" id="address" name="address"> <br>
								<br>
								<hr>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="location='${pageContext.request.contextPath}/docFormDelete?formId=${docForm.formId}'">삭제</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>