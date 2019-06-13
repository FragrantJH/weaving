<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script type="text/javascript">

	var echeck =1;
	
	$(function() {
		empInsert11();
		 
		empList();

		empSelect();

		empDelete();

		empInsert();

		empUpdate();
		
		empDelUpdate();
		
		emailcheck();
		
		$('#searchModel').on('show.bs.modal', function (e) {
			$('#insertForm')[0].reset();
		})
		//init();
	});
	function empInsert11(){
		//등록폼 버튼 클릭
		$('#btnInsertForm').on('click',function(){
		$('#searchModel').modal("show");
		});
	}
	
	//사용자 등록 요청
	function empInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			var empName = $('input:text[name="empName"]').val();
			var password = $('input:text[name="password"]').val();
			var deptId = $('[name="deptId"]').val();
			var position = $('[name="position"]').val();
			var email = $('input:text[name="email"]').val();
			var phone = $('input:text[name="phone"]').val();
			var address = $('input:text[name="address"]').val();
			var gmailAppKey = $('input:text[name="gmailAppKey"]').val();
			
			if($("#empName").val() == ""){
		        alert("아이디를 입력하세요");
		        $("#empName").focus();
		        return false;
		      }
			
			if($("#password").val() == ""){
		        alert("비밀번호를 입력하세요");
		        $("#password").focus();
		        return false;
		      }
			
			if($("#email").val() == ""){
		        alert("이메일을 입력하세요");
		        $("#email").focus();
		        return false;
		      }
			
			if($("#gmailAppKey").val() == ""){
		        alert("gmailAppKey 입력하세요");
		        $("#gmailAppKey").focus();
		        return false;
		      }
			
			if(echeck== 1){
		        alert("email 중복체크하세요");
		        return false;
		      }
			$.ajax({ 
			    url: "insertEmp",  
			    type: 'POST',
			    dataType: 'json', 
			    data: JSON.stringify({ empName: empName, password: password,deptId: deptId, position: position, email: email, phone: phone, address: address, gmailAppKey: gmailAppKey }),
			    contentType: 'application/json',
			    success: function(data) {
			    	console.log(data)
			    	//if(response.result == true) {
			    		$('#searchModel').modal("hide");
			    		empList();
			    	//}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert
	
	//사용자 삭제 요청
	function empDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			var empNo = $('#empNo').val();
			var result = confirm(empNo +" 사용자를 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url:'deleteEmp/'+empNo,  
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:function(xhr) {
						console.log(xhr.result);
						$('#searchModel').modal("hide");
						empList();
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//empDelete
	
	//사용자 퇴사 요청
	function empDelUpdate() {
		//수정 버튼 클릭
		$('#btnDelInsert').on('click',function(){
			
			$.ajax({ 
			    url: "empDelUpdate",
			   // type: 'PUT', 
			    dataType: 'text', 
			    data: $('#insertForm').serialize(),
			    success: function(data) { 
			    	if(data=="fail"){
			    		alert("결제중인 문서가 남아있습니다. 확인바랍니다.");
			    	}else{
			    	$('#searchModel').modal("hide");
					empList();
			    }
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});
		});//퇴사 버튼 클릭
	}//empDelUpdate

	//사용자 수정 요청
	function empUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click',function(){
			if($("#empName").val() == ""){
		        alert("아이디를 입력하세요");
		        $("#empName").focus();
		        return false;
		      }
			
			if($("#password").val() == ""){
		        alert("비밀번호를 입력하세요");
		        $("#password").focus();
		        return false;
		      }
			
			if($("#email").val() == ""){
		        alert("이메일을 입력하세요");
		        $("#email").focus();
		        return false;
		      }
			
			if($("#gmailAppKey").val() == ""){
		        alert("gmailAppKey 입력하세요");
		        $("#gmailAppKey").focus();
		        return false;
		      }
			$.ajax({ 
			    url: "empUpdate",
			   // type: 'PUT', 
			    dataType: 'json', 
			    data: $('#insertForm').serialize(),
			    success: function(data) { 
			    	$('#searchModel').modal("hide");
					empList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//userUpdate

	//사용자 조회 요청
	function empSelect() {
		//조회 버튼 클릭
		$('body').on('click', '#btnSelect', function() {
			var empNo = $(this).closest('tr').find('td').first().text();
			console.log(empNo);
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
		$('#searchModel').modal("show");
		$('input:text[name="empNo"]').val(emp.empNo);
		$('input:text[name="empName"]').val(emp.empName);
		$('input:text[name="password"]').val(emp.password);
		$('select[name="deptId"]').val(emp.deptId);
		$('select[name="position"]').val(emp.position);
		$('input:text[name="email"]').val(emp.email);
		$('input:text[name="phone"]').val(emp.phone);
		$('input:text[name="address"]').val(emp.address);
		$('input:text[name="gmailAppKey"]').val(emp.gmailAppKey);
		
	}//userSelectResult

	//사용자 목록 조회 요청
	function empList() {
		$('#foo-table').DataTable().destroy();
		$.ajax({
			url : 'emplist1',
			data : {deptId : '${param.deptId}'},
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
			$('<tr>')
			.append($('<td>').html(item.empNo))
			.append($('<td>').html(item.empName))
			.append($('<td>').html(item.deptName))
			.append($('<td>').html(item.position))
			.append($('<td>').html('<button id=\'btnSelect\' data-toggle=\'modal\' data-target=\'#searchModel\'>조회</button>'))
			.appendTo('tbody');
		});//each
		 $("#foo-table").DataTable();
	}//userListResult
	
	function echeckinit(){
		echeck=1;
	}
	
	//email check
	function emailcheck(){
		$('#btnEcheck').on('click',function(){
		var email = $("#email").val();
		if(email != "")
			
		$.ajax({
			data : {
				email : email
			},
			url : "emailcheck",
			success : function(data){
				if(data=='1'){
					$("#btnInsert").prop("disabled",true);
					$("#email").css("background-color","#FFCECE");
					$("#btnInsert").css("background-color","#aaaaaa");
					echeck = 1;
				}else {
					echeck=0;
					$("#btnInsert").prop("disabled",false);
					$("#email").css("background-color","#B0F6AC");
					$("#btnInsert").css("background-color","#9C27B0");
					
					
				}
			}
		});
		});
	}
	
</script>
<style type="text/css">

th { font-size: 15px; }
td { font-size: 15px; }

input[type=text] {
  width: 80%;
  height: 15px;
  padding: 12px;
  margin: 5px 0 22px 0;
  display: inline-block;
  background: #f1f1f1;
}

select {
  width: 80%;
  height: 15px;
  padding: 12px;
  margin: 5px 0 22px 0;
  display: inline-block;
  background: #f1f1f2;
}
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
			<div class ="card-body">
			<table class="table text-center" id="foo-table">
				<thead>
					<tr>
						<th class="text-center">사번</th>
						<th class="text-center">이름</th>
						<th class="text-center">부서</th>
						<th class="text-center">직책</th>
						<th class="text-center">조회</th>
					</tr>
				</thead>
				<tbody id="user"></tbody>
			</table> 
			</div>
		</div>
		<div style="float: right;">
				<button id="btnInsertForm" data-toggle="modal" data-target="#searchModel" class="btn btn-primary">등록</button>
				<button id="btnExcelUpForm" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/excelUploadPage'">엑셀 등록</button>
				<button id="btnExceldown" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/empExcelView.do'">회원목록 엑셀파일 다운</button>
		</div>
	</div>

<div id="searchModel" class="modal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">회원정보</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						
						<div class="modal-body">
							<form action="insertEmp" method="post" id="insertForm">
								
								<label for="empNo"><b>사번</b></label><br>
								<input type="text" name="empNo" id="empNo" readonly>
								
								<br> 
								<label for="empName"><b>이름</b></label><br> 
								<input type="text" name="empName" id="empName" required>
								
								<br> 
								<label for="password"><b>비밀번호</b></label><br> 
								<input type="text" name="password" id="password" required>
								<br>
								 
								<label for="deptId"><b>소속부서</b></label><br>
								<select 
									name="deptId" size="1" id="deptId">
									<option value="7" class="dropdown-item">회사</option>
									<option value="1" class="dropdown-item">경영지원팀</option>
									<option value="2" class="dropdown-item">회계</option>
									<option value="3" class="dropdown-item">인사</option>
									<option value="4" class="dropdown-item">연구관리팀</option>
									<option value="5" class="dropdown-item">개발</option>
									<option value="6" class="dropdown-item">테스트</option>
									
								</select>
								
								<br> 
								<label for="position"><b>직위</b></label><br> 
								<select 
									name="position" size="1" id="position">
									<option value="">선택</option>
									<option value="0">사원</option>
									<option value="1">대리</option>
									<option value="2">과장</option>
									<option value="3">차장</option>
									<option value="4">부장</option>
									<option value="5">대표</option>
								</select>
								
								<br> 
								<label for="email"><b>이메일</b></label><br> 
								<input type="text" name="email" id="email" required onkeydown="echeckinit()">
								<br>
								<button type="button" class="btn btn-primary" id="btnEcheck" >중복 확인</button>
								<br>
								
								<br> 
								<label for="phone"><b>휴대 전화</b></label><br> 
								<input type="text" name="phone" id="phone">
								
								<br>  
								<label for="address"><b>자택주소</b></label><br> 
								<input type="text" size="20" id="address" name="address">
								
								<br> 
								<label for="gmailAppKey"><b>GMAILAPPKEY</b></label><br> 
								<input type="text" size="20" id="gmailAppKey" name="gmailAppKey"> 
							</form>
						</div>
						<div class="modal-footer" style="float: right;">
							<button type="button" class="btn btn-primary" id="btnInsert">등록</button>
							<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
							<button type="button" class="btn btn-primary" id="btnUpdate" >수정</button>
							<button type="button" class="btn btn-primary" id="btnDelInsert">퇴사</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
				
			</div>
</body>
</html>