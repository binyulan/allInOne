package com.auuid.article.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.auuid.article.domain.Article;
import com.auuid.article.domain.Comment;

@Repository
public class ArticleDao<T> {

	@Resource
	private SessionFactory sessionFactory;
	
	public void save (Article article) {
		Session session = sessionFactory.getCurrentSession();
		session.save(article);
	}
	
	public void save (Comment comment) {
		Session session = sessionFactory.getCurrentSession();
		session.save(comment);
	}
	
	public List<Article> getArticles () {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Article");
		return query.list();
	}
	
	public Article getArticle(Long id) {
		Session session = sessionFactory.getCurrentSession();
		return (Article) session.get(Article.class, id);
	}
}
