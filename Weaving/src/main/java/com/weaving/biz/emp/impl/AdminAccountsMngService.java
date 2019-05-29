package com.weaving.biz.emp.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.weaving.biz.emp.EmpVO;
import com.weaving.biz.emp.Empservice;

@Service
public class AdminAccountsMngService {

	@Inject
	Empservice empService;

	public List<EmpVO> xlsExcelReader(MultipartHttpServletRequest req) {
// 반환할 객체를 생성
		List<EmpVO> list = new ArrayList<EmpVO>();

		MultipartFile file = req.getFile("excel");
		HSSFWorkbook workbook = null;

		try {
// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
			workbook = new HSSFWorkbook(file.getInputStream());

// 탐색에 사용할 Sheet, Row, Cell 객체
			HSSFSheet curSheet;
			HSSFRow curRow;
			HSSFCell curCell;
			EmpVO vo;

// Sheet 탐색 for문
			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
// 현재 sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
// row 탐색 for문
				for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
// row 0은 헤더정보이기 때문에 무시
					if (rowIndex != 0) {
						curRow = curSheet.getRow(rowIndex);
						vo = new EmpVO();
						String value;

// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
						if (curRow.getCell(0) != null) {
							if (!"".equals(curRow.getCell(0).getStringCellValue())) {
// cell 탐색 for문
								for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
									curCell = curRow.getCell(cellIndex);

									if (true) {
										value = "";
// cell 스타일이 다르더라도 String으로 반환 받음
										switch (curCell.getCellType()) {
										case HSSFCell.CELL_TYPE_FORMULA:
											value = curCell.getCellFormula();
											break;
										case HSSFCell.CELL_TYPE_NUMERIC:
											value = curCell.getNumericCellValue() + "";
											break;
										case HSSFCell.CELL_TYPE_STRING:
											value = curCell.getStringCellValue() + "";
											break;
										case HSSFCell.CELL_TYPE_BLANK:
											value = curCell.getBooleanCellValue() + "";
											break;
										case HSSFCell.CELL_TYPE_ERROR:
											value = curCell.getErrorCellValue() + "";
											break;
										default:
											value = new String();
											break;
										} // end switch

// 현재 colum index에 따라서 vo입력
										switch (cellIndex) {
										case 0: // 이름
											vo.setEmpName(value);
											break;
										case 1: // 나이
											vo.setPassword(value);
											break;
										case 2: // 이메일
											vo.setJoindate1(value);
											break;
										case 3: // 이메일
											vo.setEmail(value);
											break;
										case 4: // 이메일
											vo.setGmailAppKey(value);
											break;
										default:
											break;
										}
									} // end if
								} // end for
// cell 탐색 이후 vo 추가
								list.add(vo);
							} // end
						} // end if
					}

				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

// 디비에 insert
		empService.insertExcelTest(list);
		return list;
	}

	/**
	 * <PRE>
	* 1. MethodName	: xlsxExcelReader
	* 2. ClassName	: AdminAccountsMngService
	* 3. Commnet	: XLLX파일을 분석하여 List<ExcelTestVO>객체로 반환
	* 4. 작성자	: dukking
	* 5. 작성일	: 2016. 8. 11. 오후 2:45:48
	 * </PRE>
	 *
	 * @return List<ExcelTestVO>
	 * @param req
	 * @return
	 */
	public List<EmpVO> xlsxExcelReader(MultipartHttpServletRequest req) {
// 반환할 객체를 생성
		List<EmpVO> list = new ArrayList<EmpVO>();

		MultipartFile file = req.getFile("excel");
		XSSFWorkbook workbook = null;

		try {
// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
			workbook = new XSSFWorkbook(file.getInputStream());

// 탐색에 사용할 Sheet, Row, Cell 객체
			XSSFSheet curSheet;
			XSSFRow curRow;
			XSSFCell curCell;
			EmpVO vo;

// Sheet 탐색 for문
			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
// 현재 sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
// row 탐색 for문
				for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
// row 0은 헤더정보이기 때문에 무시
					if (rowIndex != 0) {
						curRow = curSheet.getRow(rowIndex);
						vo = new EmpVO();
						String value;

// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
						if (curRow.getCell(0) != null) {
							if (!"".equals(curRow.getCell(0).getStringCellValue())) {
// cell 탐색 for문
								for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
									curCell = curRow.getCell(cellIndex);

									if (true) {
										value = "";
// cell 스타일이 다르더라도 String으로 반환 받음
										switch (curCell.getCellType()) {
										case HSSFCell.CELL_TYPE_FORMULA:
											value = curCell.getCellFormula();
											break;
										case HSSFCell.CELL_TYPE_NUMERIC:
											value = curCell.getNumericCellValue() + "";
											break;
										case HSSFCell.CELL_TYPE_STRING:
											value = curCell.getStringCellValue() + "";
											break;
										case HSSFCell.CELL_TYPE_BLANK:
											value = curCell.getBooleanCellValue() + "";
											break;
										case HSSFCell.CELL_TYPE_ERROR:
											value = curCell.getErrorCellValue() + "";
											break;
										default:
											value = new String();
											break;
										} // end switch

// 현재 colum index에 따라서 vo입력
										switch (cellIndex) {
										case 0: // 이름
											vo.setEmpName(value);
											break;
										case 1: // 나이
											vo.setPassword(value);
											break;
										case 2: // 이메일
											vo.setJoindate1(value);
											break;
										case 3: // 이메일
											vo.setEmail(value);
											break;
										case 4: // 이메일
											vo.setGmailAppKey(value);
											break;
										default:
											break;
										}
									} // end if
								} // end for
// cell 탐색 이후 vo 추가
								list.add(vo);
							} // end
						} // end if
					}

				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

// 디비에 insert
		empService.insertExcelTest(list);
		return list;
	}

}