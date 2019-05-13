
/* Drop Tables */

DROP TABLE approvalform CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE DocumentDetail CASCADE CONSTRAINTS;
DROP TABLE Documents CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE todolist CASCADE CONSTRAINTS;
DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE department CASCADE CONSTRAINTS;
DROP TABLE room CASCADE CONSTRAINTS;




/* Create Tables */

-- 결재폼
CREATE TABLE approvalform
(
	-- 결재폼ID
	form_id number NOT NULL,
	-- 이름
	form_name varchar2(200) NOT NULL,
	-- 설명
	description varchar2(500),
	-- 폼내용
	form_contents varchar2(4000) NOT NULL,
	PRIMARY KEY (form_id)
);


-- 게시판
CREATE TABLE board
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


-- 부서
CREATE TABLE department
(
	-- 부서ID
	dept_id number NOT NULL,
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
	-- status : 대기 :WAIT
	-- 완료 :DONE
	-- 반려 :RETU
	-- 취하 :DROP
	status char(4) DEFAULT 'WAIT' NOT NULL,
	-- approval_comments
	approval_comments varchar2(100),
	PRIMARY KEY (doc_id, emp_no)
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


-- 직원
CREATE TABLE employees
(
	-- 사번
	emp_no number NOT NULL,
	-- 이름
	emp_name varchar2(100) NOT NULL,
	-- 비밀번호
	password varchar2(100) NOT NULL,
	-- 직위
	position varchar2(50),
	-- 입사일
	joindate date DEFAULT sysdate NOT NULL,
	-- 이메일
	email varchar2(200) NOT NULL,
	-- 휴대전화
	phone varchar2(50),
	-- 주소
	address varchar2(200),
	-- 부서ID
	dept_id number,
	PRIMARY KEY (emp_no)
);


-- 댓글
CREATE TABLE reply
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
CREATE TABLE reservation
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
	use_hour number DEFAULT 1,
	-- 사용용도
	description varchar2(500),
	PRIMARY KEY (reserv_id)
);


-- 회의실
CREATE TABLE room
(
	-- 회의실ID
	room_id number NOT NULL,
	-- 회의실이름
	room_name varchar2(200) NOT NULL,
	PRIMARY KEY (room_id)
);


-- TODO리스트
CREATE TABLE todolist
(
	-- 할일ID
	todo_id number NOT NULL,
	-- 사번ID
	emp_no number NOT NULL,
	-- 메모내용
	content varchar2(500) NOT NULL,
	-- 완료유무
	done char DEFAULT 'F' NOT NULL,
	PRIMARY KEY (todo_id)
);



/* Create Foreign Keys */

ALTER TABLE reply
	ADD FOREIGN KEY (board_id)
	REFERENCES board (board_id)
	ON DELETE CASCADE
;


ALTER TABLE department
	ADD FOREIGN KEY (upper_dept_id)
	REFERENCES department (dept_id)
	ON DELETE CASCADE
;


ALTER TABLE employees
	ADD FOREIGN KEY (dept_id)
	REFERENCES department (dept_id)
	ON DELETE CASCADE
;


ALTER TABLE DocumentDetail
	ADD FOREIGN KEY (doc_id)
	REFERENCES Documents (doc_id)
	ON DELETE CASCADE
;


ALTER TABLE board
	ADD FOREIGN KEY (emp_no)
	REFERENCES employees (emp_no)
	ON DELETE CASCADE
;


ALTER TABLE DocumentDetail
	ADD FOREIGN KEY (emp_no)
	REFERENCES employees (emp_no)
	ON DELETE CASCADE
;


ALTER TABLE Documents
	ADD FOREIGN KEY (emp_no)
	REFERENCES employees (emp_no)
	ON DELETE CASCADE
;


ALTER TABLE reply
	ADD FOREIGN KEY (emp_no)
	REFERENCES employees (emp_no)
	ON DELETE CASCADE
;


ALTER TABLE reservation
	ADD FOREIGN KEY (emp_no)
	REFERENCES employees (emp_no)
	ON DELETE CASCADE
;


ALTER TABLE todolist
	ADD FOREIGN KEY (emp_no)
	REFERENCES employees (emp_no)
	ON DELETE CASCADE
;


ALTER TABLE reservation
	ADD FOREIGN KEY (room_id)
	REFERENCES room (room_id)
	ON DELETE CASCADE
;



/* Comments */

