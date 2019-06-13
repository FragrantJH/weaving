<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="empInfo" value="${emp}" scope="session" />
<c:set var="docBaseInfo" value="${docInfo}"/>
<c:set var="docDetailInfo" value="${docDetailInfo}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Insert title here</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- ckeditor 스크립트 -->
<script src="//cdn.ckeditor.com/4.11.4/full/ckeditor.js"></script>
<style>
.approval-table th {
	background-color: #f9f9f9;
	height: 40px;
	width: 116px;
	vertical-align: middle;
	text-align: center;
}

.approval-table .stamp {
	display: table-cell;
	height: 80px;
	width: 116px;
	vertical-align: middle;
	text-align: center;
}

@media (min-width: 992px) {
  .modal-lg {
    max-width: 1200px;
  }
}

@media {
  .modal-approval-line-config {
    max-width: 558px;
  }
}

</style>
<script>
//jquery작업
$(function(){
	selectDocForm();
	selectSecureLevel();
	toLeftMove();
	toRightMove();
	makeApprovalListTable();
	loadDocPreview();
	checkSum();
	
	loadDocInfo();
	loadApprovalListTable();
});

function loadDocInfo() {
	$('input[name=docTitle]').val('${docBaseInfo.docTitle}');
	
	var strDocNo = '${docBaseInfo.docNo}';
	var strArr = strDocNo.split('-');
	var tagClassNo = 0;
	<c:forEach items="${list}" var="formList">
	if (strArr[0] == '${formList.formName}') {
		tagClassNo = '${formList.formId}';

	}
	</c:forEach>

	var $docFormTag = $('.curDocForm').clone();
	$('#write-select').text(strArr[0]);
	
	CKEDITOR.instances.docContents.setData($docFormTag.html());
	$('input[name=docType]').val(strArr[0]);
	$docFormTag.show();
	
	var secureLevel = '${docBaseInfo.secureLevel}';
	
	$('#secureLevelMenu').text(secureLevel+"등급");
	$('input[name=secureLevel]').val(secureLevel);	
	
}

function checkSum() {
	$('#approvalConfigBtn').on('click', function() {
		
		var emp = $('#empList option'); 
		
		for (var i = 0; i < emp.length; i++) {
			if ($('#empList option')[i].value == '${empInfo.empNo}') {
				$('#empList option')[i].remove();
				break;
			}
		}
	});
	
	$('form').on('click', 'button', function () {
		
		if ($('#write-select').text() == "선택") {
			alert("문서종류를 선택하세요");
			$('#write-select').focus();
			return false;
		}

		if ($('#secureLevelMenu').text() == "보안등급") {
			alert("보안등급을 선택하세요");
			$('#secureLevelMenu').focus();
			return false;
		}
		
		var approvalTb = $('.approval-line .approval-table');
		
		if (approvalTb.length == 0) {
			alert("결재선 설정을 해야합니다.");
			$('#approvalConfigBtn').focus();
			return false;				
		}

		if ($('input[name=docTitle]').val() == "") {
			alert("제목을 입력하세요");
			$('input[name=docTitle]').focus();
			return false;
		}
		var contents = CKEDITOR.instances.docContents.getData(); 
		
		if (contents == '') {
			alert("내용을 입력해주세요");
			CKEDITOR.instances.docContents.focus();
			return false;
		}

		if ($(this).hasClass('tempSave')) {
			$("form").attr("action", "${pageContext.request.contextPath}/docTemp");
		} else {
			$("form").attr("action", "${pageContext.request.contextPath}/docUpdate");
		}

		$('form').submit();
	});
}

function loadDocPreview() {
	$('#docPreview').on('show.bs.modal', function (e) {

		var date = new Date(); 
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = new String(date.getDate()); 

		// 한자리수일 경우 0을 채워준다. 
		if(month.length == 1){ 
		  month = "0" + month; 
		} 
		if(day.length == 1){ 
		  day = "0" + day; 
		}
		var docNum = '${docBaseInfo.docNo}';
		var strArr = docNum.split('-');
		var curDocType = strArr[0];
		var selectDocType = $("[name=docType]").val();
		var changDocType = "";
		if (curDocType == selectDocType) {
			changDocType = docNum;
		} else {
			changDocType = $("[name=docType]").val()+ "-" + year + month + day + "-xxxx";
		}
		
		$("#doc-title").html($("[name=docTitle]").val());
		var doc_info =	"<table border='0' style='all:none;'>" +
							"<tr>" +
								"<td>문서번호</td>" +
								"<td>"+changDocType+"</td>" +
							"</tr>"+
							"<tr>" +
								"<td>기안부서</td>" +
								"<td>${docBaseInfo.deptName}</td>" +							
							"</tr>"+
							"<tr>" +
								"<td>기안자</td>" +
								"<td>${docBaseInfo.empName}</td>" +							
							"</tr>"+
							"<tr>" +
								"<td>기안일자</td>" +
								"<td>"+year + "-" + month + "-" + day+"</td>" +							
							"</tr>"+
							"<tr>" +
								"<td>보안등급</td>" +
								"<td>${docBaseInfo.secureLevel}등급</td>" +
							"</tr>"+							
						"</table>";
						
		var approvalLine = $('.approval-line').clone();
		var data = CKEDITOR.instances.docContents.getData();
		
		$('#doc-info').html(doc_info);
		
		$('#approval-list-tb').html(approvalLine);
		$('#doc-write').html(data);
	});
	
	$('#docPreview').on('hidden.bs.modal', function (e) {
		$("#approval-list-tb .approval-line").remove();
	});
}

