package com.logistics.service.impl;

import java.util.List;

import com.logistics.dao.ITrackDao;
import com.logistics.domain.Bizlist;
import com.logistics.domain.Track;
import com.logistics.service.ITrackService;

public class TrackServiceImpl implements ITrackService {
	
	private ITrackDao trackDao;

	public ITrackDao getTrackDao() {
		return trackDao;
	}
	public void setTrackDao(ITrackDao trackDao) {
		this.trackDao = trackDao;
	}

	@Override
	public boolean add(Track track) {
		// TODO Auto-generated method stub
		return this.trackDao.insert(track)!=null ? true : false;
	}
	
}
