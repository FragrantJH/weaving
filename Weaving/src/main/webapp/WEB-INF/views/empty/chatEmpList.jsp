<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 목록</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
/*---------chat window---------------*/
    .container{
        max-width:900px;
    }
    .inbox_people {
    	background: #fff;
    	float: left;
    	overflow: hidden;
    	width: 30%;
    	border-right: 1px solid #ddd;
    }
    
    .inbox_msg {
    	border: 1px solid #ddd;
    	clear: both;
    	overflow: hidden;
    }
    
    .top_spac {
    	margin: 20px 0 0;
    }
    
    .recent_heading {
    	float: left;
    	width: 40%;
    }
    
    .srch_bar {
    	display: inline-block;
    	text-align: right;
    	width: 60%;
    	padding:
    }
    
    .headind_srch {
    	padding: 10px 29px 10px 20px;
    	overflow: hidden;
    	border-bottom: 1px solid #c4c4c4;
    }
    
    .recent_heading h4 {
    	color: #0465ac;
        font-size: 16px;
        margin: auto;
        line-height: 29px;
    }
    
    .srch_bar input {
    	outline: none;
    	border: 1px solid #cdcdcd;
    	border-width: 0 0 1px 0;
    	width: 80%;
    	padding: 2px 0 4px 6px;
    	background: none;
    }
    
    .srch_bar .input-group-addon button {
    	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    	border: medium none;
    	padding: 0;
    	color: #707070;
    	font-size: 18px;
    }
    
    .srch_bar .input-group-addon {
    	margin: 0 0 0 -27px;
    }
    
    .chat_ib h5 {
    	font-size: 15px;
    	color: #464646;
    	margin: 0 0 8px 0;
    }
    
    .chat_ib h5 span {
    	font-size: 13px;
    	float: right;
    }
    
    .chat_ib p {
        font-size: 12px;
        color: #989898;
        margin: auto;
        display: inline-block;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    
    .chat_img {
    	float: left;
    	width: 11%;
    }
    
    .chat_img img {
    	width: 100%
    }
    
    .chat_ib {
    	float: left;
    	padding: 0 0 0 15px;
    	width: 88%;
    }
    
    .chat_people {
    	overflow: hidden;
    	clear: both;
    }
    
    .chat_list {
    	border-bottom: 1px solid #ddd;
    	margin: 0;
    	padding: 18px 16px 10px;
    }
    
    .inbox_chat {
    	height: 550px;
    	overflow-y: scroll;
    }
    
    .active_chat {
    	background: #e8f6ff;
    }
    
    .incoming_msg_img {
    	display: inline-block;
    	width: 6%;
    }
    
    .incoming_msg_img img {
    	width: 100%;
    }
    
    .received_msg {
    	display: inline-block;
    	padding: 0 0 0 10px;
    	vertical-align: top;
    	width: 92%;
    }
    
    .received_withd_msg p {
    	background: #ebebeb none repeat scroll 0 0;
    	border-radius: 0 15px 15px 15px;
    	color: #646464;
    	font-size: 14px;
    	margin: 0;
    	padding: 5px 10px 5px 12px;
    	width: 100%;
    }
    
    .time_date {
    	color: #747474;
    	display: block;
    	font-size: 12px;
    	margin: 8px 0 0;
    }
    
    .received_withd_msg {
    	width: 57%;
    }
    
    .mesgs{
    	float: left;
    	padding: 30px 15px 0 25px;
    	width:70%;
    }
    
    .sent_msg p {
    	background:#0465ac;
    	border-radius: 12px 15px 15px 0;
    	font-size: 14px;
    	margin: 0;
    	color: #fff;
    	padding: 5px 10px 5px 12px;
    	width: 100%;
    }
    
    .outgoing_msg {
    	overflow: hidden;
    	margin: 26px 0 26px;
    }
    
    .sent_msg {
    	float: right;
    	width: 46%;
    }
    
    .input_msg_write input {
    	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    	border: medium none;
    	color: #4c4c4c;
    	font-size: 15px;
    	min-height: 48px;
    	width: 100%;
    	outline:none;
    }
    
    .type_msg {
    	border-top: 1px solid #c4c4c4;
    	position: relative;
    }
    
    .msg_send_btn {
    	background: #05728f none repeat scroll 0 0;
    	border:none;
    	border-radius: 50%;
    	color: #fff;
    	cursor: pointer;
    	font-size: 15px;
    	height: 33px;
    	position: absolute;
    	right: 0;
    	top: 11px;
    	width: 33px;
    }
    
    .messaging {
    	padding: 0 0 50px 0;
    }
    
    .msg_history {
    	height: 516px;
    	overflow-y: auto;
    }

</style>

<script>
	
	$(function() {
		empList();
		startChat();
	});
	
	//사용자 목록 조회 요청
	function empList() {
		$.ajax({
			url : 'getOnlineEmp',
			type : 'GET',
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : empListResult
		});
	}//userList
	
	//사용자 목록 조회 응답
	function empListResult(data) {
		$("tbody").empty();
		$.each(data, function(idx, item) {
			$('<tr>')
			.append($('<td>').html(item.empNo))
			.append($('<td>').html(item.empName))
			.append($('<td>').html(item.deptName))
			.append($('<td>').html(item.position))
			.append($('<td>').html('<button id="chatButton" type="button" class="btn btn-default btn-sm">chat</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_empNo\'>').val(item.empNo))
			.append($('<input type=\'hidden\' id=\'hidden_empName\'>').val(item.empName))
			.appendTo('tbody');
		});
	}
	
	function startChat() {
		$('body').on('click', '#chatButton', function() {
			
			// 상대방 정보
			toEmpNo = $(this).closest('tr').find('#hidden_empNo').val();
			toEmpName = $(this).closest('tr').find('#hidden_empName').val();
			
			// 사용자 목록을 닫고,
			// 채팅 창을 띄운다
			var empNo = ${emp.empNo};
			var empName = '${emp.empName}';
			var msg = {
				cmd : 'start',
				msg : '새로운 채팅이 시작되었습니다',
				empNo : empNo,
				empName : empName,
				toEmpNo : toEmpNo,
				toEmpName : toEmpName
			};

			window.opener.webSocket.send(JSON.stringify(msg));
			
			// 채팅 창을 연다
			location = '${pageContext.request.contextPath}/startChat?toEmpNo=' + toEmpNo + '&toEmpName=' + toEmpName;
			// 현재 창을 닫고
		});
	}
	
</script>

</head>

<body>
	<div id="empList">
		<div class="headind_srch">
				<div class="recent_heading">
					<h4>접속 중인 직원</h4>
				</div>
			</div>
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-center">사번</th>
					<th class="text-center">이름</th>
					<th class="text-center">부서</th>
					<th class="text-center">직책</th>
					<th class="text-center">채팅</th>
				</tr>
			</thead>
			<tbody id="empList"></tbody>
		</table>
	</div>
</body>
</html>