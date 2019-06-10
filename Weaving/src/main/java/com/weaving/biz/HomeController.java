package com.weaving.biz;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.weaving.biz.board.BoardService;
import com.weaving.biz.board.BoardVO;
import com.weaving.biz.cal.CalService;
import com.weaving.biz.cal.CalTypeEnum;
import com.weaving.biz.cal.CalVO;
import com.weaving.biz.common.Paging;
import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.doc.DocListService;
import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;
import com.weaving.biz.reserv.ReservService;
import com.weaving.biz.todo.ToDoService;
import com.weaving.biz.todo.ToDoVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	Empservice service;
	@Autowired
	DocListService docListService;
	@Autowired
	ReadMailCheckService mailservice;
	@Autowired
	BoardService boardService;
	@Autowired
	CalService calservice;
	@Autowired
	ReservService reserveService;
	@Autowired
	ToDoService todoService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String home(Locale locale, Model model,  HttpSession session) {
		
		EmpVO vo = SessionInfo.getInfo(session, "emp");
		//결재 대기중인 문서 카운트
		model.addAttribute("count", docListService.getWaitDocList(vo.getEmpNo()).toArray().length);
		//읽지 않은 메일 카운트
		model.addAttribute("countMail", mailservice.getUnReadMailCheck(vo.getEmpNo()));
		//반려된 문서 카운트
		model.addAttribute("returndoc", docListService.getReturnDocList(vo.getEmpNo()).toArray().length);
		
		
		Paging paging = new Paging();
		paging.setPageUnit(5);
		
		// 보드
		BoardVO boardVo = new BoardVO();
		// 공지사항
		boardVo.setBoardType("0");		
		boardVo.setFirst(paging.getFirst());
		boardVo.setLast(paging.getLast());		
		//전체건수
		paging.setTotalPageCount(boardService.getBoardListTotalCount(boardVo));
		List<BoardVO> list = boardService.getBoardListPaging(boardVo);		
		model.addAttribute("boardList", list);
		
		
		// 게시판
		boardVo.setBoardType("1");
		boardVo.setFirst(paging.getFirst());
		boardVo.setLast(paging.getLast());
		// 전체건수
		paging.setTotalPageCount(boardService.getBoardListTotalCount(boardVo));
		List<BoardVO> list1 = boardService.getBoardListPaging(boardVo);
		model.addAttribute("boardList1", list1);
		
		//개인일정
		CalVO calVo = new CalVO();
		calVo.setCalType(CalTypeEnum.ALL);
		List<CalVO> callist = calservice.getCalList(calVo);
		model.addAttribute("usercal", callist);

		//todolist
		List<ToDoVO> list2 = todoService.getTodoList(vo.getEmpNo());
		model.addAttribute("todolist", list2);
		
		return "home";
	}

	@RequestMapping(value = "/adminHome", method = RequestMethod.GET)
	public String adminHome(Locale locale, Model model, HttpServletResponse response, HttpSession session)
			throws IOException {
		
		EmpVO emp = SessionInfo.getInfo(session, "emp");
		
		if (emp != null && emp.getAdminYn()) {
			
			model.addAttribute("totalIngCount", docListService.getTotalIngCount());
			model.addAttribute("totalReturnCount", docListService.getTotalReturnCount());
			model.addAttribute("totalDoneCount", docListService.getTotalDoneCount());
			model.addAttribute("totalTempCount", docListService.getTotalTempCount());
			model.addAttribute("reserveState", reserveService.getResultState());
			
			return "admin/adminHome";
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('Admin 권한이 없습니다');");
			out.print("history.go(-1);");
			out.print("</script>");
			return "empty/login";
		}
	}

	// TODO : 공용으로 사용하도록 적용 필요
	// 엑셀출력
	@RequestMapping("/empExcelView.do")
	public ModelAndView excelView(HttpServletResponse response) throws IOException {
		
		List<EmpVO> list = service.getExEmpList(null);
		List<Map<String, Object>> temp = new ArrayList<Map<String,Object>>();
		
		ObjectMapper oMapper = new ObjectMapper();

		for(EmpVO data : list) {
			Map<String, Object> map = oMapper.convertValue(data, Map.class);
			temp.add(map);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String[] header = { "empNo"
				, "empName"
				, "position"
				,"joinDate"
				,"email"
				,"phone"
				,"address"
				,"deptId"
				,"deletedYn"
				,"gmailAppKey"};
		map.put("headers", header);
		map.put("filename", "excel_dept");
		map.put("datas", temp);
		return new ModelAndView("commonExcelView", map);
	}
	
	@RequestMapping("ui")
	public String ui() {
		return "sample/uiGuide";
	}
	
	@RequestMapping("chat")
	public String socketTest() {
		return "sample/chat";
	}
	
}
