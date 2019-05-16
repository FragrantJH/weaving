<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<meta charset="UTF-8">
<title>회의실예약</title>
<style>
	#btn_group button{
		border: 1px solid skyblue;
		background-color: rgba(0,0,0,0);
		color:skyblue;
		padding:5px;
	}
</style>
</head>
<body>
	회의실 <select name="room">
			<option value="">회의실선택</option>
			<option value="1">1번회의실</option>
			<option value="2">2번회의실</option>
			<option value="3">3번회의실</option>
		 </select><p>
	
		 
	날짜  <input type="text" id="datepicker" placeholder="예약일을 지정해주세요.">
		<script>
			$('#datepicker').datepicker();
		</script><p>
	예약시간 <select name="time">
			<option value="">선택</option>
			<option value="1">오전10:00</option>
			<option value="2">오전10:30</option>
			<option value="3">오전11:00</option>
			<option value="4">오전11:30</option>
			<option value="5">오전12:00</option>
			<option value="6">오전12:30</option>
			<option value="7">오전13:00</option>
			<option value="8">오전13:30</option>
			<option value="9">오전14:00</option>
			<option value="10">오전14:30</option>
			<option value="11">오전15:00</option>
			<option value="12">오전15:30</option>
			<option value="13">오전16:00</option>
			<option value="14">오전16:30</option>
			<option value="15">오전17:00</option>
			<option value="16">오전17:30</option>
		  </select>
		  ~
		  <select name="time1">
			<option value="">선택</option>
			<option value="1">오전10:00</option>
			<option value="2">오전10:30</option>
			<option value="3">오전11:00</option>
			<option value="4">오전11:30</option>
			<option value="5">오전12:00</option>
			<option value="6">오전12:30</option>
			<option value="7">오전13:00</option>
			<option value="8">오전13:30</option>
			<option value="9">오전14:00</option>
			<option value="10">오전14:30</option>
			<option value="11">오전15:00</option>
			<option value="12">오전15:30</option>
			<option value="13">오전16:00</option>
			<option value="14">오전16:30</option>
			<option value="15">오전17:00</option>
			<option value="16">오전17:30</option>
		  </select><p>
	사용용도 <textarea name="사용용도" rows="8" cols="40"></textarea><p>
	
	
	<div id="btn_group">
		<button id="reserv">예약</button>
		<butotn id="cancel">취소</butotn>
	</div>
	
	
</body>
</html>