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
<div class="span">
  <div class="col-md-3">
      <div class="card">
          <div class="card-header card-header-icon card-header-rose">
            <div class="card-icon">
              <i class="material-icons">language</i>
            </div>
          </div>
          <div class="card-body">
              <h6 class="card-title">결재 대기중인 문서는 <br> ${count}건 입니다. </h6>
              
          </div>
      </div>
  </div>
  
 <!-- 상단2 -->
<div class="span">
  <div class="col-md-2">
      <div class="card">
          <div class="card-header card-header-icon card-header-rose">
            <div class="card-icon">
              <i class="material-icons">language</i>
            </div>
          </div>
          <div class="card-body">
              <h4 class="card-title">label1</h4>
                  label1 input
          </div>
      </div>
  </div>

<div class="span">
  <div class="col-md-2">
      <div class="card">
          <div class="card-header card-header-icon card-header-rose">
            <div class="card-icon">
              <i class="material-icons">language</i>
            </div>
          </div>
          <div class="card-body">
              <h4 class="card-title">label1</h4>
                  label1 input
          </div>
      </div>
  </div>
<div class="span">
  <div class="col-md-2">
      <div class="card">
          <div class="card-header card-header-icon card-header-rose">
            <div class="card-icon">
              <i class="material-icons">language</i>
            </div>
          </div>
          <div class="card-body">
              <h4 class="card-title">label1</h4>
                  label1 input
          </div>
      </div>
  </div>

</body>
</html>
