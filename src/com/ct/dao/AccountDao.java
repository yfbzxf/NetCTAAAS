package com.ct.dao;

import java.util.List;

import com.ct.annotation.MyBatisRepository;
import com.ct.entity.Account;
import com.ct.entity.page.Page;

@MyBatisRepository
public interface AccountDao {

	List<Account> findByPage(Page page);

	int findRows(Page page);
	
	void updateStatus(Account account);
	
	Account findById(int id);

	void update(Account account);

	void save(Account account);
	
	Account findByIdcardNo(String idcardNo);
	
}
