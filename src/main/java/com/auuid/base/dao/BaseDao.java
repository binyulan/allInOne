package com.auuid.base.dao;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public abstract class BaseDao<T> {

	@Resource
	protected SessionFactory sessionFactory;
	
	public Class<T> getClazz() {
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		return (Class<T>) pt.getActualTypeArguments()[0];
	}
	
	public void save (T t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}
	
	public List<T> getAll () {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from " + getClazz().getSimpleName());
		return query.list();
	}
	
	public T getById(Long id) {
		Session session = sessionFactory.getCurrentSession();
		return (T) session.get(getClazz(), id);
	}
	
	public T delete(T t) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(t);
		return t;
	}
}
