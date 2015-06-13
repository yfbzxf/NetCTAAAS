package com.ct.dao;

import java.util.List;

import com.ct.annotation.MyBatisRepository;
import com.ct.entity.Cost;
import com.ct.entity.page.Page;

@MyBatisRepository
public interface CostDao {

	List<Cost> findAll();

	void save(Cost cost);

	Cost findById(int id);

	void update(Cost cost);

	void delete(int id);
	
	List<Cost> findByPage(Page page);
	
	int findRows();

}
