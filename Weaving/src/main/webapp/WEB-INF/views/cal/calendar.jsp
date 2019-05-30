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
							      <br>
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

	<!-- 전체 일정에서 관리자인지 유무  -->
	<c:set var="isNoAdmin" value="${calType == 'ALL' && emp.adminYn == false}" />

	<script>
	
		var calendar;
		var dateTimeFormat = 'YYYY-MM-DD' + 'T' + 'HH:00:00';	// 시간 포함 포맷
		var dateFormat = 'YYYY-MM-DD';							// 날짜 포맷
		
		$(function() {
			
			// 화면 로드 시 캘린더 목록 조회
			calList();
			
			console.log('isNoAdmin? ' + ${isNoAdmin});
			
			// 전체 일정에 일반 사용자 접속 시 처리
			if(${isNoAdmin}) {
				
				$('#calModal input').attr('readonly', 'readonly');
				$('#calModal input:checkbox').attr('disabled', 'disabled');
				$('#calModal textarea').attr('readonly', 'readonly');
			}
			
			// modal창이 닫히면 값 초기화
			$('#calModal').on('hidden.bs.modal', function (e) {
				$('#calId').val('');
				$('#title').val('');
				$('#start').val('');
				$('#end').val('');
				$('#allDay').prop("checked", false);
				$('#backgroundColor').val('#da92e7');
				$('#description').val('');
				
				$('#start').prop('type', 'datetime-local');
	        	$('#end').prop('type', 'datetime-local');
			});
			
			// modal창이 열리면 처리
			$('#calModal').on('shown.bs.modal', function (e) {
				$('#title').focus();
			});
			
			// allDay 체크 이벤트 변경 시 포맷 변경 처리
			$("#allDay").change(function(){
				
		        if($("#allDay").is(":checked")){
		        	
		        	var start = $('#start').val();
		        	var end = $('#end').val();
		        	
		        	$('#start').prop('type', 'date');
		        	$('#end').prop('type', 'date');
		        	
		        	$('#start').val(moment(start).format(dateFormat));
		        	$('#end').val(moment(end).format(dateFormat));
		        	
		        } else {
		        	
		        	var start = $('#start').val();
		        	var end = $('#end').val();
		        	
		        	$('#start').prop('type', 'datetime-local');
		        	$('#end').prop('type', 'datetime-local');
		        	
		        	$('#start').val(moment(start).format(dateTimeFormat));
		        	$('#end').val(moment(end).format(dateTimeFormat));
		        }
		    });
			
		});
		
		// 추가/수정에 따라 버튼 보이기 처리
		function showButtons(isAdd) {
			
			// adminMode가 아니면 해당 버튼을 가린다
			if(${isNoAdmin}) {
				$('#btnAdd').hide();
				$('#btnUpdate').hide();
				$('#btnDelete').hide();
			} else {
				isAdd == true ? $('#btnAdd').show() : $('#btnAdd').hide();
				isAdd == true ? $('#btnUpdate').hide() : $('#btnUpdate').show();
				isAdd == true ? $('#btnDelete').hide() : $('#btnDelete').show() ;
			}
		}
		
		// 상세 화면의 데이터 객체 가져옴
		function getCalDataFromUI() {
		  	var calData = { id: $('#calId').val(),
		  					title : $('#title').val(),
					   	  	start :  $('#start').val(),
					      	end :  $('#end').val(),
					      	allDay :  $('#allDay:checked').val() == 'true' ? true : false,
					      	backgroundColor: $('#backgroundColor').val(),
					      	description: $('#description').val()
					      };
		  	return calData;
		}
		
		// 캘린더 목록 조회
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
		
		// 캘린더 화면에 출력
		function calRender(data) {
			
			var calendarEl = document.getElementById('calendar');
			var myPlugins;
			
			if(${isNoAdmin}) {
				myPlugins = [ 'dayGrid', 'timeGrid', 'list' ];
			} else {
				myPlugins = [ 'interaction', 'dayGrid', 'timeGrid', 'list' ];
			}
			
			calendar = new FullCalendar.Calendar(calendarEl, {
				plugins : myPlugins, //[ 'interaction', 'dayGrid', 'timeGrid', 'list' ], // 적용할 plugin
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
				defaultDate : moment().format(dateTimeFormat), // 현재 날짜
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
			var date = moment(eventInfo.date).format(dateTimeFormat);
			$('#start').val(date);
			$('#end').val(date);
			
			$("#calModal").modal();
		}
		
		// 상세 일정 보기
		function showCalDetail(eventInfo) {

			if(eventInfo != null) {
				
				$('.modal-title').html('일정 정보');
				
				// 추가 삭제 버튼 처리
				showButtons(false);
				
				$('#calId').val(eventInfo.event.id);
				$('#title').val(eventInfo.event.title);
				
				$('#allDay').prop("checked", eventInfo.event.allDay);
				$('#backgroundColor').val(eventInfo.event.backgroundColor);
				$('#description').val(eventInfo.event.extendedProps.description);
				
				// 하루 종일 일정 일 때, 날짜 포맷을 변경 해준다
				if(eventInfo.event.allDay) {
					$('#start').prop('type', 'date');
		        	$('#end').prop('type', 'date');
		        	
		        	$('#start').val(moment(eventInfo.event.start).format(dateFormat));
				} else {
					$('#start').val(moment(eventInfo.event.start).format(dateTimeFormat));
				}
				
				// event의 end가  null일 경우 처리
				if(eventInfo.event.end == null) {
					$('#end').val($('#start').val());
				} else {
					if(eventInfo.event.allDay) {
						$('#end').val(moment(eventInfo.event.end).add(-1, 'day').format(dateFormat));
					} else {
						$('#end').val(moment(eventInfo.event.end).format(dateTimeFormat));
					}
				} 
				
				$("#calModal").modal();
			}
		}
		
		// 일정 등록
		function insertCal() {
			
			var calData = getCalDataFromUI();
			
			// validation - 제목
			if(calData.title == null || calData.title == '') {
				alert('일정 제목을 등록해주세요');
				$('#title').focus();
				return;
			}
			// validation - 날짜
			if(moment(calData.end, dateTimeFormat).diff(moment(calData.start, dateTimeFormat)) < 0) {
				alert('시작날짜는가 종료날짜보다 이후입니다. 다시 선택해 주세요.');
				$('#start').focus();
				return;
			}
			
			if(calData.allDay) {
				calData.end = moment(calData.end).add(1, 'day').format(dateTimeFormat);
			}
			
			$.ajax({
				url : '${pageContext.request.contextPath}/calendar',
				type : 'POST',
				dataType : 'json',
			 	data : JSON.stringify(calData),
				contentType : 'application/json',
				success: function(result) {
					
					console.log('insertCal() : success');
					for(var key in result) {
						console.log(key + ': '  + result[key]);
					}					
					
					// 캘린더에 이벤트 등록
					calendar.addEvent({ id: result.id,
							            title: result.title,
							            start: moment(result.start).format(dateTimeFormat),
							            end: moment(result.end).format(dateTimeFormat),
							            allDay: result.allDay,
							            backgroundColor: result.backgroundColor,
							            extendedProps : {
							            	'description' : result.description,
							            }
									});
			    	
			    	$("#calModal").modal("hide");
			    },
			    error:function(xhr, status, message) { 
			        alert('일정 등록에 실패 했습니다. (message: ' + message + ')');
			    } 
			});
		}
		
		// 일정 수정
		function updateCal(dropInfo) {
			
			var calData;
			
			if(dropInfo != null) {
				calData = {	id: dropInfo.event.id, 
							title: dropInfo.event.title, 
							start: moment(dropInfo.event.start).format(dateTimeFormat), 
							end: dropInfo.event.end == null ? moment(dropInfo.event.start).format(dateTimeFormat) : moment(dropInfo.event.end).format(dateTimeFormat), 
							allDay: dropInfo.event.allDay, 
							backgroundColor: dropInfo.event.backgroundColor, 
							description: dropInfo.event.extendedProps.description 
						  };
			} else {
				calData = getCalDataFromUI();
				if(calData.allDay) {
					calData.end = moment(calData.end).add(1, 'day').format(dateTimeFormat);
				}
			}
			
			$.ajax({
				url : '${pageContext.request.contextPath}/calendar',
				type : 'PUT',
				dataType : 'json',
				data: JSON.stringify(calData),
				contentType : 'application/json',
				success: function(result) {
					
					// 이전 이벤트 제거하고
					var oldEvent = calendar.getEventById(result.id);
					oldEvent.remove();

					// 캘린더에 이벤트 등록
					calendar.addEvent({ id: result.id,
							            title: result.title,
							            start: moment(result.start).format(dateTimeFormat),
							            end: moment(result.end).format(dateTimeFormat),
							            allDay: result.allDay,
							            backgroundColor: result.backgroundColor,
							            extendedProps : {
							            	'description' : result.description,
							            }
									});

			    	$("#calModal").modal("hide");
			    },
			    error:function(xhr, status, message) {
			        alert('일정 수정에 실패 했습니다. (message: ' + message + ')');
			    } 
			});
			 
			
		}
		
		// 일정 삭제
		function deleteCal() {
			
			var id = $('#calId').val();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/calendar',
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