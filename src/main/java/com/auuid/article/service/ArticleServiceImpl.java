package com.auuid.article.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.auuid.article.dao.ArticleDao;
import com.auuid.article.domain.Article;
import com.auuid.article.domain.ArticleType;
import com.auuid.article.domain.Comment;

@Service
public class ArticleServiceImpl implements ArticleService{

	@Resource
	private ArticleDao articleDao;
	
	@Transactional
	public List<Article> getArticles() {
		return articleDao.getArticles();
	}

	@Transactional
	public Article getArticle(Long id) {
		return articleDao.getArticle(id);
	}

	@Transactional
	public void save(Article article) {
		article.setPostDate(new Date());
		article.setArticleType(ArticleType.LINUX);
		articleDao.save(article);;
	}

	@Transactional
	public void save(Comment comment) {
		Article article = articleDao.getArticle(comment.getArticleId());
		comment.setPostDate(new Date());
		article.getComments().add(comment);
		articleDao.save(comment);
		
	}

}
