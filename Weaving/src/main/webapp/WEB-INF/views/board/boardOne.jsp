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

</head>

<body>

	<script>
		
	$(function(){
		
		//목록 불러오기
		getReplyList(); //json 리턴방식
		
		//댓글 쓰기 버튼 클릭 이벤트
		$("#btnReply").click(function(){
			var repContents=$("#repContents").val();
			var boardId="${board.boardId}"
			var param="repContents="+repContents+"&boardId="+boardId;
			console.log(param);
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/reply/insert.do",
				data: param,
				success: function(){
					alert("댓글이 등록되었습니다.");
					getReplyList();
				}
			});
		});

		//댓글 목록(json)
		function getReplyList(){
			
			console.log('getReplyList');
			var boardId = $('#boardId').val();
			
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath}/reply/listJson.do?boardId="+ boardId,
				success: function(result){
					console.log(result);
					var output = "<table>";
					for(var i in result){
						var currentTime = new Date(parseInt(result[i].time));
						var month = currentTime.getMonth() + 1;
						var day = currentTime.getDate();
						var year = currentTime.getFullYear();
						var hour = currentTime.getHours();
						var minutes = currentTime.getMinutes();
						var date = year + "/" + month + "/" + day + "/" + hour + ":" + minutes;
						
						output += "<tr>";
						output += "<td>"+result[i].empName;
						output += "("+date+")<br>";
						output += result[i].repContents+"</td>";
						output += "<tr>";
					}
					output += "</table>";
					$("#getReplyList").html(output);
				}		
			});
		}
	});

</script>
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
					<input type='hidden' id="boardId" name="boardId" value="${board.boardId}">
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
					<br> <br> <br> <br> <br> <br> <br>
					<br>
					<div>
						<br>
						<textarea rows="5" cols="80" id="repContents"
							placeholder="Comment"></textarea>
						<br>
						<button type="button" class="btn btn-primary btn-sm" id="btnReply">댓글
							등록</button>
					</div>
					<!-- 댓글 목록 -->
					<div id="getReplyList">
						<table style="width: 700px">
							<c:forEach var="row" items="${list}">
								<tr>
									<td>${row.empName}(${row.time}) <br>
										${row.repContents}
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<br> <br> <br> <br>
					<div>
						<button type="button" class="btn btn-primary btn-sm"
							onclick="location.href='${pageContext.request.contextPath}/boardList?boardType=${boardType}'">목록</button>
						<c:if test="${board.empNo == emp.empNo}">
						<button type="button" class="btn btn-primary btn-sm"
							onclick="location.href='${pageContext.request.contextPath}/boardUpdate/${board.boardId}'">수정</button>
						<button type="button" class="btn btn-primary btn-sm"
							onclick="location='${pageContext.request.contextPath}/boardDelete?boardId=${board.boardId}'">삭제</button>
						</c:if>	
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>