<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Admin Home</title>
</head>
<style>
</style>
<body>
${reserveState }

<c:forEach items="${reserveState }" var="item">
	${item.roomName}
	${item.cnt}
</c:forEach>

	<script>
		// 캘린더 화면에 출력
		var labels = [];
		var series = [];
		
		<c:forEach items="${reserveState }" var="item">
			labels.push('${item.roomName}');
			series.push(${item.cnt});    
		</c:forEach>
		
		$(function() {
			
			if ($('#reserveChart').length != 0) {
		        /* ----------==========     Daily Sales Chart initialization For Documentation    ==========---------- */

		        var dataDailySalesChart = {
		          labels: labels,
		          series: series
		        };

		        var optionsDailySalesChart = {
		          lineSmooth: Chartist.Interpolation.cardinal({
		            tension: 0
		          }),
		          low: 0,
		          high: 10,
		          chartPadding: {
		            top: 0,
		            right: 0,
		            bottom: 0,
		            left: 0
		          },
		        }

		        var reserveChart = new Chartist.Line('#reserveChart', dataDailySalesChart, optionsDailySalesChart);
		      }
		});
	</script>

	<div class="container-fluid">

		<h3>이 달의 결재 상황</h3>
		<!-- 상단1 -->
		<div class="row">
			<div class="col-md-3">
				<div class="card">
					<div class="card-header card-header-icon card-header-warning">
						<div class="card-icon">
							<i class="material-icons">forward</i>
						</div>
					</div>
					<div class="card-body">
						<h6 class="card-title">
							전체 진행중인 결재 <br> 문서는 ${totalIngCount}건 입니다.
						</h6>

					</div>
				</div>
			</div>

			<!-- 상단2 -->

			<div class="col-md-3">
				<div class="card">
					<div class="card-header card-header-icon card-header-success">
						<div class="card-icon">
							<i class="material-icons">undo</i>
						</div>
					</div>
					<div class="card-body">
						<h6 class="card-title">
							전체 반려된 결재 문서는 <br> ${totalReturnCount}건 입니다.
						</h6>

					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div class="card-header card-header-icon card-header-danger">
						<div class="card-icon">
							<i class="material-icons">done_outline </i>
						</div>
					</div>
					<div class="card-body">
						<h6 class="card-title">
							전체 완료된 결재 문서는 <br> ${totalDoneCount}건 입니다.
						</h6>

					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div class="card-header card-header-icon card-header-warning">
						<div class="card-icon">
							<i class="material-icons">border_color</i>
						</div>
					</div>
					<div class="card-body">
						<h6 class="card-title">
							전체 임시저장 문서는 <br> ${totalTempCount}건 입니다.
						</h6>

					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- 회의실 예약 현황 -->
			<div class="col-md-4">
				<div class="card card-chart">
					<div class="card-header card-header-success">
						<div class="ct-chart" id="reserveChart"></div>
					</div>
					<div class="card-body">
						<h4 class="card-title">회의실 예약 현황</h4>
						<p class="card-category">
							<span class="text-success"><i class="fa fa-long-arrow-up"></i>
								55% </span> increase in today sales.
						</p>
					</div>
					<div class="card-footer">
						<div class="stats">
							<i class="material-icons">access_time</i> updated 4 minutes ago
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row"></div>
	</div>
</body>
</html>
