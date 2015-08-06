package com.logistics.service.impl;

import java.util.List;

import com.logistics.dao.IBizlistDao;
import com.logistics.dao.base.IGenericDao;
import com.logistics.domain.Bizlist;
import com.logistics.service.IBizlistService;

public class BizlistServiceImpl implements IBizlistService {
	
	private IBizlistDao bizlistDao;	

	public IBizlistDao getBizlistDao() {
		return bizlistDao;
	}
	
	public void setBizlistDao(IBizlistDao bizlistDao) {
		this.bizlistDao = bizlistDao;
	}

	@Override
	public boolean add(Bizlist biz) {
		// TODO Auto-generated method stub
		return this.bizlistDao.insert(biz) != null ? true :false;
	}

	@Override
	public List<Bizlist> findAll() {
		// TODO Auto-generated method stub
		return this.bizlistDao.selectAll();
	}

	@Override
	public List<Bizlist> findOrder() {
		// TODO Auto-generated method stub
	//	System.out.println("========================="+this.bizlistDao.selectAll().get(2)); 
		return  this.bizlistDao.selectAll();
	}

	@Override
	public List<Bizlist> search(String str1, String str2, String str3) {
		// TODO Auto-generated method stub		
			String hql= "select * from bizlist ";
			boolean judge = false;
			if (str1 != null && !str1.trim().equals("")) {
				hql+=" where orderno ='"+str1+"'";			
				judge = true;
			}
			if (str2 != null && !str2.trim().equals("")) {
				if (judge) {
					hql+=" and clientno ='"+str2+"'";
					judge = false;
				} else {
					hql+=" where clientno ='"+str2+"'";
					judge = true;
				}
			}
			if (str3 != null && !str3.trim().equals("")) {
				if (judge) {
					hql+=" and startdate ='"+str3+"'";
					judge = false;
				} else {
					hql+=" where startdate ='"+str3+"'";
					judge = true;
				}
			}	
			List<Bizlist> lists = this.bizlistDao.select(hql);
			for(Bizlist list : lists){
				System.out.println(list.toString());
			}
		return this.bizlistDao.select(hql);
	}

	@Override
	public boolean del(int id) {
		// TODO Auto-generated method stub
		return this.bizlistDao.delete(id) == 0 ? true : false ;
	}

	@Override
	public boolean edit(int id) {
		// TODO Auto-generated method stub
		Bizlist bizlist = this.bizlistDao.selectById(id);
		
		return this.bizlistDao.update(bizlist) == 0 ? true : false;
	}

	@Override
	public Bizlist findById(int id) {
		// TODO Auto-generated method stub
		return this.bizlistDao.selectById(id);
	}





}
