<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
							<h4 class="card-title">받은 메일
								</h4>
						</div>
					</div>
				<form action="mailSend" method="post" name="frm">
					<div class="bigpage">
						<div class="send-button">
							<input type="button" class="btn btn-primary btn-sm" value="보내기" id="send-button" onclick="checkform()"/>
						</div>
			
						<div class="card-body">
							<div class="table-responsive">
								<table class="table">
									<thead class=" text-primary">
									<tbody>
										<tr class="Recipient">
											<th>보내는사람
											</th>
											<td>
												<input type="text" name="fromEmail" placeholder="${emp.email}"><br>
											</td>
									</tr>
									<tr>
										<th>받는사람 
										</th>
											<td><input type="text" name="toEmail"><br>
											</td>
									</tr>
									<tr class=title>
										<th>제목</th>
									<td><input type="text" name="subject"><br></td>
									</tr>
								</tbody>
						</table>
					</div>
					<div class="editer-textarea">
					<textarea name=emailContents id="emailContents" rows="10" cols="100"></textarea>

								<script>
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
						 oAppRef: oEditors,
						 elPlaceHolder: "emailContents",
						 sSkinURI:"./resources/workspace/SmartEditor2Skin.html" ,
						 fCreator: "createSEditor2"
						});
						</script>

					</div>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>


</body>
</html>
