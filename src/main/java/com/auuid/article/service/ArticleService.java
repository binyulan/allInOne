package com.auuid.article.service;

import java.util.List;

import com.auuid.article.domain.Article;

public interface ArticleService {
	
	public List<Article> getArticles();
	
	public Article getArticle(Long id);
	
	public void save(Article article);
}
