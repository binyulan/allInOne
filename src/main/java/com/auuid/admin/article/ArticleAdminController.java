package com.auuid.admin.article;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ArticleAdminController {

	@RequestMapping("admin/article")
	public ModelAndView getArticle(Long id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "Hello World!");
		mv.setViewName("admin/article");
		return mv;
	}
}
