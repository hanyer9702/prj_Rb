package com.rbproject.store.modules.member;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rbproject.store.common.constants.Constants;
import com.rbproject.store.common.util.UtilDateTime;




/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	public String makeQueryString(MemberVo vo) {
		String tmp =  "&thisPage=" + vo.getThisPage() 
					+ "&shOption=" + vo.getShOption() 
					+ "&shValue=" + vo.getShValue();
		return tmp;
	}
	
	public void getCode(Model model) throws Exception {
		model.addAttribute("codeGender", MemberServiceImpl.selectListCachedCode("2"));
		model.addAttribute("codeAgreePeriod", MemberServiceImpl.selectListCachedCode("3"));
		model.addAttribute("codeMarriageNy", MemberServiceImpl.selectListCachedCode("4"));
		model.addAttribute("codeEmailDomain", MemberServiceImpl.selectListCachedCode("6"));
		model.addAttribute("codeTelecom", MemberServiceImpl.selectListCachedCode("9"));
		model.addAttribute("codeSns", MemberServiceImpl.selectListCachedCode("11"));
		model.addAttribute("codeHobby", MemberServiceImpl.selectListCachedCode("12"));
		model.addAttribute("codeQuestion", MemberServiceImpl.selectListCachedCode("14"));
	}
	
	@RequestMapping(value = "/xdmin/include/top")
	public String top(Model model) throws Exception {

//		List<Member> list = service.selectList();
//		model.addAttribute("list", list);

		return "/xdmin/include/top";
	}
	
	@RequestMapping(value = "/xdmin/include/footer")
	public String footer(Model model) throws Exception {
				
		return "/xdmin/include/footer";
	}
	
	@RequestMapping(value = "/xdmin/member/memberList")
	public String memberList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		
		System.out.println("UtilDateTime.nowLocalDateTime(): " + UtilDateTime.nowLocalDateTime());
		System.out.println("UtilDateTime.nowDate(): " + UtilDateTime.nowDate());
		System.out.println("UtilDateTime.nowString(): " + UtilDateTime.nowString());
		
		vo.setShOptionDate(vo.getShOptionDate() == null ? 1 : vo.getShOptionDate());
