<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Insert title here</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- ckeditor 스크립트 -->
<script src="//cdn.ckeditor.com/4.11.4/full/ckeditor.js"></script>
 
<script>
//jquery작업
$(function(){
	/*
	userList();
	userSelect();
	userDelete();
	userUpdate();
	userInsert();	
	
	loadDocs();
	selectDoc();

	



	loadDocs();
	init();
	*/
	toLeftMove();
	toRightMove();
	makeApprovalListTable();
});

function makeApprovalListTable() {
	
}

function toLeftMove() {
	$('table').on('click', '#toLeft', function() {
		//empList, approvalList
		var index = $('#approvalList option').index($('#approvalList option:selected'));
		var chooseEmp = $('#approvalList option:selected');
		
		if (chooseEmp.length == 0) {
			alert("직원을 선택하세요");
		} else {
			chooseEmp.remove();	
			$('#empList').append(chooseEmp);
		}
	});
}

function toRightMove() {
	$('table').on('click', '#toRight', function() {
		//empList, approvalList
		var index = $('#empList option').index($('#empList option:selected'));
		var chooseEmp = $('#empList option:selected');
		
		if (chooseEmp.length == 0) {
			alert("직원을 선택하세요");
		} else {
			chooseEmp.remove();	
			$('#approvalList').append(chooseEmp);
		}
	});
}
/*
	//결재폼 호출
	function loadDocs() {
		$.ajax({
			url:'users/'+id,  
			type:'DELETE',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr, status, msg){
				console.log("상태값 :" + status + " Http에러메시지 :"+msg);
			}, success:function(xhr) {
				console.log(xhr.result);
				//userList();
			}
		});  		
	}//loadDocs
	
$("#dropdownMenuButton")
*/
	//문서 선택 요청 삭제 요청
	/*
	function selectDoc() {
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
	*/
</script> 
</head>
<body>
<div class="col-md-12">
	<div class="card">
	    <div class="card-header card-header-text card-header-primary">
	      <div class="card-text">
	        <h4 class="card-title">문서 작성하기</h4>
	      </div>
	    </div>
	    

	    <div class="card-body">
		<form>
			<h3><small class="text-muted">기본 설정</small></h3>
				    			
			<table class="table">
			    <tbody>
			        <tr>
			            <td class="text-center">기안자</td>
			            <td colspan="3">${empName}</td>
			        </tr>
			        <tr>
			            <td class="text-center">문서종류</td>
			            <td>
							<div class="dropdown">
							  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    선택
							  </button>
							  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							  	<c:forEach items="${list}" var="formList">
							    	<a class="dropdown-item" href="#">${formList.formName}</a>
							    </c:forEach>
							  </div>
							</div>
							
							
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
							  미리보기
							</button>
							<!-- Modal -->
							<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        ...
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							        <button type="button" class="btn btn-primary">Save changes</button>
							      </div>
							    </div>
							  </div>
							</div>							
							
							
							
			            </td>
			        	<td class="text-center">보안등급</td>
			        	<td>
							<div class="dropdown">
							  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    보안등급
							  </button>
							  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							    <a class="dropdown-item" href="#">S등급</a>
							    <a class="dropdown-item" href="#">A등급</a>
							    <a class="dropdown-item" href="#">B등급</a>
							    <a class="dropdown-item" href="#">C등급</a>
							  </div>
							</div>			        	
			        	</td>			            
			        </tr>			        
			    </tbody>
			</table>
			<h3><small class="text-muted">결제선</small></h3><span><a href="#0" class="card-link" data-toggle="modal" data-target="#approvalLineModel">결제선설정</a></span>
			
			<div class="approval-line">문서 종류 선택 시 결재선이 노출됩니다.
			</div>	    
			<!-- modal 페이지 -->
			<div class="modal fade bd-example-modal-lg" id="approvalLineModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			      	<h5 class="modal-title card-title">결제자 설정</h5>
			      </div>
			      <div class="modal-body">
					<table class="table" border="0">
					    <thead>
							<tr>
					            <th>직원 목록</th>
					            <th></th>
					            <th>결재자</th>
					        </tr>
					    </thead>
					    <tbody>
					        <tr>
					            <td rowspan="2">
									<select id="empList" size="7" style="width:200px;">
										<c:forEach items="${empList}" var="empList">
									    	<a class="dropdown-item" href="#">${formList.formName}</a>
									    	<option value="${empList.empNo}">${empList.empName}(${empList.deptName})
									    </c:forEach>									
									</select>					            
					            </td>
					            <td style="border:none;"><button type="button" id="toRight" class="btn btn-default .btn-sm"> >> </button></td>
					            <td rowspan="2">
									<select id="approvalList" size="7" style="width:200px;">
									</select>					            
					            </td>
					        </tr>
					        <tr>
					            <td style="border:none;"><button type="button" id="toLeft" class="btn btn-default .btn-sm"> << </button></td>
					        </tr>					        
					    </tbody>
					</table>			      
			      </div>
			      <div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        			<button type="button" id="rs-approval-list" class="btn btn-primary">Save changes</button>			      
			      </div>
			    </div>
			  </div>
			</div>		



			
			<h3><small class="text-muted">상세 입력</small></h3>
			<div class="approval-form">
				<textarea name="editor1" id="editor1" rows="10" cols="200">
				    This is my textarea to be replaced with CKEditor.
				</textarea>
				<script>
				    // Replace the <textarea id="editor1"> with a CKEditor
				    // instance, using default configuration.
				    CKEDITOR.replace( 'editor1' );
				</script>
			</div>				
		</form>			
	    </div>
	</div>
</div>
</body>
</html>