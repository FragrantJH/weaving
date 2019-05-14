<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.submenu {
    display:none;
    background: #ccc;
}
#menuBtn:checked ~ .submenu {
    display: block;
}
</style>
</head>
<body>
 <div>
 <h2>조직도</h2>
 <ul>
 <li>
 <input type="checkbox" id="menuBtn">
 <label for="menuBtn" class="labelBtn" onclick="">메뉴3</label>
 <ul class="submenu">
 <li><a href="#">소메뉴1</a></li>
 <li><a href="#">소메뉴2</a></li>
 <li><a href="#">소메뉴3</a></li>
 <li><a href="#">소메뉴4</a></li>
 </ul>
 </li>
 </ul>
 <h2>직원목록</h2>
 <table border ="1">
 <tr>
 <td>이름</td><td>직책</td><td>부서</td>
 </tr>
 <tr>
 <td>이름</td><td>직책</td><td>부서</td>
 </tr>
 </table>
 <br>
 <button>직위관리</button>
 <button>삭제</button>
 <button onclick="location.href='./empinsert'">등록</button>
 </div>
</body>
</html>