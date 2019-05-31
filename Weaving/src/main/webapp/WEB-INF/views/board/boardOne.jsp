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

		//목록 불러오기
		getReplyList(); //json 리턴방식

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
							var $table = $("<table/>");
							var $row = $("<tr/>")
									.append($("<th/>").text("작성자")).append(
											$("<th/>").text("댓글 내용")).append(
											$("<th/>").text("시간")).append(
											$("<th/>").text("Delete"));
							$table.append($row);

							for (i in result) {
								// 수정버튼
								var $button = $("<button/>").html("수정");

								var currentTime = new Date(
										parseInt(result[i].time));
								var month = currentTime.getMonth() + 1;
								var day = currentTime.getDate();
								var year = currentTime.getFullYear();
								var hour = currentTime.getHours();
								var minutes = currentTime.getMinutes();
								var date = year + "/" + month + "/" + day + "/"
										+ hour + ":" + minutes;

								var $row = $(
										"<tr id=" + result[i].replyId + ">")
										.append(
												$("<td/>").text(
														result[i].empName),
												$("<td/>").text(
														result[i].repContents),
												$("<td/>").text(result[i].date),
												$("<td/>").html($button));

								$table.append($row);
							}

							$("#getReplyList").html($table);
						}
					});
		}

		// 댓글 수정화면 생성 함수
		function showReplyModify(replyId) {
			$.ajax({
				type : "get",
				url : "",
				success : function(result) {
					$("#modifyReply").html(result);
					// 태그.css("속성", "값")
					$("#modifyReply").css("visibility", "visible");
				}
			});
		}
	});

	// 댓글 수정
	$("#btnReplyUpdate")
			.click(
					function() {
						var detailRepContents = $("#detailRepContents").val();
						$
								.ajax({
									type : "put",
									url : "${pageContext.request.contextPath}/reply/update/${row.replyId}",
									data : param,
									success : function(result) {
										if (result == "success") {
											$("#modifyReply").css("visibility",
													"hidden");
											//댓글 목록 갱신
											listReplyRest("1");
										}
									}
								});
					});

	// 댓글 상세화면 닫기
	$("#btnReplyClose").click(function() {
		$("#modifyReply").css("visibility", "hidden");
	});

	// 댓글 삭제
	$("#btnReplyDelete")
			.click(
					function() {
						if (confirm("삭제하시겠습니까?")) {
							$
									.ajax({
										type : "delete",
										url : "${pageContext.request.contextPath}/reply/delete/${row.replyId}",
										success : function(result) {
											if (result == "success") {
												alert("삭제되었습니다.");
												$("#modifyReply").css(
														"visibility", "hidden");
											}
										}
									});
						}
					});
</script>
<style>
#modifyReply {
	width: 600px;
	height: 130pxl background-color: silver;
	padding: 10px;
	z-index: 10;
	visibility: hidden;
}
</style>
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
					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br> <br> <br>
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
				
				<!-- 댓글 목록 -->
				<div id="getReplyList">
					<table style="width: 700px">
						<c:forEach var="row" items="${list}">
							<tr>
								<td>${row.empName}(${row.time})${row.repContents}</td>
								<td>${row.replyId}${emp.empNo}<!-- 본인 댓글만 수정 버튼 생성되도록 처리 -->
									<c:if test="${row.empNo == emp.empNo}">
										<input type="button" id="btnModify" value="수정"
											onclick="showReplyModify('${row.replyId}')">
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<!-- 댓글 수정 화면 -->
				<div id="editReply" style="display: none">
					<textarea id="detailRepContents" rows="5" cols="82">
							<!-- 댓글 내용 들어가야 함 -->
						</textarea>

					<button type="button" id="btnReplyUpdate">수정</button>
					<button type="button" id="btnReplyDelete">삭제</button>
					<button type="button" id="btnReplyClose">닫기</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>