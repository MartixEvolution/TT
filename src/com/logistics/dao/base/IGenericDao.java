package com.logistics.dao.base;

import java.io.Serializable;
import java.util.List;

public interface IGenericDao<T extends Serializable, ID extends Serializable>{
	//声明一个通用的实现数据库添加的操作
	public abstract T insert(final T entity);
	//声明一个通用的实现查询的操作
	public abstract List<T> selectAll();
	//声明一个通用的按照ID主键查询检索
	public abstract T selectById(final ID id);
	//声明一个通用的实现数据库更新的操作
	public abstract int update(final T entity);
	//声明一个通用的实现数据库删除的操作
	public abstract int delete(final ID id);
	//声明一个通用的条件查询方法
	public abstract List<T> select(final String condision); 
	
	

}
