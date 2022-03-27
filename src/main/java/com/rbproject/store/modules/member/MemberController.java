package com.rbproject.store.modules.member;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
		
		// count 가져올것
		
		int count = service.selectOneCount(vo);
				
		vo.setParamsPaging(count);
		
		// count가 0이 아니면 list 가져오는 부분 수행 후 model 개체에 담기
		if(count != 0) {
			List<Member> list = service.selectList(vo);
			model.addAttribute("list", list);
		} else {
			// by pass
		}
		
		return "/xdmin/member/memberList";
	}
	
	@RequestMapping(value = "/xdmin/member/memberView")
	public String memberView(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		
		Member rt = service.selectOne(vo);
		model.addAttribute("rt", rt);
				
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
		
//		입력 실행
		service.insert(dto);
		
		redirectAttributes.addAttribute("thisPage", vo.getThisPage());	//get
		redirectAttributes.addAttribute("shOption", vo.getShOption());	//get
		redirectAttributes.addAttribute("shValue", vo.getShValue());	//get
		redirectAttributes.addAttribute("rowNumToShow", vo.getRowNumToShow());	//get
		
		return "redirect:/xdmin/member/memberList";
	}
	
	@RequestMapping(value = "/xdmin/member/memberEdit")
	public String memberEdit(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		
		Member rt = service.selectOne(vo);
		model.addAttribute("rt", rt);
		
		getCode(model);
		
		return "/xdmin/member/memberEdit";
	}
	
	@RequestMapping(value = "/xdmin/member/memberUpdt")
	public String memberUpdt(@ModelAttribute("vo") MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(dto);
		
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
