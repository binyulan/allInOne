package com.auuid.security;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.auuid.base.dao.BaseDao;

@Repository
public class UserDao extends BaseDao<User>{

	public User findUserByUsernamePassword(String username, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where username=:username and password=:password");
		query.setParameter("username", username);
		query.setParameter("password", password);
		return (User) query.uniqueResult();
	}
}
