package com.auuid.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.auuid.resourcemanager.menu.Module;

public class BaseDaoTest {

	private Session session;
	private Transaction transaction;
	Logger logger = LoggerFactory.getLogger(BaseDaoTest.class);
	@Before
	public void init(){
		session = HibernateUtil.getSessionFactory().openSession();
		transaction = session.beginTransaction();
	}
	
	@Test
	public void testSave() {
		try {
			Module m = new Module();
			m.setName("parent");
//			Set<Module> children = new HashSet<>();
//			Module child = new Module();
//			child.setName("children");
//			children.add(child);
//			
//			child = new Module();
//			child.setName("children");
//			children.add(child);
//			
			//m.setChildren(children);
			session.save(m);
		} catch (HibernateException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			throw e;
		}
	}

	@After
	public void destory(){
		transaction.commit();
		session.close();
	}
}
