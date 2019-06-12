<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>

//페이징 기능(처음/끝 값을 보내준다.)
function goList(p){
	form2.page.value = p;
	form2.submit();
}

</script>

<body>
<!-- 페이징 값 보내는 폼(form2) -->
<form action="boardList" name="form2">
	<input type="hidden" name="page" value="1"></input>
</form>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header card-header-text card-header-primary">
						<div class="card-text">
							<h4 class="card-title">
							<c:if test="${boardType == '0'}">
								공지사항
							</c:if>
							<c:if test="${boardType == '1'}">
								게시판
							</c:if>
							</h4>
						</div>
					</div>
						<!-- 게시판 검색 창 -->
						<form name="searchForm">
							<div style="float:right; margin-right: 20px;">
							<select name="searchCondition">
								<option value="">선택
								<option value="TITLE">제목
								<option value="BOARD_CONTENTS">내용
								<option value="EMP_NAME"> 작성자
							</select>
							<script>
								searchForm.searchCondition.value = '${boardVO.searchCondition}';
							</script>
							<input name="searchKeyword" value="${boardVO.searchKeyword}" />
							<button type="submit" class="btn btn-primary btn-sm">검색</button>
						</div>
						</form>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<thead class=" text-primary">
									<tr>
										<th>No</th>
										<th>작성자</th>
										<th>제목</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${boardList}" var="board">
										<tr>
											<td>${board.rowNum}</td>
											<td>${board.empName}</td>
											<td><a
												href="${pageContext.request.contextPath}/boardOne/${board.boardId}">${board.title}
												<!-- 댓글 갯수 출력 -->
												<c:if test="${board.recnt > 0 }">
												<span style="color: green;">(${board.recnt})</span>
												</c:if>
											</a></td>
											<td>${board.time}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						<div style="text-align:center">
							<my:paging paging="${paging}" jsFunc="goList" />
						</div>
						<div style="float:right;">
						<button type="button" class="btn btn-primary btn-sm"
							onclick="location.href='boardList?boardType=${boardType}'">목록</button>
						<c:if test="${boardType == '0' && emp.adminYn}">
						<button type="button" class="btn btn-primary btn-sm"
							onclick="location.href='boardInsertForm'">글쓰기</button>
						</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>