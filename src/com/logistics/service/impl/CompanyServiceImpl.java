package com.logistics.service.impl;

import java.util.List;

import com.logistics.dao.ICompanyDao;
import com.logistics.domain.Company;
import com.logistics.service.ICompanyService;

public class CompanyServiceImpl implements ICompanyService {

	private ICompanyDao companyDao;
	
	public ICompanyDao getCompanyDao() {
		return companyDao;
	}

	public void setCompanyDao(ICompanyDao companyDao) {
		this.companyDao = companyDao;
	}

	@Override
	public List<Company> findAll() {
		// TODO Auto-generated method stub
		return this.companyDao.selectAll();
	}

}
