package com.weaving.biz.doc.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.weaving.biz.cal.CalTypeEnum;
import com.weaving.biz.common.Paging;
import com.weaving.biz.common.SessionInfo;
import com.weaving.biz.dept.DeptVO;
import com.weaving.biz.doc.DocApprovalVO;
import com.weaving.biz.doc.DocBaseVO;
import com.weaving.biz.doc.DocDeleteVO;
import com.weaving.biz.doc.DocDetailVO;
import com.weaving.biz.doc.DocHistoryVO;
import com.weaving.biz.doc.DocService;
import com.weaving.biz.doc.DocUpdateVO;
import com.weaving.biz.doc.DocInsertVO;
import com.weaving.biz.doc.DocListType;
import com.weaving.biz.docForm.DocFormService;
import com.weaving.biz.docForm.DocFormVO;
import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;
import com.weaving.biz.reserv.ReservVO;

import aj.org.objectweb.asm.TypeReference;

@Controller
public class DocController {
	@Autowired
	DocService docService;
	
	@Autowired
	DocFormService docFormService;

	@Autowired
	Empservice empService;
	//검색메뉴를 위해서 BoardVO를 매개변수를 넣음
	//@RequestParam에서 변수가 searchCondition이 아닐 경우 value로 searchCondition로 지정해줘야한다
	//cond로 변수명을 변경할 경우 value로 value로 searchCondition로 지정해줘야한다
	//@RequestMapping("/docList")
	//public String docList(Model model) {
	/*
	@RequestMapping("/docList")
	public String docList(Model model, HttpSession session) {
		System.out.println(session.getAttribute("emp"));
	
		int position = Integer.parseInt((String)session.getAttribute("position"));
		System.out.println(position);
		String lv = "C";
		if (position > 2 ) {
			lv = "S";
		} else if (position == 2 ) {
			lv = "A";
		} else if (position == 1) {
			lv = "B";
		} else {
			lv = "C";
		}

		DocInsertVO vo = new DocInsertVO();
		//vo.setSecureLevel(lv);

		//model.addAttribute("list", docService.getDocList(vo));
		return "approval/docList";
	}
	*/
	@RequestMapping("/docInsertView")
	//public String docViewInsert(@PathVariable String empName, @PathVariable int position, Model model) {
	public String docInsertView(Model model) {
		EmpVO evo = new EmpVO(); 
		model.addAttribute("empList", empService.getEmpList(evo));
		model.addAttribute("list", docFormService.getDocFormList());
		return "approval/docInsert";
	}

