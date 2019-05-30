
/* Drop Tables */

DROP TABLE Reply CASCADE CONSTRAINTS;
DROP TABLE Board CASCADE CONSTRAINTS;
DROP TABLE Calendars CASCADE CONSTRAINTS;
DROP TABLE DocumentDetail CASCADE CONSTRAINTS;
DROP TABLE Documents CASCADE CONSTRAINTS;
DROP TABLE Reservation CASCADE CONSTRAINTS;
DROP TABLE TodoList CASCADE CONSTRAINTS;
DROP TABLE Employees CASCADE CONSTRAINTS;
DROP TABLE Department CASCADE CONSTRAINTS;
DROP TABLE DocumentForm CASCADE CONSTRAINTS;
DROP TABLE DOCUMENTHISTORY CASCADE CONSTRAINTS;
DROP TABLE email CASCADE CONSTRAINTS;
DROP TABLE Room CASCADE CONSTRAINTS;




/* Create Tables */

-- 게시판
CREATE TABLE Board
(
	-- 게시글ID
	board_id number NOT NULL,
	-- 작성자ID
	emp_no number NOT NULL,
	-- 제목
	title varchar2(500) NOT NULL,
	-- 내용
	board_contents varchar2(4000) NOT NULL,
	-- 작성시간
	time date DEFAULT sysdate,
	-- 게시판타입 : 0: 공지사항
	-- 1: 사내게시판
	board_type char DEFAULT '0',
	PRIMARY KEY (board_id)
);


-- 일정
CREATE TABLE Calendars
(
	-- 캘린더ID
	cal_id number NOT NULL,
	-- 직원ID
	emp_no number,
	-- 제목
	title varchar2(100) NOT NULL,
	-- 하루종일여부 : 1 : 하루종일
	-- 0 : 하루종일 아님
	-- 
	all_Day char DEFAULT '1',
	-- 시작
	start_date date DEFAULT sysdate NOT NULL,
	-- 종료
	end_date date DEFAULT sysdate NOT NULL,
	-- 색상 : CSS색상 코드
	-- #ff0000
	back_color varchar2(10),
	-- 설명
	description varchar2(500),
	PRIMARY KEY (cal_id)
);


-- 부서
CREATE TABLE Department
(
	-- 부서ID
	dept_id number DEFAULT 0 NOT NULL,
	-- 부서명
	dept_name varchar2(100) NOT NULL,
	-- 부모부서ID
	upper_dept_id number,
	PRIMARY KEY (dept_id)
);


-- 결재상세정보
CREATE TABLE DocumentDetail
(
	-- 결재문서ID
	doc_id number NOT NULL,
	-- 결재자ID
	emp_no number NOT NULL,
	-- 결재순서
	approval_order number NOT NULL,
	-- 결재날짜
	approval_date date,
	-- 상태 : 대기 : WAIT
	-- 완료 : DONE
	-- 반려 : RETU
	status char(4) DEFAULT 'WAIT' NOT NULL,
	-- 코멘트
	approval_comments varchar2(100),
	PRIMARY KEY (doc_id, emp_no)
);


-- 결재폼
CREATE TABLE DocumentForm
(
	-- 결재폼ID
	form_id number NOT NULL,
	-- 이름
	form_name varchar2(200) NOT NULL,
	-- 설명
	description varchar2(500),
	-- 폼내용
	form_contents varchar2(4000) NOT NULL,
	-- 등록날짜
	create_date date DEFAULT sysdate,
	PRIMARY KEY (form_id)
);


-- 문서히스토리
CREATE TABLE DOCUMENTHISTORY
(
	-- 히스토리ID
	HISTORY_ID number NOT NULL,
	-- DOC_ID
	DOC_ID number,
	-- EMP_NO
	EMP_NO number,
	-- PRE_STATUS : 변경 전 상태값
	PRE_STATUS char(4),
	-- 현재상태 : 현재 상태 값
	CUR_STATUS char(4),
	-- 변경날짜
	CHANGE_DATE date DEFAULT sysdate,
	PRIMARY KEY (HISTORY_ID)
);


