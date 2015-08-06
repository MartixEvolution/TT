package com.logistics.dao.base;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class HibernateGenericDaoImpl<T extends Serializable, ID extends Serializable>
		implements IGenericDao<T, ID> {

	@SuppressWarnings("unused")
	// ¥Ê∑≈¿‡–Õ
	private Class<T> clazz;
	protected SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@SuppressWarnings("unchecked")
	public HibernateGenericDaoImpl() {
		super();
		this.clazz = (Class<T>) ((ParameterizedType) this.getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	public T insert(T entity) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(entity);
		transaction.commit();
		return entity;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> selectAll() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(this.clazz);
		return criteria.list();
	}

	@Override
	public T selectById(ID id) {
		Session session = this.sessionFactory.openSession();
		// TODO Auto-generated method stub
		T entity = (T) session.get(this.clazz, id);
		return entity;
	}

	@Override
	public int update(T entity) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(entity);
		transaction.commit();
		return 0;
	}

	@Override
	public int delete(ID id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		T entity = this.selectById(id);
		session.delete(entity);
		transaction.commit();
		return 0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> select(String condision) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		System.out.println("condision>>>"+condision);
		//createQuery("from table_name")
		Query query=session.createSQLQuery(condision).addEntity(clazz);	
		return query.list();
	}

}












