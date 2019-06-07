<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Weaving Groupware
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
  <!-- full calendar style sheet -->
  <link href='${pageContext.request.contextPath}/resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
  <link href='${pageContext.request.contextPath}/resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
  <link href='${pageContext.request.contextPath}/resources/fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
  <link href='${pageContext.request.contextPath}/resources/fullcalendar/packages/list/main.css' rel='stylesheet' />
  <link href='${pageContext.request.contextPath}/resources/fullcalendar/packages/bootstrap/main.css' rel='stylesheet' />
  <link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
</head>

<style>

.container-fluid{
	width: 95%;
	height: 75%;
}
</style>

<body class="">

  <div class="wrapper">
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="${pageContext.request.contextPath}/assets/img/sidebar-4.jpg">
      <div class="logo">
        <a href="${pageContext.request.contextPath}/home" class="simple-text logo-normal">
          WEAVING
        </a>
        <br>
      	<div class="container">
			<!-- 로그인 했을 때 -->
        	<div align="center">
        		<c:if test="${not empty emp}">
	        		<img src="${pageContext.request.contextPath}/assets/img/faces/avatar.jpg" alt="Avatar" class="avatar">
	        	</c:if>
	        	<c:if test="${empty emp }">
	        		<img src="${pageContext.request.contextPath}/images/no_login_avatar.png" alt="Avatar" class="avatar">
	        	</c:if>
	        	<br>
	        	<br>
	        	<c:if test="${not empty emp }">
	            	<h5>${emp.empName} 님, 환영합니다</h5>
	            </c:if>
	            <c:if test="${empty emp }">
	            	<h6>오늘도 WEAVING과 함께 열일 합시다</h6>
	            </c:if>
	            <c:if test="${not empty emp}">
					<button class="btn btn-defualt" style="width: 100%" onclick="location='${pageContext.request.contextPath}/logout'">
					  <i class="material-icons">face</i> 로그아웃
					</button>
					<button class="btn btn-defualt" style="width: 100%" onclick="location='${pageContext.request.contextPath}/pwcheck'">
					  <i class="material-icons">face</i> 정보수정
					</button>
				</c:if>
				<c:if test="${empty emp}">
					<button class="btn btn-defualt" style="width: 100%" onclick="location='${pageContext.request.contextPath}/login'">
					  <i class="material-icons">face</i> 로그인
					</button>
				</c:if>
			</div>
		</div>        
      </div>
      
      <!-- 메뉴 -->
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/home">
              <i class="material-icons">dashboard</i>
              <p>Home</p>
            </a>
          </li>
          
          <!-- 메일 -->
		  <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" data-target="#mail">
              <i class="material-icons">email</i>
              <p>메일</p>
            </a>
            <div class="collapse navbar-collapse" id="mail">
			    <ul class="navbar-nav">
					<li class="nav-item">
					   	<a class="nav-link" href="${pageContext.request.contextPath}/mailForm">
						 	<i class="material-icons">contact_mail</i>
						 	<p>메일보내기</p>
						</a>
					 </li>
					<li class="nav-item">
					   	<a class="nav-link" href="${pageContext.request.contextPath}/reading_mail">
						 	<i class="material-icons">drafts</i>
						 	<p>받은메일함</p>
						</a>
					 </li>				 
			    </ul>
		  	</div>
          </li>
		  
		  <!-- 결재 -->
		  <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" data-target="#document">
              <i class="material-icons">description</i>
              <p>전자 결재</p>
            </a>
            <div class="collapse navbar-collapse" id="document">
			    <ul class="navbar-nav">
					<li class="nav-item">
					   	<a class="nav-link" href="${pageContext.request.contextPath}/docInsertView">
						 	<i class="material-icons">create</i>
	              		<p>문서 작성하기</p>
						</a>
					 </li>
					<li class="nav-item">
					   	<a class="nav-link" href="${pageContext.request.contextPath}/docList?listType=TEMP">
						 	<i class="material-icons">border_color</i>
	              			<p>임시 저장 문서</p>
						</a>
					</li>				 
					<li class="nav-item">
					   	<a class="nav-link" href="${pageContext.request.contextPath}/docList?listType=WAIT">
						 	<i class="material-icons">flag</i>
	              			<p>결재 대기 문서</p>
						</a>
					</li>				 
					<li class="nav-item">
					   	<a class="nav-link" href="${pageContext.request.contextPath}/docList?listType=RETURN">
							<i class="material-icons">undo</i>
		              		<p>반려 문서</p>
						</a>
					</li>				 
					<li class="nav-item">
					   	<a class="nav-link" href="${pageContext.request.contextPath}/docList?listType=ING">
					      	<i class="material-icons">forward</i>
		              		<p>전체 진행 문서</p>
						</a>
					</li>
					<li class="nav-item">
					   	<a class="nav-link" href="${pageContext.request.contextPath}/docList?listType=DONE">
				      	<i class="material-icons">done_outline</i>
	              		<p>완료 문서</p>
						</a>
					</li>					 
			    </ul>
		  	</div> 
          </li>
		  
		    
          
          <!-- 게시판 -->
		  <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" data-target="#board">
              <i class="material-icons">list</i>
              <p>게시판</p>
            </a>
            <div class="collapse navbar-collapse" id="board">
			    <ul class="navbar-nav">
					<li class="nav-item">
					   	<a class="nav-link" href="${pageContext.request.contextPath}/boardList?boardType=0">
						 	<i class="material-icons">notifications</i>
						 	<p>공지사항</p>
						</a>
					 </li>
					<li class="nav-item">
					   	<a class="nav-link" href="${pageContext.request.contextPath}/boardList?boardType=1">
						 	<i class="material-icons">forum</i>
						 	<p>게시판</p>
						</a>
					 </li>				 
			    </ul>
			  </div> 
          </li>
		  
        
         <!-- 예약 -->
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/roomlist">
              <i class="material-icons">meeting_room</i>
              <p>예약</p>
            </a>
          </li>
          
          <!-- 일정 -->
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" data-target="#cal">
              <i class="material-icons">today</i>
              <p>일정</p>
            </a>
            <div class="collapse navbar-collapse" id="cal">
			    <ul class="navbar-nav">
					<li class="nav-item">
					   	<a class="nav-link" href="${pageContext.request.contextPath}/getCal.do?calType=ALL">
						 	<i class="material-icons">group</i>
						 	<p>전체일정</p>
						</a>
					 </li>
					<li class="nav-item">
					   	<a class="nav-link" href="${pageContext.request.contextPath}/getCal.do?calType=USER">
						 	<i class="material-icons">perm_contact_calendar</i>
						 	<p>개인일정</p>
						</a>
					 </li>				 
			    </ul>
			  </div> 
          </li>
        </ul>
      </div>
    </div>
    
    <div class="main-panel">
      <!-- TODO Navbar 어떻게 할지 정리 필요 -->
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
           <!--  <a class="navbar-brand" href="#pablo">Dashboard</a> -->
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            
            <ul class="navbar-nav">
              
              <li class="nav-item">
              	<a class="nav-link" href="${pageContext.request.contextPath}/getChatEmpList" 
              	onclick="window.open(this.href, '_blank', 'width=400,height=600,toolbars=no,scrollbars=no');  return false;" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">chat</i>
                </a>
              </li>
              
              
              <li class="nav-item dropdown">
                <a class="nav-link" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">notifications</i>
                  <span class="notification">5</span>
                  <p class="d-lg-none d-md-block">
                    Some Actions
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Mike John responded to your email</a>
                  <a class="dropdown-item" href="#">You have 5 new tasks</a>
                  <a class="dropdown-item" href="#">You're now friend with Andrew</a>
                  <a class="dropdown-item" href="#">Another Notification</a>
                  <a class="dropdown-item" href="#">Another One</a>
                </div>
              </li>
              
              <li class="nav-item dropdown">
                <a class="nav-link" href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">person</i>
                  <p class="d-lg-none d-md-block">
                    Account
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/pwcheck">Profile</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Log out</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      
      <!-- End Navbar -->
      <div class="content">
    		<tiles:insertAttribute name="content" />
      </div>
      
      <div class="text-center" style="margin-bottom: 0; background-color: #d3d3d3;">
		<p style="color: white;">Copyright ⓒ 2019 WEAVING All Rights Reserved.</p>
	  </div>
    </div>
  </div>
  
  <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/core/bootstrap-material-design.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Plugin for the momentJs  -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/moment.min.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/sweetalert2.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery.validate.min.js"></script>
  <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery.bootstrap-wizard.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-selectpicker.js"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery.dataTables.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-tagsinput.js"></script>
  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/jasny-bootstrap.min.js"></script>
  <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/fullcalendar.min.js"></script>
  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery-jvectormap.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/nouislider.min.js"></script>
  <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
  <!-- Library for adding dinamically elements -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/arrive.min.js"></script>
  <!-- Chartist JS -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath}/assets/js/material-dashboard.js?v=2.1.1" type="text/javascript"></script>

  
  <!-- full calendar packages -->
  <script src='${pageContext.request.contextPath}/resources/fullcalendar/packages/core/main.js'></script>
  <script src='${pageContext.request.contextPath}/resources/fullcalendar/packages/interaction/main.js'></script>
  <script src='${pageContext.request.contextPath}/resources/fullcalendar/packages/daygrid/main.js'></script>
  <script src='${pageContext.request.contextPath}/resources/fullcalendar/packages/timegrid/main.js'></script>
  <script src='${pageContext.request.contextPath}/resources/fullcalendar/packages/list/main.js'></script>
  <script src='${pageContext.request.contextPath}/resources/fullcalendar/packages/bootstrap/main.js'></script>
  
  <script>
    $(document).ready(function() {
      $().ready(function() {
        $sidebar = $('.sidebar');

        $sidebar_img_container = $sidebar.find('.sidebar-background');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

        if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
          if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
            $('.fixed-plugin .dropdown').addClass('open');
          }

        }

        $('.fixed-plugin a').click(function(event) {
          // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .active-color span').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-color', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data-color', new_color);
          }
        });

        $('.fixed-plugin .background-color .badge').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('background-color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-background-color', new_color);
          }
        });

        $('.fixed-plugin .img-holder').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).parent('li').siblings().removeClass('active');
          $(this).parent('li').addClass('active');


          var new_image = $(this).find("img").attr('src');

          if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            $sidebar_img_container.fadeOut('fast', function() {
              $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
              $sidebar_img_container.fadeIn('fast');
            });
          }

          if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $full_page_background.fadeOut('fast', function() {
              $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
              $full_page_background.fadeIn('fast');
            });
          }

          if ($('.switch-sidebar-image input:checked').length == 0) {
            var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
            $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
          }
        });

        $('.switch-sidebar-image input').change(function() {
          $full_page_background = $('.full-page-background');

          $input = $(this);

          if ($input.is(':checked')) {
            if ($sidebar_img_container.length != 0) {
              $sidebar_img_container.fadeIn('fast');
              $sidebar.attr('data-image', '#');
            }

            if ($full_page_background.length != 0) {
              $full_page_background.fadeIn('fast');
              $full_page.attr('data-image', '#');
            }

            background_image = true;
          } else {
            if ($sidebar_img_container.length != 0) {
              $sidebar.removeAttr('data-image');
              $sidebar_img_container.fadeOut('fast');
            }

            if ($full_page_background.length != 0) {
              $full_page.removeAttr('data-image', '#');
              $full_page_background.fadeOut('fast');
            }

            background_image = false;
          }
        });

        $('.switch-sidebar-mini input').change(function() {
          $body = $('body');

          $input = $(this);

          if (md.misc.sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            md.misc.sidebar_mini_active = false;

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

          } else {

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

            setTimeout(function() {
              $('body').addClass('sidebar-mini');

              md.misc.sidebar_mini_active = true;
            }, 300);
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);

        });
      });
    });
  </script>
  <script>
  	var webSocket = new WebSocket('ws://localhost/weaving/broadcast.do');
  	var chatWindow;
  	
  	webSocket.onerror = function(event) {
		onError(event);
	};
	webSocket.onopen = function(event) {
		onOpen(event);
	};
	webSocket.onmessage = function(event) {
		onMessage(event);
	};
	
	function onMessage(event) {
		chatWindow = window.open(this.href, '_blank', 'width=400,height=600,toolbars=no,scrollbars=no');
		chatWindow.$('#chatView').show();
		chatWindow.$('#empList').hide();
	}
	function onOpen(event) {
		// TODO: 채팅 연결 되었을 때 어떻게 할지..
		console.log("chat is open!!!!");
	}
	function onError(event) {
		console.log(event);
		alert(event.data);
	}
  
    $(document).ready(function() {
      
    	// TODO : 이거 demo에서만 처리되는거면 제거
    	//md.initDashboardPageCharts();

    });
  </script>
</body>

</html>
