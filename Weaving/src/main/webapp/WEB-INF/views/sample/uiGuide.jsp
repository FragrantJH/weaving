<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<div style="margin: 30px">
		<h2>★WEAVING STYLE GUIDE★</h2>
		<h5>
			※ 우리 프로젝트에 쓸모 있을 듯한 것만 일단 모았지만<br> 더 마음에 드는 폼이 있거나 다른 기능이 더
			필요하시면 추가해서 쓰셔도 좋습니다! ^0^ <br> 또한 이 가이드 페이지에서는 제대로 작동되지 않는 기능들이
			있습니다. (원인불명ㅠㅠ)<br> 멀쩡한 걸 보려면 아래 사이트에서 왼쪽 사이드바로 검색 가능 : <br>
			https://demos.creative-tim.com/material-dashboard/docs/2.1/components/forms.html
		</h5>
		<br> <br>
		<div>
			<h4>1. 버튼</h4>
			<br> 1) 일반버튼 &nbsp;&nbsp;&nbsp;
			<button class="btn btn-primary btn-sm">저장</button>
			<br> 2) 삭제버튼 &nbsp;&nbsp;&nbsp;
			<button class="btn btn-default btn-sm">삭제</button>
			<br> 3) 비활성화 상태의 버튼 (권한 없는 경우, submit 조건에 충족되지 않을 경우)
			&nbsp;&nbsp;&nbsp;
			<button class="btn btn-primary btn-sm disabled">저장</button>
		</div>
		<br> <br>
		<div>
			<h4>2. 카드</h4>
			<br> 1) 일반 카드 &nbsp;&nbsp;&nbsp;
			<div class="col-md-6">
				<div class="card">
					<div class="card-header card-header-text card-header-primary">
						<div class="card-text">
							<h4 class="card-title">Here is the Text</h4>
						</div>
					</div>
					<div class="card-body">The place is close to Barceloneta
						Beach and bus stop just 2 min by walk and near to "Naviglio" where
						you can enjoy the main night life in Barcelona...</div>
				</div>
			</div>
			<br> 2) 이미지 카드 &nbsp;&nbsp;&nbsp; <br> <br> (1) 작게
			<div class="card" style="width: 20rem;">
				<img class="card-img-top"
					src="https://images.unsplash.com/photo-1517303650219-83c8b1788c4c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bd4c162d27ea317ff8c67255e955e3c8&auto=format&fit=crop&w=2691&q=80"
					alt="Card image cap">
				<div class="card-body">
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
			</div>
			<br> <br> (2) 크게 - 텍스트 아래로
			<div class="card mb-3">
				<img class="card-img-top"
					src="https://images.unsplash.com/photo-1517303650219-83c8b1788c4c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bd4c162d27ea317ff8c67255e955e3c8&auto=format&fit=crop&w=2691&q=80"
					alt="Card image cap">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
			<br> <br> (3) 크게 - 텍스트 위로
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
				<img class="card-img-bottom"
					src="https://images.unsplash.com/photo-1517303650219-83c8b1788c4c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bd4c162d27ea317ff8c67255e955e3c8&auto=format&fit=crop&w=2691&q=80"
					alt="Card image cap">
			</div>
			<br> <br> (4) 크게 - 이미지를 배경으로 텍스트 쓰기
			<div class="card bg-dark text-white">
				<img class="card-img"
					src="https://images.unsplash.com/photo-1517303650219-83c8b1788c4c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bd4c162d27ea317ff8c67255e955e3c8&auto=format&fit=crop&w=2691&q=80"
					alt="Card image">
				<div class="card-img-overlay">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
					<p class="card-text">Last updated 3 mins ago</p>
				</div>
			</div>
		</div>
		<br> <br>
		<div>
			<h4>3. 드롭다운</h4>
			<br> 1) 드롭다운 버튼 (드롭다운해서 옵션 선택) &nbsp;&nbsp;&nbsp;
			<div class="dropdown">
				<button class="btn btn-primary dropdown-toggle" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Dropdown button</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a> <a
						class="dropdown-item" href="#">Something else here</a>
				</div>
			</div>
			<br> 2) 드롭다운 링크 (드롭다운 해서 링크로 이동) &nbsp;&nbsp;&nbsp;
			<div class="dropdown show">
				<a class="btn btn-primary dropdown-toggle" href="#" role="button"
					id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Dropdown link </a>

				<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a> <a
						class="dropdown-item" href="#">Something else here</a>
				</div>
			</div>
		</div>
		<br> <br>
		<div>
			<h4>4. 폼</h4>
			<br> 1) 폼 컨트롤 <br> <br>

			<form>
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label> <input
						type="email" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter email"> <small
						id="emailHelp" class="form-text text-muted">We'll never
						share your email with anyone else.</small>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label> <input
						type="password" class="form-control" id="exampleInputPassword1"
						placeholder="Password">
				</div>
				<div class="form-check">
					<label class="form-check-label"> <input
						class="form-check-input" type="checkbox" value=""> Option
						one is this <span class="form-check-sign"> <span
							class="check"></span>
					</span>
					</label>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
			<br> 2) 첨부파일 폼
			(참고:https://demos.creative-tim.com/material-dashboard/docs/2.1/components/forms.html)<br>
			<br>
			<div class="form-group form-file-upload form-file-simple">
				<input type="text" class="form-control inputFileVisible"
					placeholder="Simple chooser..."> <input type="file"
					class="inputFileHidden">
			</div>

			<div class="form-group form-file-upload form-file-multiple">
				<input type="file" multiple class="inputFileHidden">
				<div class="input-group">
					<input type="text" class="form-control inputFileVisible"
						placeholder="Single File"> <span class="input-group-btn">
						<button type="button" class="btn btn-fab btn-round btn-primary">
							<i class="material-icons">attach_file</i>
						</button>
					</span>
				</div>
			</div>

			<div class="form-group form-file-upload form-file-multiple">
				<input type="file" multiple class="inputFileHidden">
				<div class="input-group">
					<input type="text" class="form-control inputFileVisible"
						placeholder="Multiple Files" multiple> <span
						class="input-group-btn">
						<button type="button" class="btn btn-fab btn-round btn-info">
							<i class="material-icons">layers</i>
						</button>
					</span>
				</div>
			</div>
			<br> 3) 읽기 전용 폼 <input class="form-control" type="text"
				placeholder="Readonly input here…" readonly> <br> <br>

			<div>
				<h4>5. Modal</h4>
				<br> 1) 일반 Modal <br>
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#exampleModal">Launch demo modal</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">...</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
					</div>
				</div>
				<br>
				<br> 2) 로그인 Modal <br>
				<button class="btn btn-round" data-toggle="modal"
					data-target="#loginModal">
					Login<i class="material-icons">assignment</i>
				</button>

				<div class="modal fade" id="loginModal" tabindex="-1" role="">
					<div class="modal-dialog modal-login" role="document">
						<div class="modal-content">
							<div class="card card-signup card-plain">
								<div class="modal-header">
									<div class="card-header card-header-primary text-center">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">
											<i class="material-icons">clear</i>
										</button>

										<h4 class="card-title">Log in</h4>
										<div class="social-line">
											<a href="#pablo" class="btn btn-just-icon btn-link btn-white">
												<i class="fa fa-facebook-square"></i>
											</a> <a href="#pablo"
												class="btn btn-just-icon btn-link btn-white"> <i
												class="fa fa-twitter"></i>
												<div class="ripple-container"></div></a> <a href="#pablo"
												class="btn btn-just-icon btn-link btn-white"> <i
												class="fa fa-google-plus"></i>
											</a>
										</div>
									</div>
								</div>
								<div class="modal-body">
									<form class="form" method="" action="">
										<p class="description text-center">Or Be Classical</p>
										<div class="card-body">

											<div class="form-group bmd-form-group">
												<div class="input-group">
													<div class="input-group-prepend">
														<div class="input-group-text">
															<i class="material-icons">face</i>
														</div>
													</div>
													<input type="text" class="form-control"
														placeholder="First Name...">
												</div>
											</div>

											<div class="form-group bmd-form-group">
												<div class="input-group">
													<div class="input-group-prepend">
														<div class="input-group-text">
															<i class="material-icons">email</i>
														</div>
													</div>
													<input type="text" class="form-control"
														placeholder="Email...">
												</div>
											</div>

											<div class="form-group bmd-form-group">
												<div class="input-group">
													<div class="input-group-prepend">
														<div class="input-group-text">
															<i class="material-icons">lock_outline</i>
														</div>
													</div>
													<input type="password" placeholder="Password..."
														class="form-control">
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="modal-footer justify-content-center">
									<a href="#pablo" class="btn btn-primary btn-link btn-wd btn-lg">Get
										Started</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<br>
					<br>
					<h4>6. Navs</h4>
					<br> 1) Tabs &nbsp;&nbsp;&nbsp;
					<div class="card card-nav-tabs card-plain">
						<div class="card-header card-header-primary">
							<!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
							<div class="nav-tabs-navigation">
								<div class="nav-tabs-wrapper">
									<ul class="nav nav-tabs" data-tabs="tabs">
										<li class="nav-item"><a class="nav-link active"
											href="#home" data-toggle="tab">Home</a></li>
										<li class="nav-item"><a class="nav-link" href="#updates"
											data-toggle="tab">Updates</a></li>
										<li class="nav-item"><a class="nav-link" href="#history"
											data-toggle="tab">History</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card-body ">
							<div class="tab-content text-center">
								<div class="tab-pane active" id="home">
									<p>I think that&#x2019;s a responsibility that I have, to
										push possibilities, to show people, this is the level that
										things could be at. So when you get something that has the
										name Kanye West on it, it&#x2019;s supposed to be pushing the
										furthest possibilities. I will be the leader of a company that
										ends up being worth billions of dollars, because I got the
										answers. I understand culture. I am the nucleus.</p>
								</div>
								<div class="tab-pane" id="updates">
									<p>I will be the leader of a company that ends up being
										worth billions of dollars, because I got the answers. I
										understand culture. I am the nucleus. I think that&#x2019;s a
										responsibility that I have, to push possibilities, to show
										people, this is the level that things could be at. I think
										that&#x2019;s a responsibility that I have, to push
										possibilities, to show people, this is the level that things
										could be at.</p>
								</div>
								<div class="tab-pane" id="history">
									<p>I think that&#x2019;s a responsibility that I have, to
										push possibilities, to show people, this is the level that
										things could be at. I will be the leader of a company that
										ends up being worth billions of dollars, because I got the
										answers. I understand culture. I am the nucleus. I think
										that&#x2019;s a responsibility that I have, to push
										possibilities, to show people, this is the level that things
										could be at.</p>
								</div>
							</div>
						</div>
					</div>
					<br> 2) Pills &nbsp;&nbsp;&nbsp;
					<ul class="nav nav-pills nav-pills-primary" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#link1" role="tablist"
							aria-expanded="true"> Profile </a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#link2" role="tablist" aria-expanded="false"> Settings
						</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#link3" role="tablist" aria-expanded="false"> Options </a></li>
					</ul>
					<div class="tab-content tab-space">
						<div class="tab-pane active" id="link1" aria-expanded="true">
							Collaboratively administrate empowered markets via plug-and-play
							networks. Dynamically procrastinate B2C users after installed
							base benefits. <br> <br> Dramatically visualize
							customer directed convergence without revolutionary ROI.
						</div>
						<div class="tab-pane" id="link2" aria-expanded="false">
							Efficiently unleash cross-media information without cross-media
							value. Quickly maximize timely deliverables for real-time
							schemas. <br> <br>Dramatically maintain
							clicks-and-mortar solutions without functional solutions.
						</div>
						<div class="tab-pane" id="link3" aria-expanded="false">
							Completely synergize resource taxing relationships via premier
							niche markets. Professionally cultivate one-to-one customer
							service with robust ideas. <br> <br>Dynamically
							innovate resource-leveling customer service for state of the art
							customer service.
						</div>
					</div>
					<br> 3) Icons &nbsp;&nbsp;&nbsp;
					<ul class="nav nav-pills nav-pills-icons" role="tablist">
						<!--
        color-classes: "nav-pills-primary", "nav-pills-info", "nav-pills-success", "nav-pills-warning","nav-pills-danger"
    -->
						<li class="nav-item"><a class="nav-link" href="#dashboard-1"
							role="tab" data-toggle="tab"> <i class="material-icons">dashboard</i>
								Dashboard
						</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="#schedule-1" role="tab" data-toggle="tab"> <i
								class="material-icons">schedule</i> Schedule
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#tasks-1"
							role="tab" data-toggle="tab"> <i class="material-icons">list</i>
								Tasks
						</a></li>
					</ul>
					<div class="tab-content tab-space">
						<div class="tab-pane active" id="dashboard-1">
							Collaboratively administrate empowered markets via plug-and-play
							networks. Dynamically procrastinate B2C users after installed
							base benefits. <br> <br> Dramatically visualize
							customer directed convergence without revolutionary ROI.
						</div>
						<div class="tab-pane" id="schedule-1">
							Efficiently unleash cross-media information without cross-media
							value. Quickly maximize timely deliverables for real-time
							schemas. <br> <br>Dramatically maintain
							clicks-and-mortar solutions without functional solutions.
						</div>
						<div class="tab-pane" id="tasks-1">
							Completely synergize resource taxing relationships via premier
							niche markets. Professionally cultivate one-to-one customer
							service with robust ideas. <br> <br>Dynamically
							innovate resource-leveling customer service for state of the art
							customer service.
						</div>
					</div>
				</div>
				<br> <br>
				<div>
					<h4>7. Navbar</h4>
					<br> 1) &nbsp;&nbsp;&nbsp;
					<nav class="navbar navbar-expand-lg bg-primary">
						<div class="container">
							<a class="navbar-brand" href="#">Navbar</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarNavDropdown"
								aria-controls="navbarNavDropdown" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-bar navbar-kebab"></span> <span
									class="navbar-toggler-bar navbar-kebab"></span> <span
									class="navbar-toggler-bar navbar-kebab"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarNavDropdown">
								<ul class="navbar-nav">
									<li class="nav-item active"><a class="nav-link" href="#">Home
											<span class="sr-only">(current)</span>
									</a></li>
									<li class="nav-item"><a class="nav-link" href="#">Features</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="#">Pricing</a>
									</li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#"
										id="navbarDropdownMenuLink" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> Dropdown link
									</a>
										<div class="dropdown-menu"
											aria-labelledby="navbarDropdownMenuLink">
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a> <a
												class="dropdown-item" href="#">Something else here</a>
										</div></li>
								</ul>
							</div>
						</div>
					</nav>
					<br> 2) &nbsp;&nbsp;&nbsp;
					<nav class="navbar navbar-expand-lg bg-primary">
						<div class="container">
							<div class="navbar-translate">
								<a class="navbar-brand" href="/presentation.html">Brand</a>
								<button class="navbar-toggler" type="button"
									data-toggle="collapse" aria-expanded="false"
									aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span> <span
										class="navbar-toggler-icon"></span> <span
										class="navbar-toggler-icon"></span>
								</button>
							</div>

							<div class="collapse navbar-collapse">
								<ul class="navbar-nav">
									<li class="nav-item active"><a href="#pablo"
										class="nav-link">link</a></li>
									<li class="nav-item"><a href="#pablo" class="nav-link">link</a>
									</li>
								</ul>

								<form class="form-inline ml-auto">
									<div class="form-group no-border">
										<input type="text" class="form-control" placeholder="Search">
									</div>
									<button type="submit" class="btn btn-just-icon btn-round">
										<i class="material-icons">search</i>
									</button>
								</form>
							</div>
						</div>
					</nav>
				</div>
				<br> <br>
				<div>
					<h4>8. 아이콘</h4>
					<br> <i class="material-icons">face</i> face <br> <i
						class="material-icons">alarm</i> alarm <br> <i
						class="material-icons">alarm_on</i> alarm_on <br> <i
						class="material-icons">calendar_today</i> calendar <br> <i
						class="material-icons">date_range</i> date_range <br> <i
						class="material-icons">event</i> event <br> <i
						class="material-icons">check_circle</i> check <br> <i
						class="material-icons">add</i> add <br> <i
						class="material-icons">remove</i> remove <br> <i
						class="material-icons">done</i> done <br> <i
						class="material-icons">cancel</i> cancel <br> <i
						class="material-icons">create</i> create <br> <i
						class="material-icons">delete</i> delete <br> <i
						class="material-icons">link</i> link <br> <i
						class="material-icons">send</i> send <br> <i
						class="material-icons">home</i> home <br> <i
						class="material-icons">settings</i> settings <br> <i
						class="material-icons">view_list</i> view_list <br> <i
						class="material-icons">dashboard</i> dashboard <br> <i
						class="material-icons">menu</i> menu <br> <i
						class="material-icons">comment</i> comment <br> <i
						class="material-icons">mail</i> mail <br> <i
						class="material-icons">attachment</i> attachment <br> <i
						class="material-icons">check_box</i> check_box <br> <i
						class="material-icons">meeting_room</i> meeting_room <br> <i
						class="material-icons">no_meeting_room</i> no_meeting_room <br>
					<i class="material-icons">notifications</i> notifications <br>
					<i class="material-icons">notifications_off</i> notifications_off <br>
					<i class="material-icons">group</i> group <br> <i
						class="material-icons">group_add</i> group_add <br> <br>
					<br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>