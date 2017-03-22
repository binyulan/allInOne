package com.auuid.article.service;

import java.util.List;

import com.auuid.article.domain.Article;
import com.auuid.article.domain.Comment;

public interface ArticleService {
	
	public List<Article> getArticles();
	
	public Article getArticle(Long id);
	
	public void save(Article article);
	
	public void save(Comment comment);
}
