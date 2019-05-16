<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<!-- CSS Files -->
<link href="/assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/assets/demo/demo.css" rel="stylesheet" />

<!-- ckeditor 스크립트 -->
<!-- <script src="//cdn.ckeditor.com/4.11.4/standard/ckeditor.js"></script> -->
 <script src="//cdn.ckeditor.com/4.11.4/basic/ckeditor.js"></script> 
</head>
<body>
<select>
	<option value="">보존 연한</option>
	<option value="1">1년</option>
	<option value="3">3년</option>
	<option value="5">5년</option>
	<option value="10">10년</option>
	<option value="0">영구</option>
</select>
<table class="tableType02" border="1">
<caption>전자결재 기본 설정</caption>
<colgroup>
	<col style="width:12.15%;">
	<col style="width:44.94%">
	<col style="width:12.15%">
	<col style="width:30.76%">
</colgroup>
<tbody>
	<tr>
		<th scope="row">문서 종류</th>
		<td>
		<!-- 
			<select name="approval_category_no" class="write-select" autocomplete="off">
				<option value="2137" selected="">공용</option>
			</select>
		-->
			<input type="hidden" id="prevApprovalCategoryNo" value="2137">
			
			<div class="btn-group">
			  <button type="button" class="btn btn-secondary">선택</button>
			  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    <span class="sr-only">Toggle Dropdown</span>
			  </button>
			  <div class="dropdown-menu">
			    <a class="dropdown-item" href="#">샘플</a>
			    <a class="dropdown-item" href="#">샘플2</a>
			    <a class="dropdown-item" href="#">샘플3</a>
			    <!-- 
			    <div class="dropdown-divider"></div>
			    <a class="dropdown-item" href="#">Separated link</a>
			     -->
			  </div>
			</div>
			<!-- 		
			<select name="approval_form_no" class="write-select" autocomplete="off">
				<option value=""></option>
				<option value="16009"></option>
				<option value="16010">샘플2</option>
				<option value="16011">신청</option>
			</select>
			 -->
			<button class="weakblue" onclick="ApprovalDocument.getSelectApprovalForm();">문서보기</button>
			<input type="hidden" id="prevApprovalFormNo" value="16009">
			<input type="hidden" id="prevApprovalFormTitle" value="">
		</td>
		<th scope="row">기안자</th>
		<td>
			<input type="hidden" name="node_id" value="31827">
			<span>이학영</span>
		</td>
	</tr>
	<tr>
		<th scope="row">보존 연한</th>
		<td>
			<div class="btn-group">
			  <button type="button" class="btn btn-secondary">보존 연한</button>
			  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    <span class="sr-only">Toggle Dropdown</span>
			  </button>
			  <div class="dropdown-menu">
			    <a class="dropdown-item" href="#">1년</a>
			    <a class="dropdown-item" href="#">3년</a>
			    <a class="dropdown-item" href="#">5년</a>
			    <a class="dropdown-item" href="#">10년</a>
			    <!-- 
			    <div class="dropdown-divider"></div>
			    <a class="dropdown-item" href="#">Separated link</a>
			     -->
			  </div>
			</div>
			<!-- 
			<select name="preserved_term" class="fl write-select" id="set_preserved_term_y">
				<option value="">보존 연한</option>
				<option value="1">1년</option>
				<option value="3">3년</option>
				<option value="5">5년</option>
				<option value="10">10년</option>
				<option value="0">영구</option>
			</select>
			 -->
			<span class="fl hide" id="set_preserved_term_n" style="display: none;">년</span>
			<a href="javascript:void(0)" class="icon question tipsIcon" style="position: relative;top:4px;margin-left:10px"><span class="blind">세부 설명</span></a>
			<div class="tooltip hide" style="left:0;top:0">
				<div class="tooltip-box" style="width:570px;">
					<p>ㆍ1년: 경미한 연결 문서 및 일시적인 사용 또는 처리에 그치는 문서</p>
					<p>ㆍ3년: 사무의 수행상 1년 이상에 걸쳐 참고 또는 이용해야 할 문서 및 법률상 3년간 보존을 요하는 문서</p>
					<p>ㆍ5년: 사무의 수행상 3년 이상에 걸쳐 참고 또는 이용해야 할 문서 및 법률상 5년간 보존을 요하는 문서</p>
					<p>ㆍ10년: 사무의 수행상 장기간 참고 또는 이용해야 할 문서 및 법률상 10년간 보존을 요하는 문서</p>
					<p>ㆍ영구: 회사의 존속에 필요 불가결한 문서 및 역사적 또는 기타 사유로 중요한 문서</p>
				</div>
			</div>
		</td>
		<th scope="row">보안 등급</th>
		<td>
			<div class="btn-group">
			  <button type="button" class="btn btn-secondary">보안 등급</button>
			  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    <span class="sr-only">Toggle Dropdown</span>
			  </button>
			  <div class="dropdown-menu">
			    <a class="dropdown-item" href="#">S등급</a>
			    <a class="dropdown-item" href="#">A등급</a>
			    <a class="dropdown-item" href="#">B등급</a>
			    <a class="dropdown-item" href="#">C등급</a>
			    <!-- 
			    <div class="dropdown-divider"></div>
			    <a class="dropdown-item" href="#">Separated link</a>
			     -->
			  </div>
			</div>
			<!-- 		
			<select name="security_level" class="fl write-select" id="set_security_level_y">
				<option value="">보안 등급</option>
				<option value="S">S등급</option>
				<option value="A">A등급</option>
				<option value="B">B등급</option>
				<option value="C">C등급</option>
			</select>
			 -->
			<span class="fl hide" id="set_security_level_n" style="display: none;">등급</span>
			<a href="javascript:void(0)" class="icon question tipsIcon" style="position: relative;top:4px;margin-left:10px"><span class="blind">세부 설명</span></a>
			<div class="tooltip hide" style="right:150px;top:0;">
				<div class="tooltip-box" style="width:450px;">
					<p>ㆍS등급: 기안 상에 설정된 관련자들만 문서를 볼 수 있으며, 결재자와 합의자만 참조자를 추가할 수 있음.</p>
					<p>ㆍA등급: 기안 상에 설정된 관련자들과 관리자가 설정한 5등급(과장)등급 이상인 사람이 문서를 볼 수 있음. 결재자와 합의자는 참조자를 추가할 수 있음.</p>
					<p>ㆍB등급: 기안 상에 설정된 관련자들과 관리자가 설정한 7등급(사원)등급 이상인 사람이 문서를 볼 수 있음. 결재자, 합의자, 참조자 모두 참조자를 추가할 수 있음.</p>
					<p>ㆍC등급: 모든 임직원이 문서를 열람할 수 있지만, 기안 상에 설정된 관련자들만 참조자를 추가할 수 있음.</p>
				</div>
			</div>
		</td>
	</tr>
</tbody>
</table>
<form>
	<textarea name="editor1" id="editor1" rows="10" cols="80">
	    This is my textarea to be replaced with CKEditor.
	</textarea>
	<script>
	    // Replace the <textarea id="editor1"> with a CKEditor
	    // instance, using default configuration.
	    CKEDITOR.replace( 'editor1' );
	</script>
</form>
</body>
</html>