COMMENT ON TABLE approvalform IS '결재폼';
COMMENT ON COLUMN approvalform.form_id IS '결재폼ID';
COMMENT ON COLUMN approvalform.form_name IS '이름';
COMMENT ON COLUMN approvalform.description IS '설명';
COMMENT ON COLUMN approvalform.form_contents IS '폼내용';
COMMENT ON TABLE board IS '게시판';
COMMENT ON COLUMN board.board_id IS '게시글ID';
COMMENT ON COLUMN board.emp_no IS '작성자ID';
COMMENT ON COLUMN board.title IS '제목';
COMMENT ON COLUMN board.board_contents IS '내용';
COMMENT ON COLUMN board.time IS '작성시간';
COMMENT ON COLUMN board.board_type IS '게시판타입 : 0: 공지사항
1: 사내게시판';
COMMENT ON TABLE department IS '부서';
COMMENT ON COLUMN department.dept_id IS '부서ID';
COMMENT ON COLUMN department.dept_name IS '부서명';
COMMENT ON COLUMN department.upper_dept_id IS '부모부서ID';
COMMENT ON TABLE DocumentDetail IS '결재상세정보';
COMMENT ON COLUMN DocumentDetail.doc_id IS '결재문서ID';
COMMENT ON COLUMN DocumentDetail.emp_no IS '결재자ID';
COMMENT ON COLUMN DocumentDetail.approval_order IS '결재순서';
COMMENT ON COLUMN DocumentDetail.approval_date IS '결재날짜';
COMMENT ON COLUMN DocumentDetail.status IS 'status : 대기 :WAIT
완료 :DONE
반려 :RETU
취하 :DROP';
COMMENT ON COLUMN DocumentDetail.approval_comments IS 'approval_comments';
COMMENT ON TABLE Documents IS '결재문서';
COMMENT ON COLUMN Documents.doc_id IS '결재문서ID';
COMMENT ON COLUMN Documents.emp_no IS '기안자ID';
COMMENT ON COLUMN Documents.doc_no IS '문서번호';
COMMENT ON COLUMN Documents.doc_title IS '제목';
COMMENT ON COLUMN Documents.doc_contents IS '내용';
COMMENT ON COLUMN Documents.reg_date IS '기안날짜';
COMMENT ON COLUMN Documents.done_date IS '결재완료날짜';
COMMENT ON COLUMN Documents.secure_level IS '보안등급';
COMMENT ON TABLE employees IS '직원';
COMMENT ON COLUMN employees.emp_no IS '사번';
COMMENT ON COLUMN employees.emp_name IS '이름';
COMMENT ON COLUMN employees.password IS '비밀번호';
COMMENT ON COLUMN employees.position IS '직위';
COMMENT ON COLUMN employees.joindate IS '입사일';
COMMENT ON COLUMN employees.email IS '이메일';
COMMENT ON COLUMN employees.phone IS '휴대전화';
COMMENT ON COLUMN employees.address IS '주소';
COMMENT ON COLUMN employees.dept_id IS '부서ID';
COMMENT ON TABLE reply IS '댓글';
COMMENT ON COLUMN reply.reply_id IS '댓글ID';
COMMENT ON COLUMN reply.rep_contents IS '댓글내용';
COMMENT ON COLUMN reply.time IS '시간';
COMMENT ON COLUMN reply.emp_no IS '작성자ID';
COMMENT ON COLUMN reply.board_id IS '게시글ID';
COMMENT ON TABLE reservation IS '예약';
COMMENT ON COLUMN reservation.reserv_id IS '예약ID';
COMMENT ON COLUMN reservation.room_id IS '회의실ID';
COMMENT ON COLUMN reservation.emp_no IS '등록자ID';
COMMENT ON COLUMN reservation.start_time IS '예약시작날짜';
COMMENT ON COLUMN reservation.use_hour IS '사용시간';
COMMENT ON COLUMN reservation.description IS '사용용도';
COMMENT ON TABLE room IS '회의실';
COMMENT ON COLUMN room.room_id IS '회의실ID';
COMMENT ON COLUMN room.room_name IS '회의실이름';
COMMENT ON TABLE todolist IS 'TODO리스트';
COMMENT ON COLUMN todolist.todo_id IS '할일ID';
COMMENT ON COLUMN todolist.emp_no IS '사번ID';
COMMENT ON COLUMN todolist.content IS '메모내용';
COMMENT ON COLUMN todolist.done IS '완료유무';



