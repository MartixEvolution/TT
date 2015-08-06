package com.logistics.service;

import java.util.List;

import com.logistics.domain.Bizlist;

public interface IBizlistService {
	
	public abstract boolean add(final Bizlist biz);
	public abstract List<Bizlist> findAll();
	public abstract List<Bizlist> findOrder();
	public abstract Bizlist findById(final int id);
	public abstract List<Bizlist> search(String str1,String str2,String str3);
	public abstract boolean del(final int id);
	public abstract boolean edit(final int id);

}
