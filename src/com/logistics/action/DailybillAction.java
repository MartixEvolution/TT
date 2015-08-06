package com.logistics.action;

import com.logistics.domain.Dailybill;
import com.logistics.service.IDailybillService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class DailybillAction extends BaseAction implements
		ModelDriven<Dailybill> {
	
	private Dailybill dailybill;
	private IDailybillService dailybillService;	

	public Dailybill getDailybill() {
		return dailybill;
	}

	public void setDailybill(Dailybill dailybill) {
		this.dailybill = dailybill;
	}



	public IDailybillService getDailybillService() {
		return dailybillService;
	}

	public void setDailybillService(IDailybillService dailybillService) {
		this.dailybillService = dailybillService;
	}

	@Override
	public Dailybill getModel() {
		// TODO Auto-generated method stub		
		return this.dailybill;
	}
	
	public String add() throws Exception{
		boolean flag = this.dailybillService.add(dailybill);
		return flag? Action.SUCCESS : Action.ERROR;
		
	}

}
