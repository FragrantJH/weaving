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
		
		deptDelete();
		
		deptInsert();
	
		deptUpdate();
		
		empSelect();
		
		//init();
		$('#searchModal').on('show.bs.modal', function (e) {
			$('#InsertDeptForm')[0].reset();
		})
		
		
	});
	
	//사용자 삭제 요청
	function deptDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			var deptId = $('#deptId').val();
			var result = confirm(deptId +" 사용자를 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url:'deleteDept/'+deptId,  
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:function(xhr) {
						console.log(xhr.result);
						$('#searchModal').modal("hide");
						deptList();
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//deptDelete
	
	//dept 등록 요청
	function deptInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			var deptName = $('input:text[name="deptName"]').val();
			var upperDeptId = $('[name="upperDeptId"]').val();
			if($("#deptName").val() == ""){
		        alert("부서이름를 입력하세요");
		        $("#deptName").focus();
		        return false;
		      }
		      
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
	
	function empSelect() {
		//조회 버튼 클릭
		$('body').on('click', '.btnSelEmp', function() {
			var deptId = $(this).parent().parent().children().eq(0).text();
			location='${pageContext.request.contextPath}/adminemplist?deptId='+deptId;
		}); //조회 버튼 클릭
	}//deptSelect

	//사용자 조회 응답
	function deptSelectResult(data) {
		var dept = data;
		$('input:text[name="deptId"]').val(dept.deptId);
		$('input:text[name="deptName"]').val(dept.deptName);
		$('select[name="upperDeptId"]').val(dept.upperDeptId);
	}//deptSelectResult
	
	//부서 수정 요청
	function deptUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click',function(){
			var deptId = $('input:text[name="deptId"]').val();
			var deptName = $('input:text[name="deptName"]').val();
			var upperDeptId = $('[name="upperDeptId"]').val();
			
			if($("#deptName").val() == ""){
		        alert("부서이름를 입력하세요");
		        $("#deptName").focus();
		        return false;
		      }
			$.ajax({ 
			    url: "deptUpdate",
			    type: 'PUT', 
			    dataType: 'json', 
			    data: JSON.stringify({deptId: deptId, deptName: deptName, upperDeptId: upperDeptId}),
			    contentType: 'application/json',
			    mimeType: 'application/json',
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
			.append($('<td>').html('<button class="btn btn-defualt btn-sm" id=\'btnSelect\' data-toggle=\'modal\' data-target=\'#searchModal\'>상세보기</button>'))
			.append($('<td>').html('<button class="btn btn-defualt btnSelEmp btn-sm" type="button" >조회</button>'))
			.append($('<input type="hidden" deptId="hidden_deptId">').val(item.deptId))
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
			</div>
			<div class ="card-body">
			<table class="table text-center">
				<thead>
					<tr>
						<th class="text-center">부서번호</th>
						<th class="text-center">부서명</th>
						<th class="text-center">상위부서</th>
						<th class="text-center">상세보기</th>
						<th class="text-center">조회</th>
					</tr>
				</thead>
				<tbody id="dept"></tbody>
			</table>
			<div style="float:right;">
			<button id="btnInsertDept" data-toggle="modal" data-target="#searchModal" class="btn btn-primary btn-sm">등록</button>
			</div>
			</div>
		</div>
	</div>
	
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
								<input type="text" name="deptId" id="deptId" readonly>
								<br>
								<br> 
								<label for="deptName"><b>부서명</b></label> 
								<input type="text" name="deptName" id="deptName">
								<br>
								<br> 
								<label for="upperDeptId"><b>상위부서</b></label> 
								<select 
									name="upperDeptId" size="1" id="upperDeptId">
									<option value="7">회사</option>
									<option value="1">경영지원팀</option>
									<option value="2">회계</option>
									<option value="3">인사</option>
									<option value="4">연구관리팀</option>
									<option value="5">개발</option>
									<option value="6">테스트</option>
									
								</select>
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

</body>
</html>