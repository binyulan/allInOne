package com.auuid.security;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.auuid.base.dao.BaseDao;

@Repository
public class UserDao extends BaseDao<User>{

	public User getByUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where username=:username");
		query.setParameter("username", username);
		return (User) query.uniqueResult();
	}
}
