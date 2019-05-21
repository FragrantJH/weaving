<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
          <form action="roomInsertReserv" method="POST">
          <input type="hidden" name="startDate">
          <input type="hidden" name="endDate">
              	회의실 <select name="roomId" >
			<option value="">회의실선택</option>
			<option value="1">1번회의실</option>
			<option value="2">2번회의실</option>
			<option value="3">3번회의실</option>
		 </select><p><p>
	
		 
	날짜  <input type="text" name="reservDate" id="datepicker" placeholder="예약일을 지정해주세요.">
		<script>
			$('#datepicker').datepicker();
		</script><p>
		
	예약시간 <select name="startTime">
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
		  </select>
		  ~
		  <select name="endTime">
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
		  </select><p>
	사용용도 <textarea name="description" rows="8" cols="40">

	</textarea><p>
		<div id="btn_group">
		<button type="submit" id="reserv" class="btn btn-primary btn-sm">예약</button>
		<button id="cancel" class="btn btn-primary btn-sm">취소</button>		
		</div>
		</form>
          </div>
      </div>
    
  </div>


  <div class="col-md-6">
      <div class="card">
          <div class="card-header card-header-text card-header-primary">
            <div class="card-text">
              <h4 class="card-title">예약현황</h4>
            </div>
          </div>
          <div class="card-body">
             <table class="table">
    <thead>
        <tr>
            <th class="text-center">No</th>
            <th>회의실</th>
            <th>예약자</th>
            <th>날짜</th>
            <th>예약시간</th>
            <th>사용용도</th>        
        </tr>
    </thead>
    <tbody>
    	<c:forEach items="${list}" var="ReservList" varStatus="s">
        <tr>
            <td>${ReservList.reservId}</td>
            <td>${ReservList.roomId}</td>
            <td>${ReservList.empName}</td>
            <td>${ReservList.startTime}</td>            
            <td>${ReservList.endTime}</td>
            <td>${ReservList.description}</td>
        </tr>
		</c:forEach>
    </tbody>
</table>
          </div>
      </div>
  </div>	
</body>
</html>