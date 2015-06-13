package com.ct.dao;

import java.util.List;
import java.util.Map;

import com.ct.annotation.MyBatisRepository;
import com.ct.entity.Admin;
import com.ct.entity.Module;
import com.ct.entity.page.Page;

@MyBatisRepository
public interface AdminDao {

	List<Admin> findByPage(Page page);

	int findRows(Page page);

	void updatePassword(Map<String, Object> param);
	
	void updatePasswordByAdmin(Admin admin);

	Admin findById(int id);

	void saveAdmin(Admin admin);

	void saveAdminRoles(Map<String, Object> adminRoles);

	void updateAdmin(Admin admin);

	void deleteAdminRoles(int adminId);

	void deleteAdmin(int id);
	
	Admin findByCode(String adminCode);
	
	List<Module> findModulesByAdmin(int adminId);

}
