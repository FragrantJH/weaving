<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="table-responsive">
		<table class="table table-shopping">
			<thead>
				<tr>
					<th class="text-center"></th>
					<th>회의실</th>
					<th class="th-description">위치</th>
					<th class="th-description">크기</th>
					<th class="th-description">수용인원</th>
					<th class="th-description">액션</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="RoomList" varStatus="s">
					<tr>
						<td>
							<div class="img-container">
								<img src="images/re${s.index+1}.jpg" alt="room1" width="100">
							</div>
						</td>
						<td>${RoomList.roomName}</td>
						<td>${RoomList.roomLoc}</td>
						<td>${RoomList.roomSize}</td>
						<td>${RoomList.roomMax}</td>
						<td class="td-actions">
							<button type="button" rel="tooltip" class="btn btn-info" onclick="location.href='roomReserv'">
								<i class="material-icons">person</i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>