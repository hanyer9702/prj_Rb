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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
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
	public String memberList(MemberVo vo, Model model) throws Exception {
		
		List<Member> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "/xdmin/member/memberList";
	}
	
	@RequestMapping(value = "/xdmin/member/memberView")
	public String memberView(MemberVo vo, Model model) throws Exception {
		
		Member rt = service.selectOne(vo);
		model.addAttribute("rt", rt);
		
		System.out.println("view");
		
		return "/xdmin/member/memberView";
	}
	
}