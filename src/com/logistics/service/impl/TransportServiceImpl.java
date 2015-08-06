package com.logistics.service.impl;

import com.logistics.dao.ITransportDao;
import com.logistics.domain.Transport;
import com.logistics.service.ITransportService;

public class TransportServiceImpl implements ITransportService {
	
	private ITransportDao transportDao;
	
	

	public ITransportDao getTransportDao() {
		return transportDao;
	}



	public void setTransportDao(ITransportDao transportDao) {
		this.transportDao = transportDao;
	}



	@Override
	public boolean add(Transport transport) {
		// TODO Auto-generated method stub
		return this.transportDao.insert(transport) != null ? true : false;
	}

}
