package com.auuid.article.dao;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.auuid.article.domain.Article;
import com.auuid.article.domain.Comment;
import com.auuid.base.dao.BaseDao;

@Repository
public class ArticleDao extends BaseDao<Article>{
	public void save (Comment comment) {
		Session session = sessionFactory.getCurrentSession();
		session.save(comment);
	}
	
}
