package com.logistics.action;


import java.util.List;

import com.logistics.domain.Bizlist;
import com.logistics.domain.Track;
import com.logistics.service.IBizlistService;
import com.logistics.service.ITrackService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class TrackAction extends BaseAction implements ModelDriven<Track> {

	private Track track;
	private ITrackService trackService;


	public void setTrack(Track track) {
		this.track = track;
	}
	
	


	public void setTrackService(ITrackService trackService) {
		this.trackService = trackService;
	}
	


	@Override
	public Track getModel() {
		// TODO Auto-generated method stub
		return this.track;
	}
	public String add() throws Exception{
		boolean flag = this.trackService.add(track);
		return flag ? Action.SUCCESS : Action.ERROR;
		
	}
	
	
}
