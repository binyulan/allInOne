package com.auuid.index;

import java.util.List;

import com.auuid.article.domain.Article;
import com.auuid.article.domain.ArticleType;

public class IndexDto {
	private List<ArticleType> articleTypes;
	private List<Article> articles;
	public List<ArticleType> getArticleTypes() {
		return articleTypes;
	}
	public void setArticleTypes(List<ArticleType> articleTypes) {
		this.articleTypes = articleTypes;
	}
	public List<Article> getArticles() {
		return articles;
	}
	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
}
