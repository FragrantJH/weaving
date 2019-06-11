<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Admin Home</title>
</head>
<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		
		var labels = [];
		var series = [];
		
		var max = 0;
		
		<c:forEach items="${reserveState }" var="item">
			labels.push('${item.roomName}');
			series.push(${item.cnt});
			
			// 최대 값 설정
			if(${item.cnt} > max) {
				max = ${item.cnt};
			}
		</c:forEach>

		max = max + 5;
		
		$(function() {
			
			if ($('#reserveChart').length != 0) {

		        var data = {
		          labels: labels,
		          series: [series]
		        };

		        var defaultOptions = {
		        		  // Options for X-Axis
		        		  axisX: {
		        		    // The offset of the chart drawing area to the border of the container
		        		    offset: 30,
		        		    // Position where labels are placed. Can be set to `start` or `end` where `start` is equivalent to left or top on vertical axis and `end` is equivalent to right or bottom on horizontal axis.
		        		    position: 'end',
		        		    // Allows you to correct label positioning on this axis by positive or negative x and y offset.
		        		    labelOffset: {
		        		      x: 0,
		        		      y: 0
		        		    },
		        		    // If labels should be shown or not
		        		    showLabel: true,
		        		    // If the axis grid should be drawn or not
		        		    showGrid: true,
		        		    // This value specifies the minimum width in pixel of the scale steps
		        		    scaleMinSpace: 30,
		        		    // Use only integer values (whole numbers) for the scale steps
		        		    onlyInteger: false
		        		  },
		        		  // Options for Y-Axis
		        		  axisY: {
		        		    // The offset of the chart drawing area to the border of the container
		        		    offset: 40,
		        		    // Position where labels are placed. Can be set to `start` or `end` where `start` is equivalent to left or top on vertical axis and `end` is equivalent to right or bottom on horizontal axis.
		        		    position: 'start',
		        		    // Allows you to correct label positioning on this axis by positive or negative x and y offset.
		        		    labelOffset: {
		        		      x: 0,
		        		      y: 0
		        		    },
		        		    // If labels should be shown or not
		        		    showLabel: true,
		        		    // If the axis grid should be drawn or not
		        		    showGrid: true,
		        		    // Interpolation function that allows you to intercept the value from the axis label
		        		    labelInterpolationFnc: Chartist.noop,
		        		    // This value specifies the minimum height in pixel of the scale steps
		        		    scaleMinSpace: 20,
		        		    // Use only integer values (whole numbers) for the scale steps
		        		    onlyInteger: false
		        		  },
		        		  high: max,
		        		  // Padding of the chart drawing area to the container element and labels as a number or padding object {top: 5, right: 5, bottom: 5, left: 5}
		        		  chartPadding: {
		        		    top: 0,
		        		    right: 0,
		        		    bottom: 0,
		        		    left: 0
		        		  },
		        		  // Specify the distance in pixel of bars in a group
		        		  seriesBarDistance: 15,
		        		  // If set to true this property will cause the series bars to be stacked. Check the `stackMode` option for further stacking options.
		        		  stackBars: false,
		        		  // If set to 'overlap' this property will force the stacked bars to draw from the zero line.
		        		  // If set to 'accumulate' this property will form a total for each series point. This will also influence the y-axis and the overall bounds of the chart. In stacked mode the seriesBarDistance property will have no effect.
		        		  stackMode: 'accumulate',
		        		};
		        
		      
		        var reserveChart = new Chartist.Bar('#reserveChart', data, defaultOptions);
		        md.startAnimationForBarChart(reserveChart);
		      }
		});
	</script>

	<div class="container-fluid">
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
							전체 진행중인 결재 <br> 문서는 
							<small class="text-muted" style="font-size:x-large;">${totalIngCount}</small> 건 입니다.
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
							전체 반려된 결재 문서는 <br>
							<small class="text-muted" style="font-size:x-large;">${totalReturnCount}</small> 건 입니다.
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
							전체 완료된 결재 문서는 <br> 
							<small class="text-muted" style="font-size:x-large;">${totalDoneCount}</small> 건 입니다.
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
							전체 임시저장 문서는 <br>
							<small class="text-muted" style="font-size:x-large;">${totalTempCount}</small> 건 입니다.
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
							이 달의 회의실 예약 현황
						</p>
					</div>
				</div>
			</div>
		</div>

		<div class="row"></div>
	</div>
</body>
</html>
