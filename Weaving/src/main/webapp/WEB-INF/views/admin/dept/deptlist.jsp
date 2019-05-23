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
	
		deptSelect();
		
		//userDelete();
		
		deptInsert();
	
		deptUpdate();
		
		//init();
	});
	
	//dept 등록 요청
	function deptInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			var deptName = $('input:text[name="deptName"]').val();
			var upperDeptId = $('input:text[name="upperDeptId"]').val();
			$.ajax({ 
			    url: "deptInsert",  
			    type: 'POST',
			    dataType: 'json', 
			    data: JSON.stringify({ deptName: deptName,upperDeptId: upperDeptId }),
			    contentType: 'application/json',
			    mimeType: 'application/json',
			    success: function(response) {
			    	console.log(response)
			    	//if(response.result == true) {
			    		$('#searchModal').modal("hide");
			    		deptList();
			    	//}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}//deptInsert
	
	//부서 조회 요청
	function deptSelect() {
		//조회 버튼 클릭
		$('body').on('click', '#btnSelect', function() {
			var deptId = $(this).parent().parent().children().eq(0).text();
			console.log($(this).parent().parent().children().eq(0).text());
			//특정 사용자 조회
			 $.ajax({
				url : 'getDept/' + deptId,
				type : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : deptSelectResult
			});
		}); //조회 버튼 클릭
	}//deptSelect

	//사용자 조회 응답
	function deptSelectResult(data) {
		var dept = data;
		$('input:text[name="deptId"]').val(dept.deptId);
		$('input:text[name="deptName"]').val(dept.deptName);
		$('input:text[name="upperDeptId"]').val(dept.upperDeptId);
	}//deptSelectResult
	
	//부서 수정 요청
	function deptUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click',function(){
			$.ajax({ 
			    url: "deptUpdate",
			    //type: 'PUT', 
			    dataType: 'json', 
			    data: $('#InsertDeptForm').serialize(),
			    success: function(data) { 
			    	$('#searchModal').modal("hide");
					deptList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//deptUpdate
	
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
			.append($('<td>').html('<button id=\'btnSelect\' data-toggle=\'modal\' data-target=\'#searchModal\'>상세보기</button>'))
			.append($('<input type=\'hidden\' deptId=\'hidden_deptId\'>').val(item.deptId))
			.appendTo('#dept');
		});//each
	}//deptListResult
	
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
					<h4 class="card-title">부서 관리</h4>
				</div>
				<button id="InsertDeptForm" data-toggle="modal" data-target="#searchModal">등록</button>
			</div>
			<table class="table text-center">
				<thead>
					<tr>
						<th class="text-center">부서번호</th>
						<th class="text-center">부서명</th>
						<th class="text-center">상위부서</th>
					</tr>
				</thead>
				<tbody id="dept"></tbody>
			</table>

			<div id="searchModal" class="modal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">부서 정보</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						
						<div class="modal-body">
							<form action="insertDept" method="post" id="InsertDeptForm">
								<br> 
								<label for="deptId"><b>부서 번호</b></label> 
								<input type="text" name="deptId" id="deptId">
								<br>
								<br> 
								<label for="deptName"><b>부서명</b></label> 
								<input type="text" name="deptName" id="deptName">
								<br>
								<br> 
								<label for="upperDeptId"><b>하위부서</b></label> 
								<input type="text" name="upperDeptId" id="upperDeptId">
								<br>
								<hr>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="btnInsert">등록</button>
							<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
							<button type="button" class="btn btn-primary" id="btnUpdate" >수정</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>