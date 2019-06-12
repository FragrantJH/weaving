<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.11.4/full/ckeditor.js"></script>

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
<!-- 	메일보기  -->
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
	<form action="mailSend" method="get" >
		<div class="card-body">
			<div class="table-responsive">
		<div class="bigpage">
			
			<div>
				<div>
				<div class="align_cover">
							보낸시간 : ${rEmail.checkTime}
					</div>
					<h4>제목 :  ${rEmail.title}</h4>
							<dl>
								<dt>보낸사람 </dt>
								<dd>${rEmail.fromInbox}</dd>
								
								<dt>받는사람</dt>
								<dd>${rEmail.toInbox}</dd>
							</dl>
						<div>
									내용 : ${rEmail.inboxContents}
						</div>	
					</div>
					</div>
				</div>
				</div>
				</div>
		</form>
		<div class="send-button" style="float:right;">
		
						<button type="button" class="btn btn-primary btn-sm"
								onclick="location='${pageContext.request.contextPath}/meilDelete?inboxid=${rEmail.inboxid}'">삭제</button>
						
						<button type="button" class="btn btn-primary btn-sm"
									onclick="location='${pageContext.request.contextPath}/replyForm/${rEmail.fromInbox}'">답장</button>
						
			</div>	  
		</div>
	</div>
	</div>
</div>

</body>
</html>