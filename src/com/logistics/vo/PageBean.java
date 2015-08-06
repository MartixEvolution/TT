package com.logistics.vo;
import java.util.List;

public class PageBean {
	private int pagesize;
	private int rowcount;
	private int pagecount;
	private int currpage;
	private List date;
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getRowcount() {
		return rowcount;
	}
	public void setRowcount(int rowcount) {
		this.rowcount = rowcount;
	}
	public int getPagecount() {
		return rowcount%pagesize==0?rowcount/pagesize:rowcount/pagesize+1;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	public int getCurrpage() {
		return currpage;
	}
	public void setCurrpage(int currpage) {
		this.currpage = currpage;
	}
	public List getDate() {
		return date;
	}
	public void setDate(List date) {
		this.date = date;
	}
	
}
