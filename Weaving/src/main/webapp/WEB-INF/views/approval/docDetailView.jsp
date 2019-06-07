<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="empInfo" value="${emp}" scope="session" />
<c:set var="docType" value="${docListType}" scope="session" />
<c:set var="docBaseInfo" value="${docInfo}"/>
<c:set var="docDetailInfo" value="${docDetailInfo}"/>
<c:set var="docComment" value="${docCommentInfo}"/>
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
.appraoval-date {
	height: 40px;
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
	showDocTypeBtn();
	showRejectBtn();
	approvalSendEvent();
});

function showRejectBtn() {
	if (${empInfo.empNo} != ${docBaseInfo.empNo}) {
		$("#approvalReject").show();
	}
}

function menuMove() {
	var docType = "";
	switch('${docType}') {
		case 'WAIT':
			docType="WAIT";	
			break;
		case 'RETURN':
			docType="RETURN";			
			break;
		case 'DONE':
			docType="DONE";
			break;
		case 'ING':
			docType="ING";
			break;
		default:
			alert("예외 문서 타입이 발생했습니다.");
			break;
		}
	location.replace('${pageContext.request.contextPath}/docList?listType='+docType);	
}
function showDocTypeBtn() {

	switch('${docType}') {
		case 'WAIT':
			//$("#approvalRecordBtn").show();  
			$("#approvalDoneBtn").show();		
			break;
		case 'RETURN':
			$("#modifyBtn").show();  
			$("#approvalRecordBtn").show();  
			$("#approvalDoneBtn").show();			
			break;
		case 'DONE':
			//$("#approvalRecordBtn").show();
			break;
		case 'ING':
			//$("#approvalRecordBtn").show();
			break;
		default:
			console.log('${docType}');
			alert("예외 코드 ${docType}가 발생했습니다.");
			break;
		}
}

function approvalSendEvent() {
	$('.modal-footer').on('click', '#approvalSend', function() {
		$.ajax({
		    url: "updateDone",
		    type: 'PUT', 
		    dataType: 'json', 
		    data: JSON.stringify({
		    	docId: ${docBaseInfo.docId},
		    	empNo: ${empInfo.empNo},
		    	approvalComments: $('#approvalComment').val()
		    	}),
		    //서버에 데이터를 보낼 때 사용 content - type 헤더의 값
		    contentType: 'application/json',
		    //mimeType: 'application/json',
		    success: function(data) {
		    	//$('#approvalModal').modal("hide");
		    	menuMove();
		    },
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    }
		});
	});
	
	$('.modal-footer').on('click', '#approvalReject', function() {
		$.ajax({ 
		    url: "updateReturn",
		    type: 'PUT',
		    dataType: 'json', 
		    data: JSON.stringify({
		    	docId: ${docBaseInfo.docId},
		    	empNo: ${empInfo.empNo},
		    	writerEmpNo: ${docBaseInfo.empNo},
		    	approvalComments: $('#approvalComment').val()
		    	}),
		    //서버에 데이터를 보낼 때 사용 content - type 헤더의 값
		    contentType: 'application/json',
		    //mimeType: 'application/json',
		    success: function(data) {
		    	menuMove();
		    },
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    }
		});
	});
	
	$('.card-body').on('click', '#modifyBtn', function() {
		location.replace('${pageContext.request.contextPath}/docUpdateView?docId='+${docBaseInfo.docId});
	});
	
}
</script>
<body>
${docComment}
<div class="container-fluid">
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
						<button type="button" class="btn btn-primary" id="modifyBtn" style="display:none;">수정하기</button>
						<button type="button" class="btn btn-primary" id="approvalRecordBtn" data-toggle="modal" data-target="#commantModal" style="display:none;">결재이력</button>
						<button type="button" class="btn btn-primary" id="approvalDoneBtn" data-toggle="modal" data-target="#approvalModal" style="display:none;">결재하기</button>
					</div>
					<!-- 결재이력 모달 -->
					<div class="modal fade" id="commantModal" tabindex="-1" role="dialog" aria-labelledby="commantModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="commantModalLabel">결재이력</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								<!--
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><label>의견</label></span>
										</div>
										<input type="text" id="approvalComment" class="form-control" size="100" placeholder="의견을 입력하세요" style="margin-bottom: 8px;">
									</div>
								-->
									<table class="table">
									    <thead>
									        <tr>
									            <th class="text-center">반려자</th>
									            <th>부서</th>
									            <th>직급</th>
									            <th>사유</th>
									        </tr>
									    </thead>
									    <tbody>
								    		<tr>
									    		<td class="text-center">${docComment.empName}</td>
								    			<td>${docComment.deptName}</td>
								    			<td>${docComment.position}</td>
								    			<td>${docComment.approvalComments}</td>								    			
							    			</tr>								    											    											    			
									    </tbody>
									</table>														
								</div>
								
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>					
					<!-- 결재하기 모달 -->
					<div class="modal fade" id="approvalModal" tabindex="-1" role="dialog" aria-labelledby="approvalModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="approvalModalLabel">결재하기</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><label>의견</label></span>
										</div>
										<input type="text" id="approvalComment" class="form-control" size="100" placeholder="의견을 입력하세요" style="margin-bottom: 8px;">
									</div>									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" id="approvalReject" style="display:none;">Reject</button>
									<button type="button" class="btn btn-primary" id="approvalSend">Approval</button>
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
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
					<div style="dispaly:inline-block; float:right;">
						<table class='approval-table' border='1' bordercolor='#cdcdcd'>
							<tr>
								<th rowspan='3' scope='col'>
									<div style='height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;'>
									결재
									</div>
								</th>
								<c:forEach items="${docDetailInfo}" var="docDetailInfo">
									<th scope='col' class='appraval name'>${docDetailInfo.empName}</th>
								</c:forEach>
							</tr>
				  			<tr>
								<c:forEach items="${docDetailInfo}" var="docDetailInfo">					
									<c:choose>
										<c:when test="${docDetailInfo.status eq 'DONE'}">
											<td class='stamp'>승인</td>
										</c:when>
										<c:when test="${docDetailInfo.status eq 'RETU'}">
											<td class='stamp'>반려</td>
										</c:when>
										<c:otherwise>
										    <td class='stamp'></td>
										</c:otherwise>
									</c:choose>				
								</c:forEach>				  			
							</tr>
							<tr>
								<c:forEach items="${docDetailInfo}" var="docDetailInfo">
									<td scope='col' class='appraoval-date'>${docDetailInfo.approvalDate}</td>
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
</div>
</body>
</html>