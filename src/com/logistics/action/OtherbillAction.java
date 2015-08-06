package com.logistics.action;

import com.logistics.domain.Otherbill;
import com.logistics.service.IOtherbillService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class OtherbillAction extends BaseAction implements
		ModelDriven<Otherbill> {
	
	private Otherbill otherbill;
	private IOtherbillService otherbillService;
	
	public void setOtherbill(Otherbill otherbill) {
		this.otherbill = otherbill;
	}

	public void setOtherbillService(IOtherbillService otherbillService) {
		this.otherbillService = otherbillService;
	}

	@Override
	public Otherbill getModel() {
		// TODO Auto-generated method stub
		return this.otherbill;
	}
	public String add() throws Exception{
		boolean flag = this.otherbillService.add(otherbill);
		return flag? Action.SUCCESS : Action.ERROR;
		
	}

}
