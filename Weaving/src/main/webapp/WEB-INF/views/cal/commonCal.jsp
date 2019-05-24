<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.24.0/moment.min.js"></script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
</head>

<body>
	<div>
		<div id='calendar'></div>
		<button class="btn btn-default" data-toggle="modal" data-target="#calModal"> 일정등록 </button>
		
		<!-- Modal 시작 -->
		<div>
			<div id="calModal" class="modal" tabindex="-1" role="dialog">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">일정 등록</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="title">일정 제목</label>
								<input type="text" class="form-control" id="title" name="title" placeholder="일정 제목을 입력해주세요">
							</div>
							<br>
							<div class="form-row">
								<div class="col">
									<label for="start">시작</label>
   									<input type="datetime-local" class="form-control" id="start" name="start">
								</div>
								<br>
								<div class="col">
									<label for="end">종료</label>
   									<input class="form-control" type="datetime-local" id="end" name="end">
								</div>
							</div>
							<br>
							<div class="form-check">
							      <label class="form-check-label">
							          <input class="form-check-input" type="checkbox" id="allDay"  name="allDay" value="true"> 종일
							          <span class="form-check-sign">
							              <span class="check"></span>
							          </span>
							      </label>
							</div>
							<br>
							<div class="form-group">
								<label for="title">일정 설명</label>
								<textarea class="form-control" id="description" name="description" rows="5" placeholder="일정 설명을 입력해주세요"></textarea>
							</div>
							<br>
							<div class="form-group">
								<label for="backgroundColor">색상</label>
  								<input type="color" name="backgroundColor" value="#3788d8">
							</div>
							<br>
						</div>
						<div class="modal-footer">
							<button id="btnAdd" type="button" class="btn btn-primary" onclick="insertCal()">저장</button>
							<button id="btnUpdate" type="button" class="btn btn-primary" onclick="updateCal()">수정</button>
							<button id="btnDelete" type="button" class="btn btn-primary" onclick="deleteCal()">삭제</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal 종료 -->
		
	</div>
	<script>
	
		// 달력에서 날짜를 눌렀을 때 날짜값
		var selectedDate = null;
		
		$(function() {
			
			console.log('calData: ' + '${cal.calType}');
		
			// 화면 로드 시 캘린더 목록 조회
			calList();
			
			// modal창이 닫히면 값 초기화
			$('#calModal').on('hidden.bs.modal', function (e) {
				
				$('[name="title"]').val('');
				$('[name="start"]').val('');
				$('[name="end"]').val('');
				$('[name="allDay"]').val(false);
				$('[name="backgroundColor"]').val('#3788d8');
				$('[name="description"]').val('');
			})
		});
		
		// 캘린더 목록 조회
		function calList() {
			$.ajax({
				url : './calData',
				type : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				success : calRender,
				error : function() {
					console.log('error');
				}
			});
		}
		
		// 캘린더 화면에 출력
		function calRender(data) {
			
			var calendarEl = document.getElementById('calendar');

			var calendar = new FullCalendar.Calendar(calendarEl, {
				plugins : [ 'interaction', 'dayGrid', 'timeGrid', 'list' ], // 적용할 plugin
				header : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
				},
				buttonText : {
					today : '오늘',
					month : '월별',
					week : '주간',
					day : '오늘 일정',
					list : '목록'
				},
				defaultDate : moment().format('YYYY-MM-DD' + 'T' + 'HH:00:00'), // 현재 날짜
				navLinks : true,
				selectable : true,
				selectMirror : true,
				eventClick: function(info){ 
					calDetail(info);
				},
				dateClick: function(info) {
					// 새로운 일정 등록
					$('.modal-title').html('일정 등록');
					
					// 달력에 클릭한 날짜로 지정
					var date = moment(info.date).format('YYYY-MM-DD' + 'T' + 'HH:00:00');
					$('#start').val(date);
					$('#end').val(date);
					
					// 오늘 날짜 하려면
					// var today = moment().format('YYYY-MM-DD' + 'T' + 'HH:00:00');
					
					$("#calModal").modal();
				},
				editable : true,
				eventLimit : true, // allow "more" link when too many events
				events : data
			});
			calendar.render();
		}
		
		// 상세 일정 보기
		function calDetail(eventInfo) {

			if(eventInfo != null) {
				$('.modal-title').html('일정 상세 내용');
				$('[name="title"]').val(eventInfo.event.title);
				$('[name="start"]').val(eventInfo.event.start);
				$('[name="end"]').val(eventInfo.event.end);
				$('[name="allDay"]').val(eventInfo.event.allDay);
				$('[name="backgroundColor"]').val(eventInfo.event.backgroundColor);
				$('[name="description"]').val(eventInfo.event.extendedProps.description);
				
				$("#calModal").modal();
			}
		}
		
		// 일정 등록
		function insertCal() {
			
			var title = $('[name="title"]').val();
			var start = $('[name="start"]').val();
			var end = $('[name="end"]').val();
			var allDay = $('[name="allDay"]:checked').val();
			if(allDay == 'true') {
				allDay = true;
			}
			var backgroundColor = $('[name="backgroundColor"]').val();
			var description = $('[name="description"]').val();
			
			$.ajax({
				url : './calData',
				type : 'POST',
				dataType : 'json',
				data: JSON.stringify({title: title, start: start, end: end, allDay: allDay, backgroundColor: backgroundColor, description: description}),
				contentType : 'application/json',
				success: function(result) {
					
					console.log('add cal successed : ' + result);
					calendar.addEvent({
			    		id: result.id,
			            title: result.title,
			            start: result.start,
			            end: result.end,
			            allDay: result.allDay,
			            backgroundColor: result.backgroundColor,
			            extendedProps : {
			            	'description' : result.description,
			            	'empNo' : result.empNo
			            }
			        });
			    	
			    	$("#calModal").modal("hide");
			    	
			    },
			    error:function(xhr, status, message) { 
			        alert('일정 등록에 실패 했습니다. (message: ' + message + ')');
			    } 
			});
		}
		
		function updateCal() {
			
			var title = $('[name="title"]').val();
			var start = $('[name="start"]').val();
			var end = $('[name="end"]').val();
			var allDay = $('[name="allDay"]:checked').val();
			if(allDay == 'true') {
				allDay = true;
			}
			var backgroundColor = $('[name="backgroundColor"]').val();
			var description = $('[name="description"]').val();
			
			$.ajax({
				url : './calData',
				type : 'PUT',
				dataType : 'json',
				data: JSON.stringify({title: title, start: start, end: end, allDay: allDay, backgroundColor: backgroundColor, description: description}),
				contentType : 'application/json',
				success: function(result) {
			    	console.log(result);
			    	
			    	var event = calendar.getEventById(result.id);
			    	event.title = result.title;
			        event.start = result.start;
			        event.end = result.end;
			        event.allDay = result.allDay;
			        event.backgroundColor = result.backgroundColor;
			        event.setExtendedProp('description', result.description);
			    	
			    	$("#calModal").modal("hide");
			    },
			    error:function(xhr, status, message) { 
			        alert('일정 등록에 실패 했습니다. (message: ' + message + ')');
			    } 
			});
		}
		
		
	</script>
</body>