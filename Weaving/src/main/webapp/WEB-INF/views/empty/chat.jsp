<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style>
.meTalk {
	background-color: white;
	border: 1px solid black;
	padding: 10px;
	max-width: 60%;
	clear: both;
	float: right;
	margin: 5px;
}

.youTalk {
	background-color: white;
	max-width: 60%;
	clear: both;
	float: left;
	border: 1px solid black;
	/* display:inline-block; */
	padding: 5px;
	margin: 5px;
}
</style>

</head>
<body style="width: 500px; height: 600px;">
<div class="d-flex flex-column">
	  <div class="p-2">
		${param.toEmpName}
	  </div>
	  <div class="p-2">
		<div style="overflow-y:auto; height:100%; width:100% overflow-x:hidden" id="messageWindow">
		</div>
	  </div>
	  <div class="p-2">
		<div class="row">
		  <div class="col-sm-8">
		  	<input id="inputMessage" type="text" onkeydown="if(event.keyCode==13) sendMgs();" placeholder="텍스트를입력하세요" /></div>
		  <div class="col-sm-4">
		  	<button type="button" class="btn btn-primary" onclick="sendMgs()">전송</button>
		  </div>
		</div>
	  </div>
	</div>
	
	<script>
	 	var textarea = document.getElementById("messageWindow"); 
	
		function sendMgs() {
			var empNo = ${emp.empNo};
			var empName = '${emp.empName}';
			var toEmpNo = ${param.toEmpNo};
			var toEmpName = '${param.toEmpName}';
			
			var msg = {
				cmd : "message",
				msg : $('#inputMessage').val(),
				empNo : empNo,
				empName : empName,
				toEmpNo : toEmpNo,
				toEmpName : toEmpName
			};
			
			textarea.innerHTML += "<div class='youTalk w3-round-xlarge'>" + msg.msg + "<div>";
  			textarea.innerHTML += "<div style='float: right;margin-top: 30px;vertical-align: bottom;display: inline;'></div>";
			
			window.opener.send(msg);
			
			$('#inputMessage').val('');
		}
		
		function chatAreaScroll() {
			var textArea = $('#messageWindow');
			textArea.scrollTop(textArea[0].scrollHeight - textArea.height());
			textArea.scrollTop(textArea[0].scrollHeight);
		}
	</script>
</body>
</html>