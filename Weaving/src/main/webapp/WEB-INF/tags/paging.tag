<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.weaving.biz.common.Paging"%>
<%@ attribute name="jsFunc" required="false" type="java.lang.String"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty jsFunc}">
	<c:set var="jsFunc" value="go_page"></c:set>
</c:if>
<div class="container">
	<ul class="pagination">
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
				<c:if test="${i != paging.page}">
					<li><a href="${go_page}?page=${i}">${i}</a>
				</c:if>
				<c:if test="${i == paging.page}">
					<li class="active"><a href="${go_page}?page=${i}">${i}</a>
				</c:if>
		</c:forEach>
	</ul>
</div>