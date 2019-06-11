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
#weatherInfo {

    margin: auto;
}
.wsState img {
	width:100px;
}
/*
#weatherInfo th {
	height: 40px;
	width: 116px;
	vertical-align: middle;
	text-align: center;
}
*/
</style>
<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/moment@2.24.0/moment.min.js"></script>
	<script>
		// 캘린더 화면에 출력

		$(function() {
			calList();
			callWeatherInfo();

		});
		
		function callWeatherInfo() {
			$.ajax({	
				url :"http://api.openweathermap.org/data/2.5/weather?q=Daegu&appid=2b00ad1536b1cdeeb9975de20f3d350c", 
		         dataType: "json",
		         type: "GET",
		         async: "false",
		         success: function(data) {
		        	makeWeatherHtml(data);
					/*
					console.log(data);
		            console.log("현재온도 : "+ (data.main.temp - 273.15) );
		            console.log("현재습도 : "+ data.main.humidity);
		            console.log("날씨 : "+ data.weather[0].main );
		            console.log("상세날씨설명 : "+ data.weather[0].description );
		            console.log("날씨 이미지 : "+ data.weather[0].icon );
		            console.log("바람   : "+ data.wind.speed );
		            console.log("나라   : "+ data.sys.country );
		            console.log("도시이름  : "+ data.name );
		            console.log("구름  : "+ (data.clouds.all) +"%" ); 			
						*/				
				},
				error : function(){
					alert('날씨정보 로드에 실패했습니다.')
				}
			});
		}
		
		function makeWeatherHtml(data) {
			var img = $("<img src='http://openweathermap.org/img/w/"+data.weather[0].icon+".png'>");
			
			$('.wsState').html(img);
			$('.todaytemp').text((data.main.temp - 273.15).toFixed(0));
			var wsDesc = data.weather[0].description;
			var wsStr = "";
			switch(wsDesc) {
				case 'clear sky':
					wsStr = "맑음";
					break;
				case 'few clouds':
					wsStr = "구름조금";
					break;
				case 'scattered clouds':
					wsStr = "구름많음";
					break;
				case 'broken clouds':
					wsStr = "흐림";
					break;
				case 'shower rain':
					wsStr = "소나기";
					break;
				case 'rain':
					wsStr = "비";
					break;
				case 'thunderstorm':
					wsStr = "천둥번개";
					break;
				case 'snow':
					wsStr = "눈";
					break;
				case 'mist':
					wsStr = "안개";
					break;
				default:
					wsStr = wsDesc;
					alert("예외 날씨 상태가 발생되었습니다.");
					break;
			}
			$('.cast_txt').text(wsStr +", 현재습도 : " + data.main.humidity + "%");
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

<div>
	<div class="container-fluid">
	<h1 class="display-4" style="color: dark">WEAVING 그룹웨어</h1>
	
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
						<p class="h6 card-title">
							사용자님의 결재 대기중인 문서는 <br> 
							<small class="text-muted" style="font-size:x-large;">${count}</small>
							건 입니다.
						</p>

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
						<p class="h6 card-title">
							사용자님의 반려된 문서는 <br> 
							<small class="text-muted" style="font-size:x-large;">${returndoc}</small>
							건 입니다.
						</p>
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
						<p class="h6 card-title">사용자님이 아직 읽지 않은 메일은 <br>
						  <small class="text-muted" style="font-size:x-large;">${countMail}</small>
						  건 입니다.
						</p>
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
					<!-- 
						<h6 class="card-title">D-16</h6>
 					-->	
 					<!--
 					 						<div class="main_info" style="vertical-align: middle;">
							<span class="wsState"></span>
							<div class="info_data" style="display:inline-block;">
								<p class="info_temperature">
									<span class="todaytemp">0</span>
									<span class="tempmark"><span class="blind">도씨</span>℃</span>
								</p>
								<p class="cast_txt"></p>
							</div>
						</div>
 					 -->
	 					<div class="main_info">
	 						<table id="weatherInfo">
								<tr>
									<th rowspan="2" class="wsState"></th>
									<th>
										<span class="h2 todaytemp">0</span>
										<span class="h2 tempmark">℃</span>									
									</th>
								</tr>
								<tr>
									<th><p class="cast_txt"></p></th>
								</tr>								
	 						</table>	 					
	 					</div>
						
					</div>
				</div>
			</div>

		</div>

		<!-- 공지사항/게시판 -->
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header card-header-text card-header-primary">
						<div class="card-text">
							<h4 class="card-title">공지사항</h4>
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
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-header card-header-text card-header-warning">
						<div class="card-text">
							<h4 class="card-title">게시판</h4>
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
					</div>
				</div>
			</div>
		</div>

		<!-- TODO-LIST/일정 -->
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
							<h4 class="card-title">전체 일정</h4>
						</div>
					</div>
					<div class="card-body">
						<div id="calendar"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
