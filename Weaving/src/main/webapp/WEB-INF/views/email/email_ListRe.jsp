<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.11.4/full/ckeditor.js"></script>

<script type="text/javascript">

</script>


<body>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<div class="card">
					<div class="card-header card-header-text card-header-primary">
						<div class="card-text">
							<h4 class="card-title">보낸 메일
								</h4>
						</div>
					</div>
						<%-- <form name="searchForm">
						<div style="float:right;">
						<select name="searchCondition">
							<option value="">선택
							<option value="TITLE">제목
							<option value="BOARD_CONTENTS" onclick="">내용
							<option value="EMP_NAME"> 작성자
						</select>
							<script>
							searchForm.searchCondition.value = '${boardVO.searchCondition}';
						</script>
						<input name="searchKeyword" value="${boardVO.searchKeyword}" />
						<button type="submit" class="btn btn-primary btn-sm">검색</button>
					</div> 
					</form>--%>
						
					<div class="card-body">
						<div class="table-responsive">
						<table class="table">
								<thead class=" text-primary">
									<tr>
										<th>번호</th>			
										<th>작성자</th>
										<th>제목</th>
										<th>날짜</th>
									</tr>
								</thead>
								<tbody>
					<c:forEach var="ListRe" items="${emailListRe}">
							<tr>
								<td>${ListRe.emailId}</td>
								<td>${ListRe.fromEmail}</td>
								<td><a  href="${pageContext.request.contextPath}/reading_mailRe/${ListRe.emailId}">${ListRe.subject}</a></td>
								<td>${ListRe.checkTime}</td>
								</tr>
				</c:forEach>
							</tbody>
		</table>
	</div>
</div>
</div>
</div>
</div>
</div>



</body>
</html>