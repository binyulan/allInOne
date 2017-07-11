package com.auuid.resourcemanager.dynamictable;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.auuid.base.dao.BaseDao;

@Repository
public class DynamicTableDao extends BaseDao<DynamicTable>{

	public DynamicTable getByMenuId(Long menuId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DynamicTable where menu_id=:menuId");
		query.setParameter("menuId", menuId);
		return (DynamicTable) query.uniqueResult();
	}}
