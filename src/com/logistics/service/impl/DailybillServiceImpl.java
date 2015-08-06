package com.logistics.service.impl;

import com.logistics.dao.IDailybillDao;
import com.logistics.domain.Dailybill;
import com.logistics.service.IDailybillService;

public class DailybillServiceImpl implements IDailybillService {

	private IDailybillDao dailybillDao;
	
	
	public IDailybillDao getDailybillDao() {
		return dailybillDao;
	}


	public void setDailybillDao(IDailybillDao dailybillDao) {
		this.dailybillDao = dailybillDao;
	}


	@Override
	public boolean add(Dailybill dailybill) {
		// TODO Auto-generated method stub
		return this.dailybillDao.insert(dailybill) != null ? true :false;
	}

}
