package com.rbproject.store.modules.index;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping(value = "/index/indexView")
	public String indexView(Model model) throws Exception {
				
		return "/xdmin/index/indexView";
	}
}
