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
          <form>
              	회의실 <select name="room">
			<option value="">회의실선택</option>
			<option value="1">1번회의실</option>
			<option value="2">2번회의실</option>
			<option value="3">3번회의실</option>
		 </select><p><p>
	
		 
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
	사용용도 <textarea name="사용용도" rows="8" cols="40">
	${roomReserv.description}
	</textarea><p>
		<div id="btn_group">
		<button id="reserv" class="btn btn-primary btn-sm">예약</button>
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
            <th class="text-center">#</th>
            <th>Name</th>
            <th>Job Position</th>
            <th>Since</th>
            <th class="text-right">Salary</th>        
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="text-center">1</td>
            <td>Andrew Mike</td>
            <td>Develop</td>
            <td>2013</td>
            <td class="text-right">&euro; 99,225</td>
        </tr>
        <tr>
            <td class="text-center">2</td>
            <td>John Doe</td>
            <td>Design</td>
            <td>2012</td>
            <td class="text-right">&euro; 89,241</td>
        </tr>
        <tr>
            <td class="text-center">3</td>
            <td>Alex Mike</td>
            <td>Design</td>
            <td>2010</td>
            <td class="text-right">&euro; 92,144</td>
        </tr>
    </tbody>
</table>
          </div>
      </div>
  </div>
</div>
	
	
</body>
</html>