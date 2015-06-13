package com.ct.dao;

import java.util.List;
import java.util.Map;

import com.ct.annotation.MyBatisRepository;
import com.ct.entity.Service;
import com.ct.entity.ServiceDetail;
import com.ct.entity.page.Page;

@MyBatisRepository
public interface ServiceDao {

	List<Map<String, Object>> findByPage(Page page);

	int findRows(Page page);
	
	void updateStatus(Service service);
	
	void pauseByAccount(int accountId);
	
	void deleteByAccount(int accountId);
	
	Service findById(int id);
	
	void save(Service service);
	
	void update(Service service);
	
	Map<String,Object> findServicedetailById(int id);
	
	List<ServiceDetail> findService_Detail(Page page);
	
	int findService_DetailRows(Page page);

}
