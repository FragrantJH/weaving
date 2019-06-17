<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdn.ckeditor.com/4.11.4/full/ckeditor.js"></script>
<script type="text/javascript"
	src="./resources/workspace/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
	
<!-- 메일보내기 -->
<script type="text/javascript">

function checkform() {
	
	oEditors.getById["emailContents"].exec("UPDATE_CONTENTS_FIELD", []);
	if(frm.subject.value==""){
		alert("제목을 입력");
		return ;
	}

	frm.submit();
}
</script>


<style type="text/css">



</style>
</head>

<body>

<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<div class="card">
					<div class="card-header card-header-text card-header-primary">
						<div class="card-text">
							<h4 class="card-title">메일쓰기
								</h4>
						</div>
					</div>
				<form action="mailSend" method="post" name="frm">
					<div class="bigpage">

						<div class="card-body">
							<div class="table-responsive">
									<div>
									<label for="usr">보내는사람</label>
									<input type="text"  class="form-control" id="title"name="fromEmail" readonly value="${emp.email}"><br>
									</div>
									<div>
										<label for="usr">받는사람 </label>
										<input type="text"  class="form-control" id="title"name="toEmail"><br>
								</div>
								<div>
										<label for="usr">제목</label>
										<input type="text" class="form-control" id="title" name="subject"><br>
									</div><br>
					</div><br>
					<div class="editer-textarea">
					<textarea name=emailContents id="emailContents" rows="100" cols="80" style=" width: auto; height: 300px;"></textarea>

								<script>
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
						 oAppRef: oEditors,
						 elPlaceHolder: "emailContents",
						 sSkinURI: "./resources/workspace/SmartEditor2Skin.html",
						 fCreator: "createSEditor2"
						});
						</script>

					</div>
					</div>
					<div  class="send-button" style="float:right;">
							<input type="button" class="btn btn-primary btn-sm" value="보내기" id="send-button" onclick="checkform()"/>
						</div>
				</div>
			</form>
			
			</div>
		</div>
	</div>
</div>


</body>
</html>
