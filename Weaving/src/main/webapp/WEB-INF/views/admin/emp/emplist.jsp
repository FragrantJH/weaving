<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" >

	$(function(){
		empList();
	
		//userSelect();
		
		//userDelete();
		
		//userInsert();
	
		//userUpdate();
		
		//init();
	});

	//사용자 목록 조회 요청
	function empList() {
		$.ajax({
			url:'emplist1',
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:empListResult
		});
	}//userList
	
	//사용자 목록 조회 응답
	function empListResult(data) {
		$("#user").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.empNo))
			.append($('<td>').html(item.empName))
			.append($('<td>').html(item.positionTitle))
			.append($('<td>').html(item.deptName))
			.append($('<td>').html('<a id=\'btnSelect\' href=\'${pageContext.request.contextPath}/showEmp/${EmpForm.empNo}\'>${EmpForm.empNo}</a>'))
			.append($('<input type=\'hidden\' empNo=\'hidden_empNo\'>').val(item.empNo))
			.appendTo('#user');
		});//each
	}//userListResult

</script>
<style type="text/css">
.submenu {
    display:none;
    background: #ccc;
}
#menuBtn:checked ~ .submenu {
    display: block;
}
</style>
</head>
<body>
	 <div class="right">
		 <h2>직원목록</h2><button onclick="location.href='./empinsertForm'">등록</button>
		 <hr>
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
	 </div>

</body>
</html>