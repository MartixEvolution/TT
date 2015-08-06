package com.logistics.action;

import java.util.List;

import com.logistics.domain.Bizlist;
import com.logistics.service.IBizlistService;
import com.logistics.vo.CommonUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class BizlistAction extends BaseAction implements ModelDriven<Bizlist> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Bizlist bizlist;
	private IBizlistService bizlistService;
	
	

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}
	
	/**
	 * add bizlist method
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception{
		System.out.println(bizlist.toString());
		boolean flag = this.bizlistService.add(bizlist);
		System.out.println("bizlist.getorderno:"+bizlist.getCompanyname());
		return flag? Action.SUCCESS : Action.ERROR;
		
	}
	
	public String findAll() throws Exception{
		List<Bizlist> lstBizlists = this.bizlistService.findAll();
		System.out.println("lstBizlists>>=="+lstBizlists.toString());
		this.getRequest().setAttribute("lstBizlists", lstBizlists);
//		CommonUtil.toBeJson(lstBizlists, lstBizlists.size());
//		System.out.println("2222222222222222222");
		return Action.SUCCESS;
		
	}
	
	public String findOrder() throws Exception{
		List<Bizlist> lstOrders = this.bizlistService.findOrder();
		System.out.println("lstOrders>>=="+lstOrders.toString());
		this.getRequest().setAttribute("lstOrders", lstOrders);
		return Action.SUCCESS;
	}
	
	public String search() throws Exception{
		//获取页面参数
		String str1 = this.getRequest().getParameter("orderno");
		String str2 = this.getRequest().getParameter("clientno");	
		String str3 = this.getRequest().getParameter("startdate");
		System.out.println("str1>>"+str1+" str2>>"+str2+" str3>>"+str3);
		List<Bizlist> lstBizlists = this.bizlistService.search(str1, str2, str3);
		this.getRequest().setAttribute("lstBizlists", lstBizlists);
		return Action.SUCCESS;		
	}
	
	public String bizlist_delete() throws Exception{
		System.out.println("delete method invoke");
		int bid = Integer.parseInt(this.getRequest().getParameter("bid"));
		System.out.println("bid>>>"+bid);
		boolean flag = this.bizlistService.del(bid);
		return flag? Action.SUCCESS : Action.ERROR;		
	}

	public String  bizlist_edit() throws Exception
	{
		System.out.println("edit method invoke");
		int bid = Integer.parseInt(this.getRequest().getParameter("bid"));
		System.out.println("bid>>"+bid);
		Bizlist bizlist = this.bizlistService.findById(bid);
		this.getRequest().setAttribute("bizlist", bizlist);
		boolean flag = this.bizlistService.edit(bid);
		return flag? Action.SUCCESS : Action.ERROR;
	}
	
	public void setBizlist(Bizlist bizlist) {
		this.bizlist = bizlist;
	}

	public void setBizlistService(IBizlistService bizlistService) {
		this.bizlistService = bizlistService;
	}

	@Override
	public Bizlist getModel() {
		// TODO Auto-generated method stub
		return this.bizlist;
	}
	

	
}
