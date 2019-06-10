<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 예약현황 tr 클릭시 값을 받아와서 입력시키는 페이지 -->

<style>
div.statusbutton
{

	margin : auto;
	width : 50%;

}
</style>

<script>		

		if("${check}" == 'true'){
			alert("중복된 시간입니다");
		}
		
	$(function(){	
		$("#reservation tr").on('click', function() {
			var str = ""
			var td = $(this).children();

			console.log(td);

			//console.log($(this).children().eq(3).html());
			var startTime = td.eq(3).html().substring(11, 16);
			//console.log(startTime);			
			var changeDateFormat = td.eq(3).html().substring(0, 10);
			//changeDateFormat = dateToMMDDYYYY(changeDateFormat);

			//$("[name =reservId]").val(td.eq(0).html());
			$("#resId").val(td.eq(0).html());
			$("[name =roomId]").val(td.eq(1).html());
			$("[name =description]").val(td.eq(5).html());
			$("[name =startTime]").val(startTime);
			$("[name =endTime]").val(td.eq(4).html().substring(11, 16));
			$("[name =reservDate]").val(changeDateFormat);
			console.log(changeDateFormat);

		});
		
		//입력값 체크
		$('#reserv').on('click', function() {
			
			if ($('#roomr option:selected').text() == "회의실선택") {
				alert("회의실을 선택하세요");
				return false;
			}
			
			if ($('#selectStime option:selected').text() == "선택") {
				alert("시작시간을 선택하세요");
				return false;
			}
			
			if ($('#selectEtime option:selected').text() == "선택") {
				alert("종료시간을 선택하세요");
				return false;
			}
			
			if ($('[name="description"]').val() == "") {
				alert("사용용도를 입력하세요");
				console.log
				return false;
			}
			
			if ($('#selectEtime option:selected').text() == "선택") {
				alert("종료시간을 선택하세요");
				return false;
			}		
			
			if ($('[name=reservDate]').val() == "") {
				alert("날짜를 입력하세요");
				return false;
			}
			
		});	
	});

	function modifyReserv() {
		var reservId = $("#resId").val();
		var roomId = $('[name="roomId"]').val();
		var empNo = $('[name="empNo"]').val();
		var empName = $('[name="empName"]').val();
		var reservDate = $('[name="reservDate"]').val()
		var startTime = $('[name="startTime"]').val();
		var endTime = $('[name="endTime"]').val();
		var description = $('[name="description"]').val();

		/* console.log("================");
		console.log($('[name="reservDate"]').val());
		console.log("================");
		console.log(reservId);
		console.log(startTime + ' -- ' + endTime);
		console.log(JSON.stringify({reservId:reservId,roomId:roomId,empNo:empNo,reservDate:reservDate,startTime:startTime,endTime:endTime,description:description})); */

		$.ajax({
			url : "./updateReserv",
			type : "POST",
			datatype : JSON,
			data : JSON.stringify({
				reservId : reservId,
				roomId : roomId,
				empNo : empNo,
				empName : empName,
				reservDate : reservDate,
				startTime : startTime,
				endTime : endTime,
				description : description
			}),
			contentType : 'application/json',
			success : function(result) {
				var td = $("#" + result.reservId).children();
				td.eq(0).html(result.reservId);
				td.eq(1).html(result.roomId);
				td.eq(2).html(result.empName);
				td.eq(3).html(result.startDate);
				td.eq(4).html(result.endDate);
				td.eq(5).html(result.description);

			}
		});
	}
	//회의실 예약 페이지
</script>
<meta charset="UTF-8">
<title>회의실예약</title>
</head>

<body>
	<div class="col-md-6">
		<div class="card">
			<div class="card-header card-header-text card-header-primary">
				<div class="card-text">
					<h4 class="card-title">회의실 예약</h4>
				</div>
			</div>
			<div class="card-body">
				<form name="frm" action="roomInsertReserv" method="POST">
					<input type="hidden" id="resId"> 회의실 
					<select id="roomr" name="roomId">
						<option value="">회의실선택</option>
						<option value="1">1번회의실</option>
						<option value="2">2번회의실</option>
						<option value="3">3번회의실</option>
					</select>
					<p>
					<p>




						날짜 <input type="text" autocomplete="off" name="reservDate"
							id="datepicker" placeholder="예약일을 지정해주세요.">
						<script>
							$("#datepicker").datepicker({
								dateFormat : 'yy-mm-dd'
								//dateFormat : 'yyyy-mm-dd'
							});
						</script>
					<p>

						예약시간 <select name="startTime" id="selectStime">
							<option value="">선택</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
						</select> ~ <select name="endTime" id="selectEtime">
							<option value="">선택</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00">18:00</option>
						</select>
					<p>
						사용용도
						<textarea name="description" id="des" rows="8" cols="40"></textarea>
					<p>
					<div id="btn_group">
						<button type="submit" id="reserv" class="btn btn-primary btn-sm">예약</button>
						<button type="button" id="reservModify"
							class="btn btn-primary btn-sm" onclick="modifyReserv()">수정</button>
						<button type="reset" id="reservReset"
							class="btn btn-primary btn-sm">초기화</button>
						<button type="button" class="btn btn-primary btn-sm"
							onclick="location.href='roomlist'">취소</button>
					</div>
				</form>
			</div>
		</div>

	</div>
<script>
	function show(view){
		
		//location = "roomReserv?roombutton="+view
		frm1.roombutton.value=view;
		frm1.submit();
	}
</script>
	
	<div class="col-md-6">
		<div class="card">
			<div class="card-header card-header-text card-header-primary">
				<div class="card-text">
					<h4 class="card-title">예약현황</h4>
				</div>
				<form action="roomReserv" name="frm1">
				<input type="hidden" name="roombutton">
				<div class="statusbutton">
				<button type="button" id="before" onclick="show('1')">지난예약</button>
				<button type="button" id="today" onclick="show('2')">금일예약</button>
				<button type="button" id="roomone" onclick="show('3')">1번룸</button>
				<button type="button" id="roomtwo" onclick="show('4')">2번룸</button>
				<button type="button" id="roomthree" onclick="show('5')">3번룸</button>
				</div>
				</form>
			</div>
			<div class="card-body">
				<table id="reservation" class="table">
					<thead>
						<tr>
							<th class="text-center">No</th>
							<th>회의실</th>
							<th>예약자</th>
							<th>시작시간</th>
							<th>종료시간</th>
							<th>사용용도</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="ReservList" varStatus="s">
							<tr id="${ReservList.reservId}">
								<td class="ReservId">${ReservList.reservId}</td>
								<td class="RoomId">${ReservList.roomId}</td>
								<td class="empName">${ReservList.empName}</td>
								<td class="startTime">${ReservList.startTime}</td>
								<td class="endTime">${ReservList.endTime}</td>
								<td class="description">${ReservList.description}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>