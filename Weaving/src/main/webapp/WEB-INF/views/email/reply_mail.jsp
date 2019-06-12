<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

.align_cover{

    vertical-align: middle;
    text-align: right;
    position: absolute;
    right: 20px;

}
.h4{
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}



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
											<td><input type="text" name="toEmail" placeholder="${to}"><br>
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
			<div class="send-button" style="float:right;">
							<input type="submit" class="btn btn-primary btn-sm" value="보내기" id="send-button" onclick="checkform()"/>
						</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>