function selectDocForm() {
	$('.dropdown1').on('click', '.dropdown-menu button', function (e) {
		var formTagClass = $(this).attr('id');
		var $formTag = $('.'+formTagClass).clone();
		$('#write-select').text($(this).text());
		CKEDITOR.instances.docContents.setData($formTag.html());
		$('input[name=docType]').val($(this).text());
		$formTag.show();
	});
}
 
function selectSecureLevel() {
	$('.secureLevel-dropdown').on('click','.dropdown-menu button', function(e) {
		$('#secureLevelMenu').text($(this).text());
		$('input[name=secureLevel]').val($(this).text().split('등급')[0]);
	});
}

function makeApprovalListTable() {
	$('.modal-footer').on('click', '#rs-approval-list', function() {
		
		var approvalEmp = $('#approvalList option');
		var empCnt = approvalEmp.length;
		var tb = "";
		
		var DataArray = new Array();
		
		if (empCnt > 0) {	
			$('.approval-line').empty();
			
			var tb = "<table class='approval-table' border='1' bordercolor='#cdcdcd'>"+
						"<tr>" +
							"<th rowspan='2' scope='col'>"+
								"<div style='height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;'>"+
									"결재"+
								"</div>"+
							"</th>"+
							"<th scope='col' class='team name' data-order='1' data-empNo='${position}'>${empName}</td>";
			var writerData = {
					'empNo' : '${empInfo.empNo}',
					'approvalOrder' : '1',
					'status': 'DONE'
			};								

			DataArray.push(writerData);
			for (var i = 0; i < empCnt; i++) {
				var approvalData = {};
				var str = approvalEmp[i].text.split('(');
				
				tb +="<th scope='col' class='team name' data-order='" + (i + 2) + "' data-empNo='"+approvalEmp[i].value+"'>"+str[0]+"</th>";

				approvalData['empNo'] = approvalEmp[i].value;
				approvalData['approvalOrder'] = ''+(i + 2)+'';
				approvalData['status'] = 'WAIT';
				
				DataArray.push(approvalData);
			}
			
			
			tb += "</tr>"+
				  "<tr>" +
				  	"<td class='stamp'></td>";
			for (var i = 0; i < empCnt; i++) {
				tb += "<td class='stamp'></td>";
			}
			tb +="</tr>"+
				 "</table>";
			$('.approval-line').append(tb);
			console.log(DataArray);		
			var jsonString = JSON.stringify(DataArray);
		    var jsonData = JSON.parse(jsonString);
 
		   $("input[name=approvalList]").val(jsonString);
		}
		

    	$('#approvalLineModel').modal('hide');
	});

	
}

