package com.auuid.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	@Autowired private IndexService indexService;
	
	@RequestMapping("/index")
	public ModelAndView getIndexDto() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("indexDto", indexService.getIndexDto());
		mv.setViewName("index");
		return mv;
	}
}
