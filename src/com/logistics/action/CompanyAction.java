package com.logistics.action;

import java.util.List;

import com.logistics.domain.Company;
import com.logistics.service.ICompanyService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class CompanyAction extends BaseAction implements ModelDriven<Company> {

	private Company company;
	private ICompanyService companyService;
	
	
	public void setCompany(Company company) {
		this.company = company;
	}


	public void setCompanyService(ICompanyService companyService) {
		this.companyService = companyService;
	}

	public String findAll() throws Exception{
		List<Company> lstCompanys = this.companyService.findAll();
		this.getRequest().setAttribute("lstCompanys", lstCompanys);
		return Action.SUCCESS;
		
	}
	@Override
	public Company getModel() {
		// TODO Auto-generated method stub
		return this.company;
	}

}
