package com.ct.dao;

import java.util.List;

import com.ct.annotation.MyBatisRepository;
import com.ct.entity.Bill;
import com.ct.entity.BillItem;
import com.ct.entity.page.Page;
@MyBatisRepository
public interface BillDao {
	//多条件分页查询
	List<Bill> findPage( Page page) throws DAOException;
	//多条件统计页数
	Integer totalPages(	Page page) throws DAOException;
	//根据ID查记录
	Bill findId(Integer bill_id) throws DAOException;
	
	//-------------------------------------------------------------
	
	//根据账单号分页查询
	List<BillItem> findBillItemPage(Integer bill_id) throws DAOException;
	//根据账单号统计页数
	Integer totalBillItemPage(Page page) throws DAOException;
	//根据serviceId和月份统计时间
	Integer duraction(Page page) throws DAOException;
		
	
	

}
