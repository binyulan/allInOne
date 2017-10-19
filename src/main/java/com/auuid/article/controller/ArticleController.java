package com.auuid.article.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.auuid.article.domain.Article;
import com.auuid.article.domain.Comment;
import com.auuid.article.service.ArticleService;

@Controller
public class ArticleController {

	@Resource
	private ArticleService articleService;
	
	@RequestMapping("/article/{id}")
	public ModelAndView getArticle(@PathVariable("id") Long id) {
		Article article = articleService.getArticle(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("article", article);
		mv.setViewName("article/article");
		return mv;
	}
	
	@RequestMapping(value="/article/comment", method=RequestMethod.POST)
	public @ResponseBody void saveComment(Comment comment) {
		articleService.save(comment);
	}
	
	//@RequestMapping(value="/{path}")
	public ModelAndView redirectTo(@PathVariable("path") String path) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName(path);
		return mv;
	}
}
