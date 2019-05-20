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
		
		deptList();
	
		//userSelect();
		
		//userDelete();
		
		//userInsert();
	
		//userUpdate();
		
		//init();
	});
	
	//부서 목록 조회 요청
	function deptList() {
		$.ajax({
			url:'deptlist',
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:deptListResult
		});
	}//userList
	
	//부서 목록 조회 응답
	function deptListResult(data) {
		console.log(data);
		$("#dept").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.deptId))
			.append($('<td>').html(item.deptName))
			.append($('<td>').html(item.upperDeptId))
			.append($('<input type=\'hidden\' deptId=\'hidden_deptId\'>').val(item.deptId))
			.appendTo('#dept');
		});//each
	}//deptListResult
	
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
<div class="left">
		 <h2>조직도</h2><button onclick="location.href='./empinsertForm'">등록</button>
		 <hr>
		 <table class="table text-center">
			<thead>
			<tr>
				<th class="text-center">부서번호</th>
				<th class="text-center">부서명</th>
				<th class="text-center">부서</th>
			</tr>
			</thead>
			<tbody id="dept"></tbody>
		</table>
	 </div>
</body>
</html>