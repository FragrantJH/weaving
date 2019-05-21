<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>

<body>

  <div id='calendar'></div>
  <script>
	  document.addEventListener('DOMContentLoaded', function() {
		    var calendarEl = document.getElementById('calendar');
		
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      plugins: [ 'interaction', 'dayGrid' ],
		      defaultDate: '2019-04-12',
		      editable: true,
		      eventLimit: true, // allow "more" link when too many events
		      events: [
		        {
		          title: 'All Day Event',
		          start: '2019-04-01'
		        }
		      ]
		    });
		
		    calendar.render();
		  });

</script>
</body>