<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
</head>
<style>
#calendar {
	max-width: 500px;
	margin: 0 auto;
	
	.card-title{ font-family: impact}
}
</style>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/moment@2.24.0/moment.min.js"></script>
	<script>
		// 캘린더 화면에 출력

		$(function() {
			calList();
			//weather();
		})
		
		function weather() {
			$.ajax({	
				headers: {"X-My-Custom-Header": "some value"},
				url :"http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?serviceKey=xqHzr37we%2FaF0H%2BNu%2BJLEylN189HdNBwgfQqsZuUQ5F3eSiowxzg7eBr43jBK19B4kuBKcjeRyxKhWsup7C2WA%3D%3D&base_date=20190605&base_time=0500&nx=60&ny=127&numOfRows=10&pageNo=1&_type=json", 
				data : {serviceKey:"xqHzr37we%2FaF0H%2BNu%2BJLEylN189HdNBwgfQqsZuUQ5F3eSiowxzg7eBr43jBK19B4kuBKcjeRyxKhWsup7C2WA%3D%3D",
						base_date:"20190605", baseTime:"0500", nx:"60", ny:"127", _type:"json"},
				dataType : 'json',
				contentType : 'application/json;charset=utf-8',
				success : function(data){
					console.log(data);
										
				},
				error : function(){
					alert('날씨정보 로드에 실패했습니다.')
				}
			})			
		}
		
		//캘린더 목록 조회
		function calList() {
			$.ajax({
				url : '${pageContext.request.contextPath}/calendar',
				type : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				success : calRender,
				error : function() {
					alert('일정을 불러오는 데 실패했습니다. 관리자에게 문의해주세요.');
				}
			});
		}

		function calRender(data) {

			var calendarEl = document.getElementById('calendar');
			var myPlugins;

			calendar = new FullCalendar.Calendar(calendarEl, {
				plugins : [ 'dayGrid' ], // 적용할 plugin
				header : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
				},
				defaultDate : moment().format('YYYY-MM-DD' + 'T' + 'HH:00:00'), // 현재 날짜
				navLinks : true,
				selectable : true,
				selectMirror : true,
				editable : true,
				eventLimit : true, // allow "more" link when too many events
				events : data
			});

			calendar.render();
		}
		
		function addItem() {
			
			if($('#todo_input').val() == '' ) {
				return;
			}
			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/todoInsert",
				data : "content=" + $('#todo_input').val(),
				success : function() {
					var check_item = '<div class="form-check">';
					check_item += '<label class="form-check-label">';
					check_item += '<input id="item_check_2" class="form-check-input" type="checkbox">';
					check_item += '<span class="form-check-sign"> <span class="check"></span>';
					check_item += '</span>';
					check_item += '</label>';
					check_item += '</div>';
					
					
					$('#todoList').append(
							$('<tr>').attr('id', 'item_2').append(
								$('<td>').html(check_item),
								$('<td>').attr('id', 'item_content_2').append($('#todo_input').val()),
								$('<td>').addClass('td-actions text-right').append(
									$('<button>').addClass('btn btn-danger btn-link btn-sm').append(
										$('<i>').addClass('material-icons').append('close')		
									)
								)
							)
					);
					
					// reset
					$('#todo_input').val('');
				}
			});
			
		}
	</script>

	<div class="container-fluid">
		<!-- 상단1 -->
		<div class="row">
			<div class="col-md-3"
				OnClick="location.href ='docList?listType=WAIT'"
				style="cursor: pointer;">
				<div class="card">
					<div class="card-header card-header-icon card-header-warning">
						<div class="card-icon">
							<i class="material-icons">flag</i>
						</div>
					</div>
					<div class="card-body">
						<h6 class="card-title">
							사용자님의 결재 대기중인 <br> 문서는 ${count}건 입니다.
						</h6>

					</div>
				</div>
			</div>

			<!-- 상단2 -->

			<div class="col-md-3"
				OnClick="location.href ='docList?listType=RETURN'"
				style="cursor: pointer;">
				<div class="card">
					<div class="card-header card-header-icon card-header-success">
						<div class="card-icon">
							<i class="material-icons">undo</i>
						</div>
					</div>
					<div class="card-body">
						<h6 class="card-title">
							사용자님의 반려된 문서는 <br> ${returndoc}건 입니다.
						</h6>

					</div>
				</div>
			</div>


			<div class="col-md-3" OnClick="location.href ='email_List'"
				style="cursor: pointer;">
				<div class="card">
					<div class="card-header card-header-icon card-header-danger">
						<div class="card-icon">
							<i class="material-icons">mail_outline </i>
						</div>
					</div>
					<div class="card-body">
						<h6 class="card-title">
							사용자님이 아직 읽지 않은 메일은 <br> ${countMail}건 입니다.
						</h6>

					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card">
					<div class="card-header card-header-icon card-header-info">
						<div class="card-icon">
							<i class="material-icons">calendar_today</i>
						</div>
					</div>
					<div class="card-body">
						<h6 class="card-title">D-16</h6>
					</div>
				</div>
			</div>

		</div>

		<div class="row">

			<div class="col-md-6">
				<div class="card">
					<div class="card-header card-header-text card-header-primary">
						<div class="card-text">
							<h4 class="card-title">Notice</h4>
						</div>
					</div>
					<div class="card-body">
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
										<td>${board.boardId}</td>
										<td>${board.empName}</td>
										<td><a
											href="${pageContext.request.contextPath}/boardOne/${board.boardId}">${board.title}</a></td>
										<td>${board.time}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-header card-header-text card-header-warning">
						<div class="card-text">
							<h4 class="card-title">Board</h4>
						</div>
					</div>
					<div class="card-body">
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
								<c:forEach items="${boardList1}" var="board">
									<tr>
										<td>${board.boardId}</td>
										<td>${board.empName}</td>
										<td><a
											href="${pageContext.request.contextPath}/boardOne/${board.boardId}">${board.title}</a></td>
										<td>${board.time}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="row">

			<!-- todo list -->
			<div class="col-md-6">
				<div class="card">
					<div class="card-header card-header-text card-header-danger">
						<div class="card-text">
							<h4 class="card-title">TO-DO LIST</h4>
						</div>
					</div>

					<div class="card-body">
						<div>
							<div class="input-group">
								<input id="todo_input" type="text"
									class="form-control inputFileVisible" placeholder="오늘 할 일..">
								<span class="input-group-btn">
									<button type="button" class="btn btn-default btn-sm"
										onclick="addItem()">추가</button>
								</span>
							</div>
						</div>

						<table class="table" id="todoList">
							<tbody>
								<c:forEach items="${todolist}" var="todo">
								<tr id="item_1">
									<!-- TODO 리스트 목록 반복 영역 -->
									<td>
										<div class="form-check">
											<label class="form-check-label"> <input
												id="item_check_1" class="form-check-input" type="checkbox"
												value="" checked> <span class="form-check-sign">
													<span class="check"></span>
											</span>
											</label>
										</div>
									</td>

									<td id="item_content_1">${todo.content}</td>

									<td class="td-actions text-right">
										<button type="button" class="btn btn-danger btn-link btn-sm" 
											onclick="location='${pageContext.request.contextPath}/todoDelete?todoId=${todo.todoId}'">
											<i class="material-icons">close</i>
										</button>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div>

			<!-- 전체 일정 -->
			<div class="col-md-6">
				<div class="card">
					<div class="card-header card-header-text card-header-success">
						<div class="card-text">
							<h4 class="card-title">Schedule</h4>
						</div>
					</div>
					<div class="card-body">
						<div id="calendar"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
