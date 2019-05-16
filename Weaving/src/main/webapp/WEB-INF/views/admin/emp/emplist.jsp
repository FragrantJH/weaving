<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!--공간 분할을 위한 div 설정-->
div {
        width: 100%;
    }
div.left {
        width: 50%;
        float: left;
        box-sizing: border-box;
    }
div.right {
        width: 50%;
        float: right;
        box-sizing: border-box;
    }

</style>
</head>
<body>

<c:if test="${not empty sessionScope.empName }">
	${empName} 님 환영합니다. 직위 ${positionTitle} !
	<input type="button" onclick="location='logout'">로그아웃
</c:if>
<c:if test="${empty sessionScope.empName }">
	<a href="login">로그인</a>
</c:if>
 <div>
	 <div class="left">
		 <h2>조직도</h2>
		 <hr>
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
	 </div>
	 
	 <div class="left">
		 <h2>직원목록</h2>
		 <hr>
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
	 
 </div>
</body>
</html>