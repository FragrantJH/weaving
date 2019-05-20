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
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.empNo))
			.append($('<td>').html(item.empName))
			.append($('<td>').html(item.positionTitle))
			.append($('<td>').html(item.deptName))
			.append($('<td>').html('<a id=\'btnSelect\' href=\'${pageContext.request.contextPath}/showEmp/${EmpForm.empNo}\'>${EmpForm.empNo}</a>'))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<input type=\'hidden\' empNo=\'hidden_empNo\'>').val(item.empNo))
			.appendTo('tbody');
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
<!--공간 분할을 위한 div 설정-->
div {
        width: 100%;
    }
div.left {
        width: 50%;
        float: left;
        box-sizing: border-box;
    }
div.right {
        width: 50%;
        float: right;
        box-sizing: border-box;
    }

</style>
</head>
<body>
 <div>
	 <div class="left">
		 <h2>조직도</h2>
		 <hr>
		 <ul>
			 <li>
				 <input type="checkbox" id="menuBtn">
				 <label for="menuBtn" class="labelBtn" onclick="">메뉴3</label>
					 <ul class="submenu">
						 <li><a href="#">소메뉴1</a></li>
						 <li><a href="#">소메뉴2</a></li>
						 <li><a href="#">소메뉴3</a></li>
						 <li><a href="#">소메뉴4</a></li>
					 </ul>
			 </li>
		 </ul>
	 </div>
	 
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
			<tbody></tbody>
		</table>
	 </div>
	 
 </div>
</body>
</html>