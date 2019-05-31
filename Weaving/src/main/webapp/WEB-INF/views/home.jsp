<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>Home</title>
</head>
<body>

<!-- 상단1 -->
<div class="row" >
  <div class="col-md-3" style="display:inline; float:left;">
      <div class="card">
          <div class="card-header card-header-icon card-header-rose">
            <div class="card-icon">
              <i class="material-icons">language</i>
            </div>
          </div>
          <div class="card-body">
              <h6 class="card-title">사용자님의 결재 대기중인  <br> 문서는 ${count}건 입니다. </h6>
              
          </div>
      </div>
  </div>
  
 <!-- 상단2 -->

  <div class="col-md-3" style="display:inline; float:left;"">
      <div class="card">
          <div class="card-header card-header-icon card-header-rose">
            <div class="card-icon">
              <i class="material-icons">language</i>
            </div>
          </div>
          <div class="card-body">
              <h6 class="card-title">사용자님의 반려된 문서는 <br> ${returndoc}건 입니다.</h6>

          </div>
      </div>
  </div>


  <div class="col-md-3" style="display:inline; float:left;">
      <div class="card">
          <div class="card-header card-header-icon card-header-rose">
            <div class="card-icon">
              <i class="material-icons">language</i>
            </div>
          </div>
          <div class="card-body">
              <h6 class="card-title">사용자님이 아직 읽지 않은 메일은 <br> ${countMail}건 입니다.</h6>

          </div>
      </div>
  </div>

  <div class="col-md-3" style="display:inline; float:left;">
      <div class="card">
          <div class="card-header card-header-icon card-header-rose">
            <div class="card-icon">
              <i class="material-icons">language</i>
            </div>
          </div>
          <div class="card-body">
              <h6 class="card-title">하기 싫다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ</h6>
          </div>
      </div>
  </div>


  <div class="col-md-6" style="display:inline; float:left;">
      <div class="card">
          <div class="card-header card-header-text card-header-primary">
            <div class="card-text">
              <h4 class="card-title">공지사항</h4>
            </div>
          </div>
          <div class="card-body">
              	공지사항 미리보기 공간
          </div>
      </div>
  </div>

  <div class="col-md-6" style="display:inline; float:right;">
      <div class="card">
          <div class="card-header card-header-text card-header-primary">
            <div class="card-text">
              <h4 class="card-title">게시판</h4>
            </div>
          </div>
          <div class="card-body">
              	게시판 미리보기 공간
          </div>
      </div>
  </div>
</div>


</body>
</html>