//		vo.setShDateStart(vo.getShDateStart() == null ? UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL) : UtilDateTime.addStringTime(vo.getShDateStart()));
		vo.setShDateStart(vo.getShDateStart() == null ? UtilDateTime.addStringTime(UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL)) : UtilDateTime.addStringTime(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null ? UtilDateTime.nowString() : UtilDateTime.addStringTimeNight(vo.getShDateEnd()));
		vo.setIfmmDelNy(vo.getIfmmDelNy() == null ? "0" : vo.getIfmmDelNy()); 
		
		// count �����ð�
		
		int count = service.selectOneCount(vo);
				
		vo.setParamsPaging(count);
		
		// count�� 0�� �ƴϸ� list �������� �κ� ���� �� model ��ü�� ���
		if(count != 0) {
			List<Member> list = service.selectList(vo);
			model.addAttribute("list", list);
		} else {
			// by pass
		}
		
		return "/xdmin/member/memberList";
	}
	
	@RequestMapping("/member/excelDownload")
    public void excelDownload(MemberVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
		vo.setShOptionDate(vo.getShOptionDate() == null ? 1 : vo.getShOptionDate());
//		vo.setShDateStart(vo.getShDateStart() == null ? UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL) : UtilDateTime.addStringTime(vo.getShDateStart()));
		vo.setShDateStart(vo.getShDateStart() == null ? UtilDateTime.addStringTime(UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL)) : UtilDateTime.addStringTime(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null ? UtilDateTime.nowString() : UtilDateTime.addStringTimeNight(vo.getShDateEnd()));
		vo.setIfmmDelNy(vo.getIfmmDelNy() == null ? "0" : vo.getIfmmDelNy()); 
		

		vo.setParamsPaging(service.selectOneCount(vo));

		if (vo.getTotalRows() > 0) {
			List<Member> list = service.selectList(vo);
//			List<?> list = service.selectList(vo);

		
		
	//        Workbook wb = new HSSFWorkbook();
	        Workbook wb = new XSSFWorkbook();
	        Sheet sheet = wb.createSheet("첫번째 시트");
	        Row row = null;
	        Cell cell = null;
	        int rowNum = 0;
	
	        // Header
	        row = sheet.createRow(rowNum++);
	        cell = row.createCell(0);
	        cell.setCellValue("번호");
	        cell = row.createCell(1);
	        cell.setCellValue("이름");
	        cell = row.createCell(2);
	        cell.setCellValue("제목");
	
	        // Body
	        
	        for (int i=0; i<list.size(); i++) {
	            row = sheet.createRow(rowNum++);
	            cell = row.createCell(0);
	            cell.setCellValue(String.valueOf(list.get(i).getIfmmSeq()));
	            cell = row.createCell(1);
	            cell.setCellValue(list.get(i).getIfmmName());
	            cell = row.createCell(2);
	            cell.setCellValue(i+"_title");
	        }
	
	        // 컨텐츠 타입과 파일명 지정
	        httpServletResponse.setContentType("ms-vnd/excel");
	//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xlsx");
	
	        // Excel File Output
	        wb.write(httpServletResponse.getOutputStream());
	        wb.close();
		}
    }
	
	@RequestMapping(value = "memberOracleList")
	public String memberOracleList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception{
		
		List<Member> list = service.selectListOracle(vo);
		model.addAttribute("list", list);
		
		return "/xdmin/member/memberOracleList";
	}
	
	@RequestMapping(value = "/xdmin/member/memberView")
	public String memberView(@ModelAttribute("vo") MemberVo vo, Member dto, Model model) throws Exception {
		
		Member rt = service.selectOne(vo);
		List<Member> listHobby = service.selectHobby(dto);
		model.addAttribute("rt", rt);
		model.addAttribute("listHobby", listHobby);
				
		return "/xdmin/member/memberView";
	}
	
	@RequestMapping(value = "/xdmin/member/memberForm")
	public String memberForm(@ModelAttribute("vo") MemberVo vo, Member dto, Model model) throws Exception {
		
		List<Member> codeList = service.selectCode(dto);
		model.addAttribute("codeList", codeList);
		
		getCode(model);
		
		
		return "/xdmin/member/memberForm";
	}
	
	@RequestMapping(value = "/xdmin/member/memberInst")
	public String memberInst(@ModelAttribute("vo") MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
//		�Է� ����
		service.insert(dto);
		
		redirectAttributes.addAttribute("thisPage", vo.getThisPage());	//get
		redirectAttributes.addAttribute("shOption", vo.getShOption());	//get
		redirectAttributes.addAttribute("shValue", vo.getShValue());	//get
		redirectAttributes.addAttribute("rowNumToShow", vo.getRowNumToShow());	//get
		
		return "redirect:/xdmin/member/memberList";
	}
	
	@RequestMapping(value = "/xdmin/member/memberEdit")
	public String memberEdit(@ModelAttribute("vo") MemberVo vo, Member dto, Model model) throws Exception {
		
		Member rt = service.selectOne(vo);
		List<Member> listHobby = service.selectHobby(dto);
		
		model.addAttribute("rt", rt);
		model.addAttribute("listHobby", listHobby);
		
		getCode(model);
		
		return "/xdmin/member/memberEdit";
	}
	
	@RequestMapping(value = "/xdmin/member/memberUpdt")
	public String memberUpdt(@ModelAttribute("vo") MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(dto, vo);
		
		redirectAttributes.addAttribute("thisPage", vo.getThisPage());	//get
		redirectAttributes.addAttribute("shOption", vo.getShOption());	//get
		redirectAttributes.addAttribute("shValue", vo.getShValue());	//get
		redirectAttributes.addAttribute("rowNumToShow", vo.getRowNumToShow());	//get
		redirectAttributes.addAttribute("ifmmSeq", vo.getIfmmSeq());	//get
		
		return "redirect:/xdmin/member/memberView";
	}
	
	@ResponseBody
	@RequestMapping(value = "/IdCheckService")
	public String IdCheckService(MemberVo vo) throws Exception {
		
		int tmp = 0;
		List<Member> member = service.checkId(vo);
		
		if (!member.isEmpty()) {
			tmp = 0;
		} else {
			tmp = 1;
		}
		
		System.out.println(tmp);
		
		return tmp + "";
	}
	
	@RequestMapping(value = "/xdmin/member/memberUpdateDel")
	public String memberUpdateDel(@ModelAttribute("vo") MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.updateDelete(vo);
		
		redirectAttributes.addAttribute("thisPage", vo.getThisPage());	//get
		redirectAttributes.addAttribute("shOption", vo.getShOption());	//get
		redirectAttributes.addAttribute("shValue", vo.getShValue());	//get
		redirectAttributes.addAttribute("rowNumToShow", vo.getRowNumToShow());	//get
		redirectAttributes.addAttribute("ifmmSeq", vo.getIfmmSeq());	//get
		
		return "redirect:/xdmin/member/memberList";
	}
	
	@RequestMapping(value = "/xdmin/member/memberDelete")
	public String memberDelete(@ModelAttribute("vo") MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.delete(vo);
		
		redirectAttributes.addAttribute("thisPage", vo.getThisPage());	//get
		redirectAttributes.addAttribute("shOption", vo.getShOption());	//get
		redirectAttributes.addAttribute("shValue", vo.getShValue());	//get
		redirectAttributes.addAttribute("rowNumToShow", vo.getRowNumToShow());	//get
		redirectAttributes.addAttribute("ifmmSeq", vo.getIfmmSeq());	//get
		
		return "redirect:/xdmin/member/memberList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/PasswordCheck")
	public String passwordCheck(MemberVo vo) throws Exception {
		System.out.println(vo.getIfmmPassword());
		int tmp = 0;
		Member member = service.checkPassword(vo);
		
		if (!member.getIfmmPassword().equals(vo.getIfmmPassword())) {
			tmp = 0;
		} else {
			tmp = 1;
		}
		
		System.out.println(tmp);
		
		return tmp + "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updtPassword")
	public String updtPassword(@ModelAttribute("vo") MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
				
		service.updatePassword(vo);
		
		return "1";
	}
	
	@RequestMapping(value = "/xdmin/member/goMemberEdit")
	public String goMemberEdit(@ModelAttribute("vo") MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
				
		redirectAttributes.addAttribute("thisPage", vo.getThisPage());	//get
		redirectAttributes.addAttribute("shOption", vo.getShOption());	//get
		redirectAttributes.addAttribute("shValue", vo.getShValue());	//get
		redirectAttributes.addAttribute("rowNumToShow", vo.getRowNumToShow());	//get
		redirectAttributes.addAttribute("ifmmSeq", vo.getIfmmSeq());	//get
		
		return "redirect:/xdmin/member/memberEdit" + vo.getIfmmSeq();
	}
	
	@RequestMapping(value = "/xdmin/member/memberMultiUele")
	public String memberMultiUele(@ModelAttribute("vo") MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.multiUele(vo);
		
		redirectAttributes.addAttribute("thisPage", vo.getThisPage());	//get
		redirectAttributes.addAttribute("shOption", vo.getShOption());	//get
		redirectAttributes.addAttribute("shValue", vo.getShValue());	//get
		redirectAttributes.addAttribute("rowNumToShow", vo.getRowNumToShow());	//get
		redirectAttributes.addAttribute("ifmmSeq", vo.getIfmmSeq());	//get
		
		return "redirect:/xdmin/member/memberList";
	}
	
	@RequestMapping(value = "/xdmin/member/memberMultiDele")
	public String memberMultiDele(@ModelAttribute("vo") MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.multiDele(vo);
		
		redirectAttributes.addAttribute("thisPage", vo.getThisPage());	//get
		redirectAttributes.addAttribute("shOption", vo.getShOption());	//get
		redirectAttributes.addAttribute("shValue", vo.getShValue());	//get
		redirectAttributes.addAttribute("rowNumToShow", vo.getRowNumToShow());	//get
		redirectAttributes.addAttribute("ifmmSeq", vo.getIfmmSeq());	//get
		
		return "redirect:/xdmin/member/memberList";
	}
	
	@RequestMapping(value = "/member/loginForm")
	public String loginForm(Model model) throws Exception {
				
		return "/xdmin/login/loginForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/loginProc")
	public Map<String, Object> loginProc(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Member rtMember = service.selectOneLogin(dto);

		if(rtMember != null) {
//			rtMember = service.selectOneLogin(dto);
			
			httpSession.setAttribute("sessSeq", rtMember.getIfmmSeq());
			httpSession.setAttribute("sessId", rtMember.getIfmmId());
			httpSession.setAttribute("sessName", rtMember.getIfmmName()); 
			
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/logoutProc")
	public Map<String, Object> logoutProc(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		httpSession.invalidate();
		
		returnMap.put("rt", "success");
		
		return returnMap;
	}
	
	
//	@RequestMapping(value = "/xdmin/member/updtPassword")
//	public String updtPassword(@ModelAttribute("vo") MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
//		
//		
//		System.out.println("updtPassword--------------------------");
//		System.out.println("vo.getIfmmSeq() : " + vo.getIfmmSeq());
//		System.out.println("vo.getIfmmPassword() : " + vo.getIfmmPassword());
//		System.out.println("vo.thisPage() : " + vo.getThisPage());
//		System.out.println("vo.rowNumToShow() : " + vo.getRowNumToShow());
//		System.out.println("vo.gmmPassword() : " + vo.getIfmmPassword());
//		
//		service.updatePassword(vo);
//		
//		redirectAttributes.addAttribute("thisPage", vo.getThisPage());	//get
//		redirectAttributes.addAttribute("shOption", vo.getShOption());	//get
//		redirectAttributes.addAttribute("shValue", vo.getShValue());	//get
//		redirectAttributes.addAttribute("rowNumToShow", vo.getRowNumToShow());	//get
//		redirectAttributes.addAttribute("ifmmSeq", vo.getIfmmSeq());	//get
//		
//		return "redirect:/xdmin/member/memberEdit";
//	}
}
