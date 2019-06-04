<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.11.4/full/ckeditor.js"></script>
<script>
	$(function() {

		
		//댓글 수정 이벤트
		$("#btnUpd").click(function(){
			var params = $("[name=updateForm]").serialize();
			var url =  "${pageContext.request.contextPath}/reply/updateReply";
			$.getJSON(url, params, function(datas){
				
				$("#con_"+datas.replyId).text(datas.repContents);
				$("#updateReply").hide();  
			});
		});
		
		
		//수정폼 이벤트(수정할 댓글밑에 수정폼 보이게 함)
		$("#getReplyList").on("click", ".btnUpdFrm", function(){
			var replyId = $(this).parent().parent().attr("id").substring(0);
			
			console.log(replyId);
			console.log($("#name_"+replyId).text());
			
			//수정할 데이터 입력필드에 셋팅
			$("#updateForm [name=replyId]").val(replyId);    
			$("#updateForm [name=repContents]").val($("#con_"+replyId).text());
			//수정할 댓글밑으로 이동하고 보이게
			$("#c"+replyId).append($('#updateReply'));  
			$('#updateReply').show();   
		});

		
		//수정 취소 이벤트
		$("#btnCancel").click(function(){
			$("[name=updateForm]")[0].reset();   //폼 필드 클리어
			$("#repContents").append( $("#updateReply") );//수정 폼(div)를 이동
			$("#updateReply").hide();    // 수정폼 숨기기
		});


		//댓글 쓰기 버튼 클릭 이벤트
		$("#btnReply").click(function() {
			var repContents = $("#repContents").val();
			var boardId = "${board.boardId}"
			var param = "repContents=" + repContents + "&boardId=" + boardId;
			console.log(param);
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/reply/insert.do",
				data : param,
				success : function() {
					alert("댓글이 등록되었습니다.");
					getReplyList();
				}
			});
		});
			
		//목록 불러오기
		getReplyList(); //json 리턴방식
	})
		//댓글 목록(json)
		function getReplyList() {
			var boardId = $('#boardId').val();
			$
					.ajax({
						type : "get",
						url : "${pageContext.request.contextPath}/reply/listJson.do?boardId="
								+ boardId,
						success : function(result) {
							console.log(result);
							var output = "<table>";
							for ( var i in result) {
								var currentTime = new Date(
										parseInt(result[i].time));
								var month = currentTime.getMonth() + 1;
								var day = currentTime.getDate();
								var year = currentTime.getFullYear();
								var hour = currentTime.getHours();
								var minutes = currentTime.getMinutes();
								var date = year + "/" + month + "/" + day + "/"
										+ hour + ":" + minutes;
								
								output += "<tr id='" + result[i].replyId + "'>"; 
								output += "<td id='name_" + result[i].replyId + "'>" + result[i].empName + "</td>";
								output += "<td>" + "(" + date + ")" + "</td>";
								output += "<td id='con_" + result[i].replyId + "'>" + result[i].repContents + "</td>"; 
								if (result[i].empNo == "${emp.empNo}"){
									output += '<td><button type="button" class="btn btn-primary btn-sm btnUpdFrm" >수정</button>'+ "</td>";
									output += '<td><button type="button" class="btn btn-primary btn-sm" onclick="deleteReply(event)">삭제</button>'+ "</td>";
								}
								output += "</tr>";
							}
							output += "</table>";
							
							console.log(output);
							
							$("#getReplyList").html(output);
						}
					});
				}

	

	// 댓글 삭제
	function deleteReply(event) {
		if(confirm("삭제하시겠습니까?")){
			var replyId = $(event.target).parent().parent().attr("id");
			$.ajax({
			type: "delete",
			url: "${pageContext.request.contextPath}/reply/delete/"+replyId,
			success: function(result){
				if(result == "success"){
					alert("삭제되었습니다.");
					$("#" + replyId).remove();
				
				}
			}
		});
	}	
}

	
</script>
</head>
<body>
	<div class="col-md-12">
		<div class="card">
			<div class="card-header card-header-text card-header-primary">
				<div class="card-text">
					<h4 class="card-title">${boardType}</h4>
				</div>
			</div>
			<br> <br>
			<div class="card-body">
				<form name="board" method="post">
					<input type='hidden' id="boardId" name="boardId"
						value="${board.boardId}">
					<div class="form-group">
						<label for="usr">제목</label> <input type="text"
							class="form-control" id="title" name="title" readonly
							value="${board.title}">
					</div>
					<div class="form-group">
						<label for="usr">작성자</label> <input type="text"
							class="form-control" id="empName" name="empName" readonly
							value="${board.empName}">
					</div>
					<br>
					<div>${board.boardContents}</div>
					<br> <br> <br> <br> <br> <br> <br> <br> <br>
					<div style="float:right;">
						<button type="button" class="btn btn-primary btn-sm" 
							onclick="location.href='${pageContext.request.contextPath}/boardList?boardType=${boardType}'">목록</button>
						<c:if test="${board.empNo == emp.empNo}">
							<button type="button" class="btn btn-primary btn-sm"
								onclick="location.href='${pageContext.request.contextPath}/boardUpdate/${board.boardId}'">수정</button>
							<button type="button" class="btn btn-primary btn-sm"
								onclick="location='${pageContext.request.contextPath}/boardDelete?boardId=${board.boardId}'">삭제</button>
						</c:if>
					</div>
					<!--댓글 입력  -->
					<div>
						<br>
						<div class="form-group">
							Comment <input type="text" id="repContents" class="form-control">
						</div>
						<br>
						<button type="button" class="btn btn-primary btn-sm" id="btnReply">댓글
							등록</button>
					</div>
				</form>
	
							
			<!-- 댓글 목록 -->
			<div id="getReplyList"></div>

			<!-- 댓글수정폼시작 -->
			<div id="updateReply" style="display: none">
				<form action="" name="updateForm" id="updateForm">
					<input type="hidden" name="boardId" value="${board.boardId}">
					<input type="hidden" name="replyId">
					내용:
					<textarea name="repContents" cols="20" rows="2"></textarea>
					<br /> <input type="button" value="등록" id="btnUpd" /> <input
						type="button" value="취소" id="btnCancel" />
				</form>
			</div>
			<!-- 댓글수정폼끝 -->
			</div>


		</div>
	</div>

</body>
</html>