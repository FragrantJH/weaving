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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- ckeditor 스크립트 -->
<script src="//cdn.ckeditor.com/4.11.4/full/ckeditor.js"></script>
 
<script>
//jquery작업
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
							    <a class="dropdown-item" href="#">Action</a>
							    <a class="dropdown-item" href="#">Another action</a>
							    <a class="dropdown-item" href="#">Something else here</a>
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
			<h3><small class="text-muted">결제선</small></h3>
			<div class="approval-line">문서 종류 선택 시 결재선이 노출됩니다.
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