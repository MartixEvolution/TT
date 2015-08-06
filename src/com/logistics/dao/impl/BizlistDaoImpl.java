package com.logistics.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.logistics.dao.IBizlistDao;
import com.logistics.dao.base.HibernateGenericDaoImpl;
import com.logistics.dao.base.IGenericDao;
import com.logistics.domain.Bizlist;

public class BizlistDaoImpl extends HibernateGenericDaoImpl<Bizlist, Integer>
		implements IBizlistDao {



}
