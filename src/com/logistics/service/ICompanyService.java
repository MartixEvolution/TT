package com.logistics.service;

import java.util.List;

import com.logistics.domain.Company;

public interface ICompanyService {
	
	public abstract List<Company> findAll();

}
