<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<body>
<script>
	$(function(){
		userList();
	
		userSelect();
		
		userDelete();
		
		userInsert();
	
		userUpdate();
		
	});
	
	//사용자 삭제 요청
	function userDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			var id = $(this).closest('tr').find('#hidden_id').val();
			var result = confirm(id +" 사용자를 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url:'users/'+id,  
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:function(xhr) {
						console.log(xhr.result);
						userList();
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//userDelete
	
	//사용자 조회 요청
	function userSelect() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
			var id = $(this).closest('tr').find('#hidden_id').val();
			//특정 사용자 조회
			$.ajax({
				url:'users/'+id,
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:userSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect
	
	//사용자 조회 응답
	function userSelectResult(data) {
		var user = data;
		$('input:text[name="id"]').val(user.id);
		$('input:text[name="name"]').val(user.name);
		$('input:radio[name="gender"][value="'+user.gender+'"]').prop('checked', true);
		$('select[name="role"]').val(user.role).attr("selected", "selected");
	}//userSelectResult
	
	//사용자 수정 요청
	function userUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click',function(){
			var id = $('input:text[name="id"]').val();
			var name = $('input:text[name="name"]').val();
			var gender = $('input:radio[name="gender"]:checked').val();
			var role = $('select[name="role"]').val();	
			$.ajax({ 
			    url: "users", 
			    type: 'PUT', 
			    dataType: 'json', 
			    data: JSON.stringify({ id: id, name:name,gender: gender, role: role }),
			    contentType: 'application/json',
			    mimeType: 'application/json',
			    success: function(data) { 
			        userList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//userUpdate
	
	//사용자 등록 요청
	function userInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			var id = $('input:text[name="id"]').val();
			var name = $('input:text[name="name"]').val();
			var password = $('input:text[name="password"]').val();
			var gender = $('input:radio[name="gender"]:checked').val();
			var role = $('select[name="role"]').val();		
			$.ajax({ 
			    url: "users",  
			    type: 'POST',  
			    dataType: 'json', 
			    data: JSON.stringify({ id: id, name:name,gender: gender, role: role }),
			    contentType: 'application/json', 
			    mimeType: 'application/json',
			    success: function(response) {
			    	if(response.result == true) {
			    		userList();
			    	}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert
	
	//사용자 목록 조회 요청
	function userList() {
		$.ajax({
			url:'users',
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:userListResult
		});
	}//userList
	
	//사용자 목록 조회 응답
	function userListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.id))
			.append($('<td>').html(item.name))
			.append($('<td>').html(item.gender))
			.append($('<td>').html(item.role))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_id\'>').val(item.id))
			.appendTo('tbody');
		});//each
	}//userListResult

</script>


	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header card-header-primary">
					<h4 class="card-title ">결재폼 목록</h4>
					<p class="card-category">관리자가 등록한 결재폼 목록입니다</p>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th>폼 이름</th>
									<th class="text-right">Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${docFormList}" var="docForm">
									<tr>
										<td class="text-center">${docForm.rowNum}</td>
										<td>${docForm.formName}</td>
										<td class="td-actions text-right">
											<button type="button" rel="tooltip" class="btn btn-success">
												<i class="material-icons">edit</i>
											</button>
											<button type="button" rel="tooltip" class="btn btn-danger">
												<i class="material-icons">close</i>
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<my:paging paging="${paging}" jsFunc="docFormList" />
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>