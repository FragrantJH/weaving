<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

  <title>
  전체 결재 문서 조회
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script>
  /*
  function userList() {
		$.ajax({
			url:'users',
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:userListResult
		});
	}//userList
	*/
	$('#btnInsert').on('click',function(){
		/*
		var id = $('input:text[name="id"]').val();
		var name = $('input:text[name="name"]').val();
		var gender = $('input:radio[name="gender"]:checked').val();
		var role = $('select[name="role"]').val();

		$.ajax({ 
		    url: "users",  
		    type: 'POST',  
		    dataType: 'json', 
		    //data: JSON.stringify({ id: id, name:name,gender: gender, role: role }),
		    //json.min.js가 있어야한다. 이걸 쓰면 위에 처럼 변수를 일일히 선언할 필요가 없다.
		    // $("#form1").serializeObject()사용하면  json 으로 변환해준다.
		    //JSON.stringify($("#form1").serializeObject()) json을 문자열로 변환해준다.
		    //$("#form1").serilizeArray() 배열형식으로 변환해준다.
		    data: JSON.stringify($("#form1").serializeObject()),
		    contentType: 'application/json', 
		    mimeType: 'application/json',
		    success: function(response) {
		    	if(response.result == true) {
		    		userList();
		    	}
		    }, 
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    } 
		 });  
	});//등록 버튼 클릭
	*/
  </script>
</head>

<body>
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">결재 Table</h4>
                  <p class="card-category"> Here is a subtitle for this table</p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>문서번호</th>
                        <th>기안자</th>
                        <th>제목</th>
                        <th>기안날짜</th>
                        <th>결재완료날짜</th>
                      </thead>
                      <tbody>
                      <c:if test="${empty sessionScope.empName }">
						<a href="login">로그인</a>
					</c:if>
                      ${list};
                      ${empName}
                      ${positionTitle}
                      ${position}|||
                      ${emp}
                      <c:forEach items="${list}" var="board">
                      
                      	<tr>
                      		<td>${board.docNo}</td>
                      		<td>${board.empName}</td>
                      		<td>${board.docTitle}</td>
                      		<td>${board.regDate}</td>
                      		<td>${board.doneDate}</td>
                      	</tr>
                      </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
</body>
</html>
