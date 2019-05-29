<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="./resources/workspace/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- 메일보내기 -->

</head>

<body>
	<form action="mailSend" method="get">
		<div class="bigpage">
			<div class="send-button">
				<input type="submit" value="보내기"  onclick="location.href='success_email.jsp'"/>
				<button>미리보기</button>
				<button>저장하기</button>
				<button>옵션</button>
			</div>
			<div class="text-cell">
				<table>
					<tbody>
						<tr class="Recipient">
							<th class="row"><label> <a href="#">보내는사람</a>
						</label></th>
							<td colspan="2"><input type="text" name="from"><br>
							</td>
						</tr>

						<tr>
							<th class="row"><label> <a href="#">받는사람 </a></label>
							</th>
							<td colspan="2"><input type="text" name="to"><br>
							</td>
						</tr>


						<tr class=title>
							<th class="row"><label>제목</label></th>
							<td><input type="text" name="subject"><br></td>

						</tr>


					</tbody>
				</table>
			</div>

			<div class="file-attachment"></div>
			<div class="editer-textarea">
				<textarea name="content" id="ir1" rows="10" cols="100"></textarea>

				<script>
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "ir1",
 sSkinURI:"./resources/workspace/SmartEditor2Skin.html" ,
 fCreator: "createSEditor2"
});
</script>

			</div>
		</div>
	</form>

</body>
</html>
