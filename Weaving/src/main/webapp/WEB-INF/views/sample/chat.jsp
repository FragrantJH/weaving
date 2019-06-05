<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Testing websockets</title>
</head>
<body>
	<fieldset>
		<textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
		<br/> 
		<input id="inputMessage" type="text" /> 
		<input type="submit" value="send" onclick="send()" />
	</fieldset>
	
	<script type="text/javascript">
		var textarea = document.getElementById("messageWindow");
		var webSocket = new WebSocket('ws://localhost/weaving/broadcast.do');
		var inputMessage = document.getElementById('inputMessage');
		webSocket.onerror = function(event) {
			onError(event)
		};
		webSocket.onopen = function(event) {
			onOpen(event)
		};
		webSocket.onmessage = function(event) {
			onMessage(event)
		};
		function onMessage(event) {
			textarea.value += /*"상대 : " +*/event.data + "\n";
			chatAreaScroll();
		}
		function onOpen(event) {
			textarea.value += "연결 성공\n";
		}
		function onError(event) {
			console.log(event);
			alert(event.data);
		}
		function send() {
			var name = ${emp.empNo};
			var name2 = '${emp.empName}';
			console.log(name);
			console.log(name2);
			var msg = {
				cmd : "message",
				tmsg : document.getElementById("inputMessage").value,
				id : name2
			};
			// Send the msg object as a JSON-formatted string.
			webSocket.send(JSON.stringify(msg));
			/*webSocket.send(inputMessage.value);*/
			inputMessage.value = "";
		}
		function chatAreaScroll() {
			//using jquery
			var textArea = $('#messageWindow');
			textArea.scrollTop(textArea[0].scrollHeight - textArea.height());
			textArea.scrollTop(textArea[0].scrollHeight);
			//using javascript
			/* 		var textarea = document.getElementById('messageWindow');
			 textarea.scrollTop = textarea.scrollHeight; */
		}
	</script>
</body>
</html>