	@RequestMapping(value="/docInsert", method=RequestMethod.POST)
	public String docInsert(DocInsertVO vo, HttpServletRequest request) {

		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date date = new Date();
		String curTime = f.format(date);
		String[] d  = curTime.split(" ");
		String[] dateArr = d[0].split("-");
		
		String docType = request.getParameter("docType") +"-" + dateArr[0] + dateArr[1] + dateArr[2]+"-";
		String jsonString = request.getParameter("approvalList");
		
		vo.setDocType(docType);
		vo.setRegDate(curTime);

		docService.insertDoc(vo);

		ObjectMapper mapper = new ObjectMapper();
		int docId = 0;
		String writerStatus = "";
		try {
			List<DocInsertVO> docObj = Arrays.asList(mapper.readValue(jsonString, DocInsertVO[].class));
			
			boolean b = true;
			for (DocInsertVO v : docObj) {
				
				if (b) {
					writerStatus = v.getStatus();
					v.setApprovalDate(curTime);	
					b = false;
				} else {
					v.setStatus("WAIT");	
				}
				v.setDocType(vo.getDocType());
				System.out.println("insertttttttttttttttttttttttttt");
				System.out.println(vo.getDocTypeSeq());
				System.out.println("insertttttttttttttttttttttttttt");
				v.setDocTypeSeq(vo.getDocTypeSeq());
						
				docService.insertDocDetail(v);
				docId = v.getDocId();
			}		
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DocHistoryVO hvo = new DocHistoryVO();
		hvo.setDocId(docId);
		hvo.setEmpNo(vo.getWriterEmpNo());
		hvo.setCurStatus(writerStatus);
		hvo.setChangeDate(curTime);

		docService.insertDocHistory(hvo);
		
		return "redirect:docList?listType=ING";
	}
	
	@RequestMapping(value="/docDetailView", method= RequestMethod.GET)	
	public String docDetailView(Model model, HttpSession session, HttpServletRequest request) {
		int empNo = SessionInfo.getInfo(session, "empNo");
		DocDetailVO vo = new DocDetailVO();
		
		vo.setEmpNo(empNo);
		vo.setDocId(Integer.parseInt(request.getParameter("docId")));

		model.addAttribute("docListType",(String)request.getParameter("listType"));
		model.addAttribute("docInfo",docService.getDocument(vo));
		model.addAttribute("docDetailInfo",docService.getDocDetail(vo));
		return "approval/docDetailView";
	}
	
	@RequestMapping(value="/updateDone"
			, headers = {"Content-type=application/json"}
			, method= RequestMethod.PUT
	)
	@ResponseBody
	public DocApprovalVO updateDone(@RequestBody DocApprovalVO vo, Model model) {
		System.out.println("******************************");
		System.out.println(vo);
		System.out.println(vo.getDocId());
		System.out.println("******************************");
		docService.updateApprovalDoc(vo);
		return vo;
	}

	@RequestMapping(value="/updateReturn"
			, headers = {"Content-type=application/json"}
			, method= RequestMethod.PUT
	)
	@ResponseBody
	public DocApprovalVO updateReturn(@RequestBody DocApprovalVO vo, Model model) {
		System.out.println("******************************R");
		System.out.println(vo);
		System.out.println(vo.getDocId());
		System.out.println(vo.getWriterEmpNo());
		System.out.println("******************************R");
		docService.updateReturnEmpNo(vo);
		docService.updateReturnDoc(vo);
		docService.updateApprovalNullDate(vo);
		return vo;
	}
	
	@RequestMapping("/docUpdateView")
	public String docUpdateView(Model model, HttpSession session, HttpServletRequest request) {
		int empNo = SessionInfo.getInfo(session, "empNo");
		DocDetailVO vo = new DocDetailVO();
		
		vo.setEmpNo(empNo);
		vo.setDocId(Integer.parseInt(request.getParameter("docId")));
 
		EmpVO evo = new EmpVO(); 
		
		/*
		System.out.println("=====================================");
		System.out.println(evo);
		System.out.println(empService.getEmpList(evo));
		System.out.println("=====================================d");
		*/
		model.addAttribute("empList", empService.getEmpList(evo));
		model.addAttribute("list", docFormService.getDocFormList());
		
		model.addAttribute("docListType", (String)request.getParameter("listType"));
		model.addAttribute("docInfo", docService.getDocument(vo));
		model.addAttribute("docDetailInfo", docService.getDocDetail(vo));
		
		return "approval/docUpdate";
	}
	
	@RequestMapping(value="/docUpdate", method=RequestMethod.POST)
	public String docUpdate(DocUpdateVO vo, HttpServletRequest request) {
		System.out.println("=======#######==============");
		System.out.println(vo);
		System.out.println(vo.getDocNo());
		System.out.println("=======#######==============");
		
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date date = new Date();
		String curTime = f.format(date);
		String[] d  = curTime.split(" ");
		String[] dateArr = d[0].split("-");
		
		//'문서타입-년월일-'
		String docType = request.getParameter("docType") +"-" + dateArr[0] + dateArr[1] + dateArr[2]+"-";
		
		vo.setDocType(docType);
		docService.updateDoc(vo);

		DocDeleteVO delVo = new DocDeleteVO();
		delVo.setDocId(vo.getDocId());
		//실행잘됨
		docService.deleteDocDetail(delVo);
		
		String jsonString = request.getParameter("approvalList");
		System.out.println("=======^^^^^^^==============");
		System.out.println(jsonString);
		System.out.println("=======^^^^^^^==============");
		
		ObjectMapper mapper = new ObjectMapper();
		String writerStatus = "";
		try {
			List<DocInsertVO> docObj = Arrays.asList(mapper.readValue(jsonString, DocInsertVO[].class));
			
			boolean b = true;
			for (DocInsertVO v : docObj) {
				
				if (b) {
					v.setStatus("DONE");
					v.setApprovalDate(curTime);	
					writerStatus = v.getStatus();	
					b = false;
				} else {
					v.setStatus("WAIT");	
				}
				v.setDocId(vo.getDocId());
				System.out.println("llllllllllllllllllllllllllllllllll");
				System.out.println(v);
				System.out.println("llllllllllllllllllllllllllllllllll");
				docService.insertDocDetail(v);
				//docId = v.getDocId();
			}		
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "redirect:docList?listType=ING";
	}
	
	@RequestMapping(value="/docTemp", method=RequestMethod.POST)
	public String docTemp(DocUpdateVO vo, HttpServletRequest request) {
		System.out.println("=======#######==============");
		System.out.println(vo);
		System.out.println(vo.getDocNo());
		System.out.println("=======#######==============");

		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date date = new Date();
		String curTime = f.format(date);
		String[] d  = curTime.split(" ");
		String[] dateArr = d[0].split("-");
		
		//'문서타입-년월일-'
		String docType = request.getParameter("docType") +"-" + dateArr[0] + dateArr[1] + dateArr[2]+"-";
		System.out.println(docType);

		vo.setDocType(docType);
		vo.setTempYn(1);
		docService.updateDoc(vo);

		DocDeleteVO delVo = new DocDeleteVO();
		delVo.setDocId(vo.getDocId());
		//실행잘됨
		docService.deleteDocDetail(delVo);
		
		String jsonString = request.getParameter("approvalList");
		System.out.println("=======^^^^^^^==============");
		System.out.println(jsonString);
		System.out.println("=======^^^^^^^==============");

		ObjectMapper mapper = new ObjectMapper();
		String writerStatus = "";
		try {
			List<DocInsertVO> docObj = Arrays.asList(mapper.readValue(jsonString, DocInsertVO[].class));
			
			for (DocInsertVO v : docObj) {
				
				v.setDocId(vo.getDocId());
				v.setStatus("WAIT");
				System.out.println("llllllllllllllllllllllllllllllllll");
				System.out.println(v);
				System.out.println("llllllllllllllllllllllllllllllllll");
				docService.insertDocDetail(v);
				//docId = v.getDocId();
			}		
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "redirect:docList?listType=TEMP";
		//return null;
	}
}