function loadApprovalListTable() {
	$('.approval-line-title').on('click', '#loadApprovalList', function() {
		$('.approval-line').empty();
		
		var tb = "<table class='approval-table' border='1' bordercolor='#cdcdcd'>"+
		"<tr>" +
			"<th rowspan='2' scope='col'>"+
				"<div style='height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;'>"+
					"결재"+
				"</div>"+
			"</th>";
		var dataArray = new Array();
		
		<c:forEach items="${docDetailInfo}" var="docDetailInfo">
			var approvalData = {};
			tb +="<th scope='col' class='team name' data-order='${docDetailInfo.approvalOrder}' data-empNo='${docDetailInfo.empNo}'>${docDetailInfo.empName}</th>";
			
			approvalData['empNo'] = '${docDetailInfo.empNo}';
			approvalData['approvalOrder'] = '${docDetailInfo.approvalOrder}';
			approvalData['status'] = 'WAIT';
			
			dataArray.push(approvalData);
		</c:forEach>

		tb +="</tr>"+
		  		"<tr>";		
		<c:forEach items="${docDetailInfo}" var="docDetailInfo">
			tb += "<td class='stamp'></td>";
		</c:forEach>

		tb +="</tr>"+
		 	"</table>";
		$('.approval-line').append(tb);
		
		var jsonString = JSON.stringify(dataArray);
	    var jsonData = JSON.parse(jsonString);

	   $("input[name=approvalList]").val(jsonString);		
	});
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
</script>
</head>
<body>
<div class="container-fluid">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header card-header-text card-header-primary">
				<div class="card-text">
					<h4 class="card-title">문서 수정하기</h4>
				</div>
			</div>


			<div class="card-body">
				<h3>
					<small class="text-muted">기본 설정</small>
				</h3>

				<table class="table">
					<tbody>
						<tr>
							<td class="text-center">기안자</td>
							<td colspan="3">${docBaseInfo.empName}</td>
						</tr>
						<tr>
							<td class="text-center">문서종류</td>
							<td>
								<div class="dropdown1">
									<button class="btn btn-secondary dropdown-toggle" type="button"
										id="write-select" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">선택</button>
									<div class="dropdown-menu" aria-labelledby="write-select">
										<c:forEach items="${list}" var="formList">
											<button class="dropdown-item" id="docForm${formList.formId}"
												type="button">${formList.formName}</button>
											<div class="docForm${formList.formId}" style="display: none;">
												${formList.formContents}</div>
										</c:forEach>
									</div>
									<!-- Button trigger modal -->
									<small><a href="#0" class="card-link"
										data-toggle="modal" data-target="#docPreview">미리보기</a></small>
								</div> <!-- Modal -->
								<div class="modal fade" id="docPreview" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLongTitle"
									aria-hidden="true">
									<div class="modal-dialog modal-lg" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLongTitle">미리보기</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<h3 id="doc-title" style="text-align:center; margin-bottom: 20px;"></h3>
												<div id="doc-info" style="display:inline-block;"></div>
												<div id="approval-list-tb" style="display:inline-block; float:right;"></div>
												<h3>상세 입력</h3>
												<div id="doc-write" style="border:1px solid black;"></div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>
							</td>
							<td class="text-center">보안등급</td>
							<td>
								<div class="secureLevel-dropdown">
									<button class="btn btn-secondary dropdown-toggle" type="button"
										id="secureLevelMenu" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">보안등급</button>

									<div class="dropdown-menu" aria-labelledby="secureLevelMenu">
										<button class="dropdown-item" type="button">S등급</button>
										<button class="dropdown-item" type="button">A등급</button>
										<button class="dropdown-item" type="button">B등급</button>
										<button class="dropdown-item" type="button">C등급</button>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="approval-line-title">
					<h3 style="display: inline;">
						<small class="text-muted">결재선</small>
					</h3>
					<small><a href="#0" id="loadApprovalList" class="card-link">기존설정 불러오기</a></small>
					<small><a href="#0" id="approvalConfigBtn" class="card-link" data-toggle="modal"
						data-target="#approvalLineModel">결재선설정</a></small>						
				</div>
				<div class="approval-line">결재선 설정되면 노출됩니다.</div>
				<!-- modal 페이지 -->
				<div class="modal fade" id="approvalLineModel"
					tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-approval-line-config">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title card-title">결재자 설정</h5>
							</div>
							<div class="modal-body">
								<table class="table">
									<thead>
										<tr>
											<th>직원 목록</th>
											<th></th>
											<th>결재자</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td rowspan="2"><select id="empList" size="7"
												style="width: 200px;">
													<c:forEach items="${empList}" var="empList">
														<a class="dropdown-item" href="#">${formList.formName}</a>
														<option class="order${orderNo}" value="${empList.empNo}">${empList.empName}(${empList.deptName}, ${empList.position})
													</c:forEach>
											</select></td>
											<td style="border: none;"><button type="button"
													id="toRight" class="btn btn-default .btn-sm">&gt;&gt;</button></td>
											<td rowspan="2"><select id="approvalList" size="7"
												style="width: 200px;">
											</select></td>
										</tr>
										<tr>
											<td style="border: none;"><button type="button"
													id="toLeft" class="btn btn-default .btn-sm">&lt;&lt;</button></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="modal-footer justify-content-center">
								<button type="button" id="rs-approval-list"
									class="btn btn-primary">확인</button>							
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>

				<h3>
					<small class="text-muted">상세 입력</small>
				</h3>
				<form action="${pageContext.request.contextPath}/docUpdate"
					method="post">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <label>제목</label>
							</span>
						</div>
						<input type="text" name="docTitle" class="form-control"
							placeholder="제목을 입력하세요" style="margin-bottom: 8px;">
					</div>

					<div class="approval-form">
						<textarea name="docContents" id="docContents" rows="10" cols="200">
					</textarea>
						<script>
					    // Replace the <textarea id="editor1"> with a CKEditor
					    // instance, using default configuration.
					    CKEDITOR.replace( 'docContents' );
					</script>
						<input name="docId" type="hidden" value="${docBaseInfo.docId}">
						<input name="docType" type="hidden" value="">
						<input name="writerEmpNo" type="hidden" value="${empInfo.empNo}">
						<input name="secureLevel" type="hidden" value="">
						<input name="approvalList" type="hidden" value="">
					</div>
					<div style="float:right;">
						<button type="button" class="btn btn-primary tempSave" >임시저장</button>
						<button type="button" class="btn btn-primary" >결재</button>
					</div>
				</form>
				<div class="docForm${formList.formId}" style="display: none;">
												${formList.formContents}</div>				
				<div class="curDocForm" style="display: none;">${docBaseInfo.docContents}</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>