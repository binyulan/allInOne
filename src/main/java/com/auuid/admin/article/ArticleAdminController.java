package com.auuid.admin.article;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.auuid.article.domain.Article;
import com.auuid.article.service.ArticleService;

@RequestMapping("admin")
@Controller
public class ArticleAdminController {

	@Resource
	private ArticleService articleService;
	/**
	 * 请求地址 article， GET方式， 必须包含username，而且age不等于10
	 * Host是www.auuid.com
	 * ?  匹配一个字符
	 * *  匹配路径任意字符
	 * ** 匹配多层路径
	 * @param id 使用@PathVariable获取
	 * @return
	 * @throws SQLException 
	 */
	@RequestMapping(value="article/*/aa/x?x/**/zz/{id}",
			method=RequestMethod.GET,
			params={"username", "age!=10"},
			headers={"Host=localhost:8081"})
	public ModelAndView getArticle(@PathVariable("id")Long id) throws SQLException {
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "Hello World!");
		mv.setViewName("admin/article");
		Article article = new Article();
		article.setTitle("title");
		article.setContent("content");
		articleService.save(article);
		return mv;
	}
	
	@RequestMapping(value="article", method=RequestMethod.POST)
	public void saveArticle(Article article) {
		articleService.save(article);
	}
	
	@RequestMapping(value="addArticle", method=RequestMethod.GET)
	public String addArticle() {
		return "admin/article";
	}
}
