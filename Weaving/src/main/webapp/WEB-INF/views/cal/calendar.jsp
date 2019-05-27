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
		<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#calModal"> 일정등록 </button>
		
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
								<input type="hidden" id="calId" name="calId">
								<input type="text" class="form-control" id="title" name="title" placeholder="일정 제목을 입력해주세요" autofocus>
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
							          <input class="form-check-input" type="checkbox" id="allDay" name="allDay" value="true"> 종일
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
  								<input type="color" id="backgroundColor" name="backgroundColor" value="#da92e7">
							</div>
							<br>
						</div>
						<div class="modal-footer">
							<button id="btnAdd" type="button" class="btn btn-primary btn-sm" onclick="insertCal()">등록</button>
							<button id="btnUpdate" type="button" class="btn btn-primary btn-sm" onclick="updateCal()">수정</button>
							<button id="btnDelete" type="button" class="btn btn-default btn-sm" onclick="deleteCal()">삭제</button>
							<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
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
		var calendar;
		
		$(function() {
			
			console.log('calData: ' + '${cal.calType}');
		
			// 화면 로드 시 캘린더 목록 조회
			calList();
			
			// modal창이 닫히면 값 초기화
			$('#calModal').on('hidden.bs.modal', function (e) {
				$('#calId').val('');
				$('#title').val('');
				$('#start').val('');
				$('#end').val('');
				$('#allDay').prop("checked", false);
				$('#backgroundColor').val('#da92e7');
				$('#description').val('');
			})
			
		});
		
		// 추가/수정에 따라 버튼 보이기 처리
		function showButtons(isAdd) {
			isAdd == true ? $('#btnAdd').show() : $('#btnAdd').hide();
			isAdd == true ? $('#btnUpdate').hide() : $('#btnUpdate').show();
			isAdd == true ? $('#btnDelete').hide() : $('#btnDelete').show() ;
		}
		
		// 캘린더 목록 조회
		function calList() {
			$.ajax({
				url : './calendar',
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
			
			console.log(data);
			
			var calendarEl = document.getElementById('calendar');

			calendar = new FullCalendar.Calendar(calendarEl, {
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
				editable : true,
				eventLimit : true, // allow "more" link when too many events
				eventClick: function(info){
					showCalDetail(info);
				},
				dateClick: function(info) {
					showCalAdd(info);
				},
				droppable: true,
				eventDrop: function(dropInfo) {
			    	if(dropInfo != null) {
			    		alert(dropInfo.event.title + " was dropped on " + dropInfo.event.start.toISOString() + " " + dropInfo.event.start);
			    		updateCal(dropInfo);
			    	}
			    },
				events : data
			});
			calendar.render();
		}
		
		// 일정 추가 화면 보기
		function showCalAdd(eventInfo) {
			
			$('.modal-title').html('일정 등록');
			
			// 추가 삭제 버튼 처리
			showButtons(true);
			
			// 달력에 클릭한 날짜로 지정
			var date = moment(eventInfo.date).format('YYYY-MM-DD' + 'T' + '00:00');
			$('#start').val(date);
			$('#end').val(date);
			
			$("#calModal").modal();
		}
		
		
		// 상세 일정 보기
		function showCalDetail(eventInfo) {

			if(eventInfo != null) {
				
				// 추가 삭제 버튼 처리
				showButtons(false);
				
				$('#calId').val(eventInfo.event.id);
				$('#title').val(eventInfo.event.title);
				$('#start').val(moment(eventInfo.event.start).format('YYYY-MM-DD' + 'T' + 'HH:00:00'));
				
				if(eventInfo.event.end == null) {
					$('#end').val(moment(eventInfo.event.start).format('YYYY-MM-DD' + 'T' + 'HH:00:00'));
				} else {
					$('#end').val(moment(eventInfo.event.end).format('YYYY-MM-DD' + 'T' + 'HH:00:00'));
				} 
				
				$('#allDay').prop("checked", eventInfo.event.allDay);

				$('#backgroundColor').val(eventInfo.event.backgroundColor);
				$('#description').val(eventInfo.event.extendedProps.description);
				
				$("#calModal").modal();
			}
		}
		
		// 일정 등록
		function insertCal() {
			
			// 입력값 체크
			if($('#title').val() == null || $('#title').val() == '') {
				alert('일정 제목을 등록해주세요');
				$('#title').focus();
				return;
			}
			
			var newData = JSON.stringify({title: $('#title').val(),
									   	  start: $('#start').val(),
									      end: $('#end').val(),
//									      end: $('#allDay:checked').val() == 'true' ? moment($('#end').val()).add(1, 'day') : $('#end').val(),
									      allDay: $('#allDay:checked').val() == 'true' ? true : false,
									      backgroundColor: $('#backgroundColor').val(),
									      description: $('#description').val()
									    });
			
			$.ajax({
				url : './calendar',
				type : 'POST',
				dataType : 'json',
				data: newData,
				contentType : 'application/json',
				success: function(result) {
					
					console.log('add cal successed');
					
					for(var key in result) {
						console.log(key + ": "  + result[key]);
					}					
					
					var event = {
				    		id: result.id,
				            title: result.title,
				            start: moment(result.start).format('YYYY-MM-DD' + 'T' + 'HH:00:00'),
				            end: moment(result.end).format('YYYY-MM-DD' + 'T' + 'HH:00:00'),
				            allDay: result.allDay,
				            backgroundColor: result.backgroundColor,
				            extendedProps : {
				            	'description' : result.description,
				            	'empNo' : result.empNo
				            }
				     };
					
					calendar.addEvent(event);
			    	
			    	$("#calModal").modal("hide");
			    },
			    error:function(xhr, status, message) { 
			        alert('일정 등록에 실패 했습니다. (message: ' + message + ')');
			    } 
			});
		}
		
		function updateCal(dropInfo) {
			
			var calData;
			
			if(dropInfo != null) {
				calData = JSON.stringify({  
					id: dropInfo.event.id, 
					title: dropInfo.event.title, 
					start: moment(dropInfo.event.start).format('YYYY-MM-DD' + 'T' + 'HH:00:00'), 
					end: dropInfo.event.end == null ? moment(dropInfo.event.start).format('YYYY-MM-DD' + 'T' + 'HH:00:00') : moment(dropInfo.event.end).format('YYYY-MM-DD' + 'T' + 'HH:00:00'), 
					allDay: dropInfo.event.allDay, 
					backgroundColor: dropInfo.event.backgroundColor, 
					description: dropInfo.event.extendedProps.description 
				    });
			} else {
				calData = JSON.stringify({
					id: $('#calId').val(),
					title: $('#title').val(),
					start: $('#start').val(),
					end: $('#end').val(),
					allDay: $('#allDay:checked').val() == 'true' ? true : false,
					backgroundColor: $('#backgroundColor').val(),
					description: $('#description').val()
				});
			}
			
			$.ajax({
				url : './calendar',
				type : 'PUT',
				dataType : 'json',
				data: calData,
				contentType : 'application/json',
				success: function(result) {
					
					var event = {
				    		id: result.id,
				            title: result.title,
				            start: moment(result.start).format('YYYY-MM-DD' + 'T' + 'HH:00:00'),
				            end: moment(result.end).format('YYYY-MM-DD' + 'T' + 'HH:00:00'),
				            allDay: result.allDay,
				            backgroundColor: result.backgroundColor,
				            extendedProps : {
				            	'description' : result.description,
				            	'empNo' : result.empNo
				            }
				     };
					
					var oldEvent = calendar.getEventById(result.id);
					oldEvent.remove();
					calendar.addEvent(event);

			    	$("#calModal").modal("hide");
			    },
			    error:function(xhr, status, message) {
			        alert('일정 수정에 실패 했습니다. (message: ' + message + ')');
			    } 
			});
			 
			
		}
		
		function deleteCal() {
			
			var id = $('#calId').val();
			
			$.ajax({
				url : './calendar',
				type : 'DELETE',
				dataType : 'json',
				data: JSON.stringify({id: id}),
				contentType : 'application/json',
				success: function(result) {
			    	var event = calendar.getEventById(id);
					// 이벤트 삭제
			    	event.remove();
			    	$("#calModal").modal("hide");
			    },
			    error:function(xhr, status, message) { 
			        alert('일정 삭제에 실패 했습니다. (message: ' + message + ')');
			    } 
			});
		}
		
	</script>
</body>