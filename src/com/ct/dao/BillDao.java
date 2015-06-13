package com.ct.dao;

import java.util.List;

import com.ct.annotation.MyBatisRepository;
import com.ct.entity.Bill;
import com.ct.entity.BillItem;
import com.ct.entity.page.Page;
@MyBatisRepository
public interface BillDao {
	//��������ҳ��ѯ
	List<Bill> findPage( Page page) throws DAOException;
	//������ͳ��ҳ��
	Integer totalPages(	Page page) throws DAOException;
	//����ID���¼
	Bill findId(Integer bill_id) throws DAOException;
	
	//-------------------------------------------------------------
	
	//�����˵��ŷ�ҳ��ѯ
	List<BillItem> findBillItemPage(Integer bill_id) throws DAOException;
	//�����˵���ͳ��ҳ��
	Integer totalBillItemPage(Page page) throws DAOException;
	//����serviceId���·�ͳ��ʱ��
	Integer duraction(Page page) throws DAOException;
		
	
	

}