-- 결재문서
CREATE TABLE Documents
(
	-- 결재문서ID
	doc_id number NOT NULL,
	-- 기안자ID
	emp_no number NOT NULL,
	-- 문서번호
	doc_no varchar2(200) NOT NULL,
	-- 제목
	doc_title varchar2(500) NOT NULL,
	-- 내용
	doc_contents varchar2(4000) NOT NULL,
	-- 기안날짜
	reg_date date DEFAULT sysdate,
	-- 결재완료날짜
	done_date date,
	-- 보안등급
	secure_level char DEFAULT 'C',
	PRIMARY KEY (doc_id)
);


-- 이메일
CREATE TABLE email
(
	-- 이메일ID
	email_id number NOT NULL,
	-- 보낸이메일주소
	from_email varchar2(100) NOT NULL,
	-- 받은이메일주소
	to_email varchar2(100) NOT NULL,
	-- 제목
	title varchar2(200),
	-- 내용
	email_contents varchar2(500),
	-- 읽은시간
	check_time date,
	-- 읽음확인유무 : 1 : 읽음
	-- 0 : 안읽음
	read_check char DEFAULT '0',
	PRIMARY KEY (email_id)
);


-- 직원
CREATE TABLE Employees
(
	-- 사번
	emp_no number NOT NULL,
	-- 이름
	emp_name varchar2(100) NOT NULL,
	-- 비밀번호
	password varchar2(100) NOT NULL,
	-- 직위 : 0 사원
	-- 1 대리
	-- 2 과장
	-- 3 차장
	-- 4 부장
	-- 5 대표
	position number DEFAULT 0,
	-- 입사일
	joindate date DEFAULT sysdate NOT NULL,
	-- 이메일
	email varchar2(200) NOT NULL,
	-- Gmail앱키 : Gmail과 연동하기 위해 사용자별 App key 관리
	gmail_app_key varchar2(16) NOT NULL,
	-- 휴대전화
	phone varchar2(50),
	-- 주소
	address varchar2(200),
	-- 삭제유무 : Y : 삭제
	-- N : Default
	deleted_yn char DEFAULT 'N',
	-- 삭제날짜
	delete_date date,
	-- 부서ID
	dept_id number,
	PRIMARY KEY (emp_no)
);


-- 댓글
CREATE TABLE Reply
(
	-- 댓글ID
	reply_id number NOT NULL,
	-- 댓글내용
	rep_contents varchar2(500),
	-- 시간
	time date DEFAULT sysdate NOT NULL,
	-- 작성자ID
	emp_no number NOT NULL,
	-- 게시글ID
	board_id number NOT NULL,
	PRIMARY KEY (reply_id)
);


-- 예약
CREATE TABLE Reservation
(
	-- 예약ID
	reserv_id number NOT NULL,
	-- 회의실ID
	room_id number NOT NULL,
	-- 등록자ID
	emp_no number NOT NULL,
	-- 예약시작날짜
	start_time date NOT NULL,
	-- 사용시간
	end_time date DEFAULT sysdate,
	-- 사용용도
	description varchar2(500),
	PRIMARY KEY (reserv_id)
);


-- 회의실
CREATE TABLE Room
(
	-- 회의실ID
	room_id number NOT NULL,
	-- 회의실이름
	room_name varchar2(200) NOT NULL,
	-- room_loc
	room_loc varchar2(20),
	-- room_size : M
	-- L
	-- S
	room_size char,
	-- room_max
	room_max varchar2(20),
	PRIMARY KEY (room_id)
);


-- TODO리스트
CREATE TABLE TodoList
(
	-- 할일ID
	todo_id number NOT NULL,
	-- 사번ID
	emp_no number NOT NULL,
	-- 메모내용
	content varchar2(500) NOT NULL,
	-- 완료유무 : N : default
	-- Y
	done char DEFAULT 'N',
	-- 등록날짜
	create_date date DEFAULT sysdate,
	PRIMARY KEY (todo_id)
);



/* Create Foreign Keys */

ALTER TABLE Reply
	ADD FOREIGN KEY (board_id)
	REFERENCES Board (board_id)
	ON DELETE CASCADE
;


ALTER TABLE Department
	ADD FOREIGN KEY (upper_dept_id)
	REFERENCES Department (dept_id)
	ON DELETE CASCADE
;


ALTER TABLE Employees
	ADD FOREIGN KEY (dept_id)
	REFERENCES Department (dept_id)
	ON DELETE CASCADE
;


ALTER TABLE DocumentDetail
	ADD FOREIGN KEY (doc_id)
	REFERENCES Documents (doc_id)
	ON DELETE CASCADE
;


