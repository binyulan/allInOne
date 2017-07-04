package com.auuid.resourcemanager.menu;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.auuid.base.dao.BaseDao;

@Repository
public class ModuleDao extends BaseDao<Module>{
	
	public List<Module> getRootModules() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Module where parent_id is null");
		return query.list();
	}
	
}
