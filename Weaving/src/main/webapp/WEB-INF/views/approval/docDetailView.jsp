<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="docBaseInfo" value="${docInfo}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
#docDetailContents {
    pointer-events: none;
}
</style>
</head>
<script>
$(function() {
	makeApprovalListTable();
});
	
function makeApprovalListTable() {		
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
			var ApprovalData = {};
			var str = approvalEmp[i].text.split('(');
			
			tb +="<th scope='col' class='team name' data-order='" + (i + 2) + "' data-empNo='"+approvalEmp[i].value+"'>"+str[0]+"</th>";

			ApprovalData['empNo'] = approvalEmp[i].value;
			ApprovalData['approvalOrder'] = ''+(i + 2)+'';
			ApprovalData['status'] = 'wait';
			
			DataArray.push(ApprovalData);
		}
		
		
		tb += "</tr>"+
			  "<tr>" +
			  	"<td class='stamp'>승인</td>";
		for (var i = 0; i < empCnt; i++) {
			tb += "<td class='stamp'></td>";
		}
		tb +="</tr>"+
			 "</table>";
		$('.approval-line').append(tb);
	
		var jsonString = JSON.stringify(DataArray);
	    var jsonData = JSON.parse(jsonString);

	   $("input[name=approvalList]").val(jsonString);
	}	
}
</script>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header card-header-text card-header-primary">
					<div class="card-text">
						<h4 class="card-title">결재 문서</h4>
					</div>
				</div>
				<div class="card-body">
					<div style="float:right;">
						<button type="button" class="btn btn-primary">결재이력</button>
						<button type="button" class="btn btn-primary">결재하기</button>
					</div>
					<h3 id="doc-title" class="text-center">${docBaseInfo.docTitle}</h3>
					<div style="display:inline-block;">
						<table class="table">
							<tr>
								<th>문서번호</th>
								<th>${docBaseInfo.docNo}</th>
							</tr>
							<tr>
								<th>기안부서</th>
								<th>${docBaseInfo.deptName}</th>
							</tr>							
							<tr>
								<th>기안자</th>
								<th>${docBaseInfo.empName}</th>
							</tr>							
							<tr>
								<th>기안일자</th>
								<th>${docBaseInfo.regDate}</th>
							</tr>
							<tr>
								<th>보안등급</th>
								<th>${docBaseInfo.secureLevel}</th>
							</tr>
						</table>
					</div>
					<!--
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
				var ApprovalData = {};
				var str = approvalEmp[i].text.split('(');
				
				tb +="<th scope='col' class='team name' data-order='" + (i + 2) + "' data-empNo='"+approvalEmp[i].value+"'>"+str[0]+"</th>";

				ApprovalData['empNo'] = approvalEmp[i].value;
				ApprovalData['approvalOrder'] = ''+(i + 2)+'';
				ApprovalData['status'] = 'wait';
				
				DataArray.push(ApprovalData);
			}
			
			
			tb += "</tr>"+
				  "<tr>" +
				  	"<td class='stamp'>승인</td>";
			for (var i = 0; i < empCnt; i++) {
				tb += "<td class='stamp'></td>";
			}
			tb +="</tr>"+
				 "</table>";					 
					 -->
					<div style="dispaly:inline-block; float:right;">
						<table class='approval-table' border='1' bordercolor='#cdcdcd'>
							<tr>
								<th rowspan='2' scope='col'>
									<div style='height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;'>
									결재
									</div>
								</th>
								<c:forEach items="${docDetailInfo}" var="docDetailInfo">
									<th scope='col' class='team name'>${docDetailInfo.empName}</th>
								</c:forEach>
							</tr>
				  			<tr>
								<c:forEach items="${docDetailInfo}" var="docDetailInfo">
									<c:if test="${docDetailInfo.status eq 'DONE'}">
										<td class='stamp'>승인</td>
									</c:if>
									<c:if test="${docDetailInfo.status ne 'DONE'}">
										<td class='stamp'></td>
									</c:if>									
								</c:forEach>				  			
							</tr>							
				 		</table>					
					</div>
					<h3>상세 입력</h3>
					<div id="docDetailContents" style="border:1px solid black;">
						${docBaseInfo.docContents}
					</div>										
				</div>
				<div class="card-footer">
					<div class="stats">
					<i class="material-icons">access_time</i> campaign sent 2 days ago
					</div>
				</div>				
			</div>
		</div>
	</div>
	<!-- 
		<div class="col-md-6">
			<div class="card">
				<div class="card-header card-chart card-header-success">
					<div class="ct-chart" id="completedTasksChart"></div>
				</div>
				<div class="card-body">
					<h4 class="card-title">Completed Tasks</h4>
					<p class="card-category">Last Campaign Performance</p>
				</div>
				<div class="card-footer">
					<div class="stats">
						<i class="material-icons">access_time</i> updated 2 minutes ago
					</div>
				</div>
			</div>
		</div>
	</div>
	 -->
	<!-- 
	<div class="col-md-12">
		<div class="card">
			<div class="card-header card-header-text card-header-primary">
				<div class="card-text">
					<h4 class="card-title">결재 문서</h4>
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
							<td colspan="3">${empName}</td>
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

									<small><a href="#0" class="card-link"
										data-toggle="modal" data-target="#docPreview">미리보기</a></small>
								</div> 
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
												<h3 id="doc-title"></h3>
												<div id="doc-info" style="display:inline-block;"></div>
												<div id="approval-list-tb" style="display:inline-block; float:right;"></div>
												<h3>상세 입력</h3>
												<div id="doc-write" style="border:1px solid black;"></div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
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
					<small><a href="#0" id="approvalConfigBtn" class="card-link" data-toggle="modal"
						data-target="#approvalLineModel">결재선설정</a></small>
				</div>
				<div class="approval-line">결재선 설정되면 노출됩니다.</div>
				
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
									class="btn btn-primary">Save changes</button>							
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<h3>
					<small class="text-muted">상세 입력</small>
				</h3>
				<form action="${pageContext.request.contextPath}/docInsert"
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
						<input name="docType" type="hidden" value=""> <input
							name="empNo" type="hidden" value="${empInfo.empNo}"> <input
							name="secureLevel" type="hidden" value=""> <input
							name="approvalList" type="hidden" value="">
					</div>
					<button type="button" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>
	-->
</body>
</html>