ALTER TABLE Board
	ADD FOREIGN KEY (emp_no)
	REFERENCES Employees (emp_no)
	ON DELETE CASCADE
;


ALTER TABLE Calendars
	ADD FOREIGN KEY (emp_no)
	REFERENCES Employees (emp_no)
;


ALTER TABLE DocumentDetail
	ADD FOREIGN KEY (emp_no)
	REFERENCES Employees (emp_no)
	ON DELETE CASCADE
;


ALTER TABLE Documents
	ADD FOREIGN KEY (emp_no)
	REFERENCES Employees (emp_no)
	ON DELETE CASCADE
;


ALTER TABLE Reply
	ADD FOREIGN KEY (emp_no)
	REFERENCES Employees (emp_no)
	ON DELETE CASCADE
;


ALTER TABLE Reservation
	ADD FOREIGN KEY (emp_no)
	REFERENCES Employees (emp_no)
	ON DELETE CASCADE
;


ALTER TABLE TodoList
	ADD FOREIGN KEY (emp_no)
	REFERENCES Employees (emp_no)
	ON DELETE CASCADE
;


ALTER TABLE Reservation
	ADD FOREIGN KEY (room_id)
	REFERENCES Room (room_id)
	ON DELETE CASCADE
;



/* Comments */

COMMENT ON TABLE Board IS '게시판';
COMMENT ON COLUMN Board.board_id IS '게시글ID';
COMMENT ON COLUMN Board.emp_no IS '작성자ID';
COMMENT ON COLUMN Board.title IS '제목';
COMMENT ON COLUMN Board.board_contents IS '내용';
COMMENT ON COLUMN Board.time IS '작성시간';
COMMENT ON COLUMN Board.board_type IS '게시판타입 : 0: 공지사항
1: 사내게시판';
COMMENT ON TABLE Calendars IS '일정';
COMMENT ON COLUMN Calendars.cal_id IS '캘린더ID';
COMMENT ON COLUMN Calendars.emp_no IS '직원ID';
COMMENT ON COLUMN Calendars.title IS '제목';
COMMENT ON COLUMN Calendars.all_Day IS '하루종일여부 : 1 : 하루종일
0 : 하루종일 아님
';
COMMENT ON COLUMN Calendars.start_date IS '시작';
COMMENT ON COLUMN Calendars.end_date IS '종료';
COMMENT ON COLUMN Calendars.back_color IS '색상 : CSS색상 코드
#ff0000';
COMMENT ON COLUMN Calendars.description IS '설명';
COMMENT ON TABLE Department IS '부서';
COMMENT ON COLUMN Department.dept_id IS '부서ID';
COMMENT ON COLUMN Department.dept_name IS '부서명';
COMMENT ON COLUMN Department.upper_dept_id IS '부모부서ID';
COMMENT ON TABLE DocumentDetail IS '결재상세정보';
COMMENT ON COLUMN DocumentDetail.doc_id IS '결재문서ID';
COMMENT ON COLUMN DocumentDetail.emp_no IS '결재자ID';
COMMENT ON COLUMN DocumentDetail.approval_order IS '결재순서';
COMMENT ON COLUMN DocumentDetail.approval_date IS '결재날짜';
COMMENT ON COLUMN DocumentDetail.status IS '상태 : 대기 : WAIT
완료 : DONE
반려 : RETU';
COMMENT ON COLUMN DocumentDetail.approval_comments IS '코멘트';
COMMENT ON TABLE DocumentForm IS '결재폼';
COMMENT ON COLUMN DocumentForm.form_id IS '결재폼ID';
COMMENT ON COLUMN DocumentForm.form_name IS '이름';
COMMENT ON COLUMN DocumentForm.description IS '설명';
COMMENT ON COLUMN DocumentForm.form_contents IS '폼내용';
COMMENT ON COLUMN DocumentForm.create_date IS '등록날짜';
COMMENT ON TABLE DOCUMENTHISTORY IS '문서히스토리';
COMMENT ON COLUMN DOCUMENTHISTORY.HISTORY_ID IS '히스토리ID';
COMMENT ON COLUMN DOCUMENTHISTORY.DOC_ID IS 'DOC_ID';
COMMENT ON COLUMN DOCUMENTHISTORY.EMP_NO IS 'EMP_NO';
COMMENT ON COLUMN DOCUMENTHISTORY.PRE_STATUS IS 'PRE_STATUS : 변경 전 상태값';
COMMENT ON COLUMN DOCUMENTHISTORY.CUR_STATUS IS '현재상태 : 현재 상태 값';
COMMENT ON COLUMN DOCUMENTHISTORY.CHANGE_DATE IS '변경날짜';
COMMENT ON TABLE Documents IS '결재문서';
COMMENT ON COLUMN Documents.doc_id IS '결재문서ID';
COMMENT ON COLUMN Documents.emp_no IS '기안자ID';
COMMENT ON COLUMN Documents.doc_no IS '문서번호';
COMMENT ON COLUMN Documents.doc_title IS '제목';
COMMENT ON COLUMN Documents.doc_contents IS '내용';
COMMENT ON COLUMN Documents.reg_date IS '기안날짜';
COMMENT ON COLUMN Documents.done_date IS '결재완료날짜';
COMMENT ON COLUMN Documents.secure_level IS '보안등급';
COMMENT ON TABLE email IS '이메일';
COMMENT ON COLUMN email.email_id IS '이메일ID';
COMMENT ON COLUMN email.from_email IS '보낸이메일주소';
COMMENT ON COLUMN email.to_email IS '받은이메일주소';
COMMENT ON COLUMN email.title IS '제목';
COMMENT ON COLUMN email.email_contents IS '내용';
COMMENT ON COLUMN email.check_time IS '읽은시간';
COMMENT ON COLUMN email.read_check IS '읽음확인유무 : 1 : 읽음
0 : 안읽음';
COMMENT ON TABLE Employees IS '직원';
COMMENT ON COLUMN Employees.emp_no IS '사번';
COMMENT ON COLUMN Employees.emp_name IS '이름';
COMMENT ON COLUMN Employees.password IS '비밀번호';
COMMENT ON COLUMN Employees.position IS '직위 : 0 사원
1 대리
2 과장
3 차장
4 부장
5 대표';
COMMENT ON COLUMN Employees.joindate IS '입사일';
COMMENT ON COLUMN Employees.email IS '이메일';
COMMENT ON COLUMN Employees.gmail_app_key IS 'Gmail앱키 : Gmail과 연동하기 위해 사용자별 App key 관리';
COMMENT ON COLUMN Employees.phone IS '휴대전화';
COMMENT ON COLUMN Employees.address IS '주소';
COMMENT ON COLUMN Employees.deleted_yn IS '삭제유무 : Y : 삭제
N : Default';
COMMENT ON COLUMN Employees.delete_date IS '삭제날짜';
COMMENT ON COLUMN Employees.dept_id IS '부서ID';
COMMENT ON TABLE Reply IS '댓글';
COMMENT ON COLUMN Reply.reply_id IS '댓글ID';
COMMENT ON COLUMN Reply.rep_contents IS '댓글내용';
COMMENT ON COLUMN Reply.time IS '시간';
COMMENT ON COLUMN Reply.emp_no IS '작성자ID';
COMMENT ON COLUMN Reply.board_id IS '게시글ID';
COMMENT ON TABLE Reservation IS '예약';
COMMENT ON COLUMN Reservation.reserv_id IS '예약ID';
COMMENT ON COLUMN Reservation.room_id IS '회의실ID';
COMMENT ON COLUMN Reservation.emp_no IS '등록자ID';
COMMENT ON COLUMN Reservation.start_time IS '예약시작날짜';
COMMENT ON COLUMN Reservation.end_time IS '사용시간';
COMMENT ON COLUMN Reservation.description IS '사용용도';
COMMENT ON TABLE Room IS '회의실';
COMMENT ON COLUMN Room.room_id IS '회의실ID';
COMMENT ON COLUMN Room.room_name IS '회의실이름';
COMMENT ON COLUMN Room.room_loc IS 'room_loc';
COMMENT ON COLUMN Room.room_size IS 'room_size : M
L
S';
COMMENT ON COLUMN Room.room_max IS 'room_max';
COMMENT ON TABLE TodoList IS 'TODO리스트';
COMMENT ON COLUMN TodoList.todo_id IS '할일ID';
COMMENT ON COLUMN TodoList.emp_no IS '사번ID';
COMMENT ON COLUMN TodoList.content IS '메모내용';
COMMENT ON COLUMN TodoList.done IS '완료유무 : N : default
Y';
COMMENT ON COLUMN TodoList.create_date IS '등록날짜';



