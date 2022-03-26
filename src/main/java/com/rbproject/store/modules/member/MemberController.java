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
		
		
		
		return "/xdmin/member/memberForm";
	}
	
	@RequestMapping(value = "/xdmin/member/memberInst")
	public String memberInst(@ModelAttribute("vo") MemberVo vo, Member dto) throws Exception {
		
//		입력 실행
		service.insert(dto);
		
		return "redirect:/xdmin/member/memberList" + makeQueryString(vo);
	}
	
	@RequestMapping(value = "/xdmin/member/memberEdit")
	public String memberEdit(MemberVo vo, Model model) throws Exception {
		
		Member rt = service.selectOne(vo);
		model.addAttribute("rt", rt);
		
		return "/xdmin/member/memberEdit";
	}
	
	@RequestMapping(value = "/xdmin/member/memberUpdt")
	public String memberUpdt(@ModelAttribute("vo") MemberVo vo, Member dto) throws Exception {
		
		service.update(dto);
		
		return "redirect:/xdmin/member/memberEdit" + makeQueryString(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/IdCheckService")
	public String IdCheckService(MemberVo vo) throws Exception {
		
		String result = "";
		
		result = service.checkId(vo);
		
		System.out.println(result);
		
		return result;
	}
	
	
}
