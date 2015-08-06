package com.logistics.action;

import com.logistics.domain.Transport;
import com.logistics.service.ITransportService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class TransportAction extends BaseAction implements
		ModelDriven<Transport> {
	
	private Transport transport;
	private ITransportService transportService;

	public void setTransport(Transport transport) {
		this.transport = transport;
	}

	public void setTransportService(ITransportService transportService) {
		this.transportService = transportService;
	}


	@Override
	public Transport getModel() {
		// TODO Auto-generated method stub
		return this.transport;
	}
	
	public String add() throws Exception{
		boolean flag = this.transportService.add(transport);
		return flag ? Action.SUCCESS : Action.ERROR;		
	}

}
